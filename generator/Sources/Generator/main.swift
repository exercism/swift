import Stencil
import Foundation
//import GeneratorHelp

let environment = Environment()

let context = ["name": "kyle"]
let rendered = try environment.renderTemplate(string: "Hello {{ name }}", context: context)

print(rendered)

enum GeneratorError: Error {
    case invalidArgumentCount
    case noDirectory(String)
    case noFile(String)
    case noExercise(String)
}

class Generator{
  var generatorHelp : GeneratorHelp
  var filePath : String
  var exercise : String

  init(exercise : String, filePath : String = ""){
    var filePath = filePath
    if filePath == "" {
      filePath = "../exercises/practice/\(exercise)"
    }
    self.generatorHelp = GeneratorHelp(exercise: exercise, filePath: filePath)
    self.filePath = filePath
    self.exercise = exercise
  }

  func run () throws {
    try generatorHelp.checkConfig()
    print(try generatorHelp.toml())
    try generatorHelp.getRemoteFiles()
    try generatorHelp.removeTestCases()
    print(generatorHelp.json)
    guard directoryExists(atPath: "\(filePath)/Tests") else { throw GeneratorError.noDirectory("Tests directory not found: \(filePath)")}
  }

  private func directoryExists(atPath path: String) -> Bool {
      var isDirectory: ObjCBool = true
      let fileManager = FileManager.default
      let exists = fileManager.fileExists(atPath: path, isDirectory: &isDirectory)
      return exists && isDirectory.boolValue
  }
}

if CommandLine.arguments.count == 3 {
  try Generator(exercise: CommandLine.arguments[1], filePath: CommandLine.arguments[2]).run()
}else if CommandLine.arguments.count == 2 {
  try Generator(exercise: CommandLine.arguments[1]).run()
}else {
  throw GeneratorError.invalidArgumentCount
}



