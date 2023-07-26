import Foundation
import Stencil
import SwiftFormat
import SwiftFormatConfiguration

enum GeneratorError: Error {
  case invalidArgumentCount
  case noDirectory(String)
  case noFile(String)
  case noExercise(String)
  case remoteError(String)
}

class Generator {
  var generatorHelp: GeneratorHelp
  var filePath: String
  var exercise: String

  init(exercise: String, filePath: String = "") {
    var filePath = filePath
    if filePath.isEmpty {
      filePath = "./exercises/practice/\(exercise)"
    }
    self.generatorHelp = GeneratorHelp(exercise: exercise, filePath: filePath)
    self.filePath = filePath
    self.exercise = exercise
  }

  func run() throws {
    try generatorHelp.checkConfig()
    try generatorHelp.toml()
    try generatorHelp.getRemoteFiles()
    try generatorHelp.removeTestCases()
    guard directoryExists(atPath: "\(filePath)/Tests") else {
      throw GeneratorError.noDirectory("Tests directory not found: \(filePath)")
    }
    var template = try loadTemplate()
    let environment = GeneratorPlugins().getPlugins()
    template = try environment.renderTemplate(string: template, context: generatorHelp.json)
    let path = try getTestPath()

    var text = ""
    let configuration = Configuration()
    let swiftFormat = SwiftFormatter(configuration: configuration)
    try swiftFormat.format(source: template, assumingFileURL: nil, to: &text)
    try text.write(toFile: path, atomically: true, encoding: .utf8)
  }

  func loadTemplate() throws -> String {
    var fileInfo: String
    do {
      fileInfo =
        try NSString(
          contentsOfFile: "\(filePath)/.meta/template.swift",
          encoding: String.Encoding.ascii.rawValue) as String
    } catch {
      throw GeneratorError.noFile("No template file found")
    }
    return fileInfo
  }

  private func directoryExists(atPath path: String) -> Bool {
    var isDirectory: ObjCBool = true
    let fileManager = FileManager.default
    let exists = fileManager.fileExists(atPath: path, isDirectory: &isDirectory)
    return exists && isDirectory.boolValue
  }

  private func getTestPath() throws -> String {
    var fileData: Data
    var fileInfo: String
    do {
      fileInfo =
        try NSString(
          contentsOfFile: "\(filePath)/.meta/config.json",
          encoding: String.Encoding.ascii.rawValue) as String
      fileData = Data(fileInfo.utf8)
    } catch {
      throw GeneratorError.noFile("No Exercise config file was found")
    }
    if let json = try JSONSerialization.jsonObject(with: fileData, options: []) as? [String: Any] {
      if let files = json["files"] as? [String: Any] {
        if let tests = files["test"] as? [String] {
          return "\(filePath)/\(tests[0])"
        }
      }
    }
    throw GeneratorError.noFile("Tests file not found")
  }
}

if CommandLine.arguments.count == 3 {
  try Generator(exercise: CommandLine.arguments[1], filePath: CommandLine.arguments[2]).run()
} else if CommandLine.arguments.count == 2 {
  try Generator(exercise: CommandLine.arguments[1]).run()
} else {
  throw GeneratorError.invalidArgumentCount
}
