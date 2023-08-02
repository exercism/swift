import Foundation
import Stencil

class GeneratorPlugins {
  func getPlugins() -> Environment {
    let ext = Extension()

    ext.registerFilter("isNull") { (value: Any?) in
      return NSNull().isEqual(value)
    }

    ext.registerFilter("camelCase") { (value: Any?) in
      if let inputString = value as? String {
        let charactersToRemove: [Character] = [",", "'", "?", "!", "." ]
        let filteredString = inputString.filter { !charactersToRemove.contains($0) }
        let components = filteredString.components(separatedBy: CharacterSet(charactersIn: " -"))
        let capitalizedComponents = components.map { $0.capitalized }
        let camelCaseString = capitalizedComponents.joined()
        return camelCaseString
      }
      return nil
    }

    ext.registerFilter("contains") { (value: Any?, args: [Any?]) in
      if let inputString = value as? String {
        if let substring = args.first as? String {
          return inputString.contains(substring)
        }
      } else if let inputArray = value as? [String] {
        if let string = args.first as? String {
          return inputArray.contains(string)
        }
      } else if let inputArray = value as? [Int] {
        if let number = args.first as? Int {
          return inputArray.contains(number)
        }
      }
      return false
    }

    ext.registerFilter("any") { (value: Any?, args: [Any?]) in
      if let inputArray = value as? [Int] {
        if let rule = args.first as? String {
          switch rule {
          case "isEven":
            return inputArray.contains { $0 % 2 == 0 }
          case "isOdd":
            return inputArray.contains { $0 % 2 != 0 }
          case "isNegative":
            return inputArray.contains { $0 < 0 }
          case "isPositive":
            return inputArray.contains { $0 > 0 }
          default:
            return false
          }
        }
      }
      return false
    }

    ext.registerFilter("toStringArray") { (value: Any?) in
      if let inputString = value as? [String] {
        guard !inputString.isEmpty else { return "[]" }
        return "[\"\(inputString.joined(separator: "\", \""))\"]"
      }
      return nil
    }

    ext.registerFilter("toStringDictionary") { (value: Any?) in
      if let inputDictionary = value as? [String: String] {
        guard !inputDictionary.isEmpty else { return "[:]" }
        var output = "["
        for (key, value) in inputDictionary.sorted( by: { $0.0 < $1.0 }) {
          output += "\"\(key)\": \"\(value)\", "
        }
        output.removeLast(2)
        output += "]"
        return output
      }
      if let inputDictionary = value as? [String: Int] {
        guard !inputDictionary.isEmpty else { return "[:]" }
        var output = "["
        for (key, value) in inputDictionary.sorted( by: { $0.0 < $1.0 }) {
          output += "\"\(key)\": \(value), "
        }
        output.removeLast(2)
        output += "]"
        return output
      }
      if let inputDictionary = value as? [String: [String]] {
        guard !inputDictionary.isEmpty else { return "[:]" }
        var output = "["
        for (key, value) in inputDictionary.sorted( by: { $0.0 < $1.0 }) {
          output += "\"\(key)\": [\"\(value.joined(separator: "\", \""))\"], "
        }
        output.removeLast(2)
        output += "]"
        return output
      }
      return nil
    }
    
    ext.registerFilter("inspect") {(value: Any?) in
      if let inputString = value as? String {
        let escapechars = ["\t" : "\\t", "\n" : "\\n", "\r": "\\r", "\\" : "\\\\"]
        return inputString.map { escapechars[String($0)] ?? String($0) }.joined()
      }
      return nil
    }

    ext.registerFilter("minus") { (value: Any?, args: [Any?]) in
      if let inputNumber = value as? Int {
        if let number = args.first as? Int {
          return inputNumber - number
        }
      }
      return nil
    }

    let environment = Environment(extensions: [ext])
    return environment
  }
}
