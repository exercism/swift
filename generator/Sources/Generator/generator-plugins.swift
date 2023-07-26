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
        let components = inputString.components(separatedBy: CharacterSet(charactersIn: " -"))
        let capitalizedComponents = components.map { $0.capitalized }
        let camelCaseString = capitalizedComponents.joined()
        return camelCaseString
      }
      return nil
    }

    let environment = Environment(extensions: [ext])
    return environment
  }
}
