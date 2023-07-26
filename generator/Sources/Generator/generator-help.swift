import Foundation
import FoundationNetworking
import TOMLKit

class GeneratorHelp {
  var exercise: String
  var filePath: String
  var json: [String: Any] = [:]
  var uuids: [String] = []

  init(exercise: String, filePath: String) {
    self.exercise = exercise
    self.filePath = filePath
  }

  func getRemoteFiles() throws {
    var url: URL
    do {
      url = URL(
        string:
          "https://raw.githubusercontent.com/exercism/problem-specifications/master/exercises/\(exercise)/canonical-data.json"
      )!
    } catch {
      throw GeneratorError.remoteError("No remote file found")
    }
    let data = try String(contentsOf: url) ?? ""
    let fileData = Data(data.utf8)
    json = try JSONSerialization.jsonObject(with: fileData, options: []) as? [String: Any] ?? [:]
  }

  func toml() throws {
    var toml = ""
    do {
      toml =
        try NSString(
          contentsOfFile: "\(filePath)/.meta/tests.toml",
          encoding: String.Encoding.ascii.rawValue) as String
    } catch {
      throw GeneratorError.noFile("No toml file found")
    }
    let table = try TOMLTable(string: toml)
    for (key, value) in table {
      uuids.append(key)
      let table = value.table ?? [:]
      for (key, value) in table {
        if key.debugDescription == "include" && value.debugDescription == "false" {
          uuids.removeLast()
        }
      }
    }
  }

  func checkConfig() throws -> Bool {
    var fileData: Data
    var fileInfo: String
    do {
      fileInfo =
        try NSString(
          contentsOfFile: "./config.json",
          encoding: String.Encoding.ascii.rawValue) as String
      fileData = Data(fileInfo.utf8)
    } catch {
      throw GeneratorError.noFile("Track config file not found")
    }
    if let json = try JSONSerialization.jsonObject(with: fileData, options: []) as? [String: Any] {
      if let exercises = json["exercises"] as? [String: Any] {
        if let practice = exercises["practice"] as? [[String: Any]] {
          for exercise in practice {
            if let slug = exercise["slug"] as? String {
              if slug == self.exercise {
                return true
              }
            }
          }
        }
      }
    }
    throw GeneratorError.noExercise("Exercise not found")
  }

  func removeTestCases() throws {
    var cases: [[String: Any]] = []
    if let tests = json["cases"] as? [[String: Any]] {
      for test in tests {
        if let uuid = test["uuid"] as? String {
          if uuids.contains(uuid) {
            cases.append(test)
          }
        }
        if let subCases = test["cases"] as? [[String: Any]] {
          var subCases2: [[String: Any]] = []
          for subCase in subCases {
            if let uuid = subCase["uuid"] as? String {
              if uuids.contains(uuid) {
                subCases2.append(subCase)
              }
            }
          }
          cases.append(["cases": subCases2])
        }
      }
    }
    json["cases"] = cases
  }
}
