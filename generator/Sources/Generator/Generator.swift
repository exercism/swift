import Foundation
import ArgumentParser
import SwiftFormat

enum GeneratorError: Error, Equatable {
    case noDirectory(String)
    case noFile(String)
    case noExercise(String)
    case remoteError(String)
    case internalError(String)
}

enum ExerciseKind: String, CaseIterable, ExpressibleByArgument {
    case practice
    case concept
}

@main
struct Generator: AsyncParsableCommand {
    
    // MARK: - Static Properties
    
    static var configuration = CommandConfiguration(
        commandName: "Generator",
        abstract: "A Swift track tool for generating Swift test files for an exercise."
    )
    
    // MARK: - Arguments
    
    @Argument(
        help: "The slug of the exercise to process."
    )
    var exerciseSlug: String
    
    @Option(
        name: [.short, .long],
        help: "The kind of exercise to process. Possible values: \(ExerciseKind.allCases.map { $0.rawValue }.joined(separator: ", "))"
    )
    var exerciseKind: ExerciseKind = .practice
    
    @Option(
        help: """
        The absolute or relative path to the exercise within the track directory.
        Will use exercise kind and track path to calculate if not specified.
        """,
        transform: { URL(filePath: $0).standardizedFileURL }
    )
    var exercisePath: URL?
    
    @Option(
        help: "The absolute or relative path to the track directory. Defaults to the current directory.",
        transform: { URL(filePath: $0).standardizedFileURL }
    )
    var trackDirectoryPath: URL = URL(filePath: FileManager.default.currentDirectoryPath)
    
    // MARK: - Private Properties
    
    private lazy var exerciseDirectoryURL: URL = {
        guard let exercisePath else {
            return trackDirectoryPath.appending(components: "exercises", "\(exerciseKind.rawValue)", "\(exerciseSlug)")
        }
        return exercisePath
    }()
    
    private lazy var trackConfigURL: URL = { trackDirectoryPath.appending(components: "config.json") }()
    private lazy var exerciseConfigURL: URL = { exerciseDirectoryURL.appending(components: ".meta", "config.json") }()
    private lazy var templateURL: URL = { exerciseDirectoryURL.appending(components: ".meta", "template.swift") }()
    private lazy var tomlURL: URL = { exerciseDirectoryURL.appending(components: ".meta", "tests.toml") }()
        
    // MARK: - Internal Methods
    
    mutating func validate() throws {
        try trackDirectoryPath.validateDirectoryExists()
        try trackConfigURL.validateFileExists()
        
        try exerciseDirectoryURL.validateDirectoryExists()
        try exerciseConfigURL.validateFileExists()
        try templateURL.validateFileExists()
        try tomlURL.validateFileExists()
        
        try validateExerciseExist()
    }
    
    mutating func run() async throws {
        let context = try await makeTestContext()
        try generateTestFile(context: context)
    }
    
    // MARK: - Private Methods
    
    private mutating func validateExerciseExist() throws {
        let trackConfig = try TrackConfig(from: trackConfigURL)
        guard trackConfig.checkExistance(slug: exerciseSlug, kind: exerciseKind) else {
            throw GeneratorError.noExercise("No exercise found for \(exerciseSlug) in \(trackConfigURL.path)")
        }
    }

    private mutating func makeTestContext() async throws -> [String: Any] {
        var canonicalData = try await CanonicalData.fetch(slug: exerciseSlug)
        let toml = try TOMLConfig(from: tomlURL)
        canonicalData.whitelistTests(withUUIDs: toml.uuids)
        return canonicalData.context
    }
    
    private mutating func generateTestFile(context: [String: Any]) throws {
        let renderedString = try Stencil.render(template: templateURL, context: context) // canonicalData.jsonData)
        
        let testTargetURL = try getTargetTestFileURL()
    
        var outputText = ""
        let configuration = Configuration()
        let swiftFormat = SwiftFormatter(configuration: configuration)
        try swiftFormat.format(
            source: renderedString,
            assumingFileURL: nil,
            selection: .infinite,
            to: &outputText
        )
        try outputText.write(toFile: testTargetURL.path, atomically: true, encoding: .utf8)
    }
    
    private mutating func getTargetTestFileURL() throws -> URL {
        let config = try ExerciseConfig(from: exerciseConfigURL)
        let testFile = exerciseDirectoryURL.appending(component: try config.getTargetTestFileURL())
        return testFile
    }

}
