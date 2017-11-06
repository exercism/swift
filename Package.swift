import PackageDescription
import Foundation

let path = FileManager.default.currentDirectoryPath + "/config.json"
var allProblems = [String]()

if
    let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: Data.ReadingOptions.mappedIfSafe) ,
    let json = try? JSONSerialization.jsonObject(with: jsonData, options: [])  ,
    let jsonDict = json as? [String: Any],
    let exercisesDict = jsonDict["exercises"] as? [[String: Any]],
    let exercises = exercisesDict.map({ $0["slug"] }) as? [String],
    let deprecated = jsonDict["deprecated"] as? [String] {

    allProblems += exercises
    allProblems += deprecated
} else {
    print("Could not parse config.json at \(path)")
}

let dependencies = allProblems.map { Package.Dependency.Package(url: "./exercises/\($0)/", majorVersion: 1) }

let package = Package(
    name: "xswift",
    dependencies: dependencies
    )
