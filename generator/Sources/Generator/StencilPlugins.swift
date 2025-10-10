import Foundation
import Stencil

enum StencilPlugins {
    
    static let escapeChars = ["\t": "\\t", "\n": "\\n", "\r": "\\r", "\\": "\\\\", "\"": "\\\""]
    
    static func registerPlugins() -> Environment {
        let ext = Extension()
        
        ext.registerFilter("isNull") { (value: Any?) in
            return NSNull().isEqual(value)
        }
        
        ext.registerFilter("jsonString") { (value: Any?) in
            guard let value = value as? [String: Any] else { return nil }
            let json = try JSONSerialization.data(withJSONObject: value, options: [.sortedKeys])
            guard let jsonString = String(data: json, encoding: .utf8) else { return nil }
            return jsonString.map { Self.escapeChars[String($0)] ?? String($0) }.joined()
        }
        
        ext.registerFilter("camelCase") { (value: Any?) in
            if let inputString = value as? String {
                let charactersToRemove: [Character] = [
                    ",", "'", "?", "!", ".", "=", "+", "&", "%", "$", "#", "@", "(", ")", "[", "]", "{", "}",
                    "<", ">", "/", "|", ":", ";",
                ]
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
            } else if let inputDict = value as? [String: Any] {
                if let string = args.first as? String {
                    return inputDict.keys.contains(string)
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
            } else if let array = value as? [Any?] {
                return array
            }
            
            return nil
        }
        
        ext.registerFilter("toStringDictionary") { (value: Any?) in
            if let inputDictionary = value as? [String: String] {
                guard !inputDictionary.isEmpty else { return "[:]" }
                var output = "["
                for (key, value) in inputDictionary.sorted(by: { $0.0 < $1.0 }) {
                    output += "\"\(key)\": \"\(value)\", "
                }
                output.removeLast(2)
                output += "]"
                return output
            }
            if let inputDictionary = value as? [String: Int] {
                guard !inputDictionary.isEmpty else { return "[:]" }
                var output = "["
                for (key, value) in inputDictionary.sorted(by: { $0.0 < $1.0 }) {
                    output += "\"\(key)\": \(value), "
                }
                output.removeLast(2)
                output += "]"
                return output
            }
            if let inputDictionary = value as? [String: [String]] {
                guard !inputDictionary.isEmpty else { return "[:]" }
                var output = "["
                for (key, value) in inputDictionary.sorted(by: { $0.0 < $1.0 }) {
                    output += "\"\(key)\": [\"\(value.joined(separator: "\", \""))\"], "
                }
                output.removeLast(2)
                output += "]"
                return output
            }
            return nil
        }
        
        ext.registerFilter("inspect") { (value: Any?) in
            if let inputString = value as? String {
                return inputString.map { Self.escapeChars[String($0)] ?? String($0) }.joined()
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
        
        ext.registerFilter("toTupleArray") { (value: Any?) in
            if let inputArray = value as? [[String]] {
                guard !inputArray.isEmpty else { return "[]" }
                var output = "["
                for array in inputArray {
                    output += "(\(array.map { "\"\($0)\"" }.joined(separator: ", "))), "
                }
                output.removeLast(2)
                output += "]"
                return output
            }
            if let inputArray = value as? [[Int]] {
                guard !inputArray.isEmpty else { return "[]" }
                var output = "["
                for array in inputArray {
                    output += "(\(array.map { "\($0)" }.joined(separator: ", "))), "
                }
                output.removeLast(2)
                output += "]"
                return output
            }
            
            return nil
        }
        
        ext.registerFilter("extractCountKey") { (value: Any?) in
            if let inputDictionary = value as? [String: Any] {
                if let count = inputDictionary["count"] as? Int {
                    return count
                }
            }
            return nil
        }
        
        ext.registerFilter("toNilArray") { (value: Any?) in
            func replaceValuesWithNil(_ array: [Any?]) -> [Any?] {
                var result = [Any?]()
                for element in array {
                    if let nestedArray = element as? [Any?] {
                        result.append(replaceValuesWithNil(nestedArray))
                    } else {
                        if NSNull().isEqual(element) {
                            result.append(nil)
                        } else {
                            result.append(element)
                        }
                        
                    }
                }
                
                return result
            }
            if let inputArray = value as? [Any?] {
                return replaceValuesWithNil(inputArray)
            }
            
            return nil
        }
        
        ext.registerFilter("length") { (value: Any?) in
            if let inputString = value as? String {
                return inputString.count
            }
            if let inputArray = value as? [Any?] {
                return inputArray.count
            }
            if let inputDictionary = value as? [String: Any?] {
                return inputDictionary.count
            }
            return nil
        }
        
        ext.registerFilter("toEnumArray") { (value: Any?) in
            if let inputArray = value as? [String] {
                guard !inputArray.isEmpty else { return "[]" }
                var output = "["
                for element in inputArray {
                    output += ".\(element), "
                }
                output.removeLast(2)
                output += "]"
                return output
            }
            return nil
        }
        
        ext.registerFilter("strain") { (value: Any?) in
            if let input = value as? String {
                if input.contains("starts_with") {
                    return "{x in x.starts(with: \"z\")}"
                } else if input.contains("contains") {
                    return "{x in x.contains(5)}"
                }
                let trimmedInput = input.replacingOccurrences(of: "fn(x) -> ", with: "")
                return "{x in \(trimmedInput)}"
            }
            return []
        }
        
        ext.registerFilter("round") { (value: Any?, args: [Any?]) in
            if let inputNumber = value as? Int {
                return inputNumber
            }
            if let inputNumber = value as? Double {
                if let precision = args.first as? Int {
                    let divisor = pow(10.0, Double(precision))
                    return (inputNumber * divisor).rounded() / divisor
                }
            }
            return nil
        }
        
        ext.registerFilter("knapsackItem") { (value: Any?) in
            if let item = value as? [String: Any] {
                let itemWeight = String(describing: item["weight", default: ""])
                let itemValue = String(describing: item["value", default: ""])
                return "Item(weight:\(itemWeight), value:\(itemValue))"
            }
            return "// Something else ..."
        }
        
        ext.registerFilter("complexNumber") { (value: Any?) in
            if let input = value as? String {
                switch input {
                case "pi":
                    return "Double.pi"
                case "e":
                    return "exp(1)"
                case "ln(2)":
                    return "log(2)"
                case "ln(2)/2":
                    return "log(2)/2"
                case "pi/4":
                    return "Double.pi/4"
                default:
                    return input
                }
            }
            return value
        }
        
        ext.registerFilter("listOps") { (value: Any?) in
            if let inputString = value as? String {
                return inputString.replacingOccurrences(of: "foldl", with: "foldLeft")
                    .replacingOccurrences(of: "foldr", with: "foldRight")
            }
            return nil
        }
        
        ext.registerFilter("defaultArray") { (value: Any?, args ) in
            if let inputArray = value as? [Any?] {
                let type = args.first as? String ?? "Int"
                return inputArray.isEmpty ? "[\(type)]()" : inputArray
            }
            let type = args.first as? String ?? "Int"
            return "[\(type)]()"
        }

        return Environment(extensions: [ext])
    }

}
