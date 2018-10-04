// swift-tools-version:4.2

import PackageDescription
import Foundation

extension String {
	var pascalCased: String {
		let items = self.components(separatedBy: "-")
		return items.reduce("", { $0 + $1.capitalized })
	}
}
let currentDirectory = FileManager.default.currentDirectoryPath
let configPath = currentDirectory + "/config.json"
var allProblems = [String]()

if
    let jsonData = try? Data(contentsOf: URL(fileURLWithPath: configPath), options: Data.ReadingOptions.mappedIfSafe),
    let json = try? JSONSerialization.jsonObject(with: jsonData, options: []),
    let jsonDict = json as? [String: Any],
    let exercisesDict = jsonDict["exercises"] as? [[String: Any]],
    let exercises = exercisesDict.map({ $0["slug"] }) as? [String] {
    allProblems += exercises
} else {
    print("Could not parse config.json at \(configPath)")
}
let allProblemsPascalCase = allProblems.map { $0.pascalCased }

#if os(Linux)
// Create ./Tests/LinuxMain.swift
let allTestCases = allProblemsPascalCase.map { "testCase(\($0)Tests.allTests)," }

let linuxMainText =
"""
import XCTest
@testable import xswiftTests

XCTMain([
\(allTestCases.joined(separator: "\n"))
    ])
"""

let linuxMainFilePath = currentDirectory + "/LinuxMain.swift"

do {
    if FileManager.default.fileExists(atPath: linuxMainFilePath) {
        try FileManager.default.removeItem(atPath: linuxMainFilePath)
    }
    try linuxMainText.write(to: URL(fileURLWithPath: linuxMainFilePath), atomically: false, encoding: .utf8)
} catch let fileError {
    print("Could not write file. \(fileError)")
}
#endif

let packageDependencies: [Package.Dependency] = allProblems.map { .package(path: "./exercises/\($0)/") }
let targetDependencies: [Target.Dependency] = allProblemsPascalCase.map { .byName(name:"\($0)") }

let sources  = allProblems.map { "./\($0)/Sources" }
let testSources  = allProblems.map { "./\($0)/Tests" }

let package = Package(
    name: "xswift",
    products: [
        .library(
            name: "xswift",
            targets: ["xswift"]
            )
    ],
    dependencies: packageDependencies,
    targets: [
        .target(
            name: "xswift",
            dependencies: targetDependencies,
            path: "./exercises",
            sources: sources
            ),
        .testTarget(
            name: "xswiftTests",
            dependencies: ["xswift"],
            path: "./exercises",
            sources: testSources
            ),
        ]
    )
