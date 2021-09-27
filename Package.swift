// swift-tools-version:5.3

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
var conceptExercises = [String]()
var practiceExercises = [String]()

if
    let jsonData = try? Data(contentsOf: URL(fileURLWithPath: configPath), options: Data.ReadingOptions.mappedIfSafe),
    let json = try? JSONSerialization.jsonObject(with: jsonData, options: []),
    let jsonDict = json as? [String: Any],
    let exercisesDict = jsonDict["exercises"] as? [String: Any],
    let conceptExercisesDict = exercisesDict["concept"] as? [[String: Any]],
    let conceptExerciseSlugs = conceptExercisesDict.map({ $0["slug"] }) as? [String],
    let practiceExercisesDict = exercisesDict["practice"] as? [[String: Any]],
    let practiceExerciseSlugs = practiceExercisesDict.map({ $0["slug"] }) as? [String]  {
    conceptExercises += conceptExerciseSlugs
    practiceExercises += practiceExerciseSlugs
} else {
    print("Could not parse config.json at \(configPath)")
}

let conceptExerciseTargets: [Target] = conceptExercises.flatMap {
    return [
        .target(
            name:"\($0.pascalCased)", 
            path:"./exercises/concept/\($0)/.meta/ExemplarSources"),
        .testTarget(
            name:"\($0.pascalCased)Tests", 
            dependencies: [
                .target(name:"\($0.pascalCased)")
            ], 
            path:"./exercises/concept/\($0)/Tests",
            exclude: ["LinuxMain.swift"])
    ]
}

let practiceExerciseTargets: [Target] = practiceExercises.flatMap {
    return [
        .target(
            name:"\($0.pascalCased)", 
            path:"./exercises/practice/\($0)/.meta/Sources"),
        .testTarget(
            name:"\($0.pascalCased)Tests", 
            dependencies: [
                .target(name:"\($0.pascalCased)")
            ], 
            path:"./exercises/practice/\($0)/Tests")
    ]
}

let allTargets = conceptExerciseTargets + practiceExerciseTargets

let package = Package(
    name: "xswift",
    products: [
        .library(
            name: "xswift", 
            targets: allTargets.filter { $0.type == .regular }.map { $0.name })
    ],
    targets: allTargets
)
