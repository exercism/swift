import Foundation
import Stencil

class GeneratorPlugins {
  func getPlugins() -> Environment {
    let ext = Extension()

    ext.registerFilter("isNull") { (value: Any?) in
      return NSNull().isEqual(value)
    }

    ext.registerFilter("cammelcase") { (value: Any?) in
      if let inputString = value as? String {
        let charactersToRemove: [Character] = [","]
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

    let environment = Environment(extensions: [ext])
    return environment
  }
}
