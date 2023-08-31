import Foundation

enum WordyError: Error {
  case syntaxError
}

func wordyAnswer(_ question: String) throws -> Int {
  let tokens =
    question
    .replacingOccurrences(of: "What is ", with: "")
    .replacingOccurrences(of: "?", with: "")
    .replacingOccurrences(of: "by ", with: "")
    .split(separator: " ")
    .map(String.init)
  guard !tokens.count.isMultiple(of: 2) else { throw WordyError.syntaxError }
  guard let first = Int(tokens[0]) else { throw WordyError.syntaxError }
  var result = first
  var index = 1
  while index + 1 < tokens.count {
    let token = tokens[index]
    guard let number = Int(tokens[index + 1]) else { throw WordyError.syntaxError }
    switch token {
    case "plus":
      result += number
    case "minus":
      result -= number
    case "multiplied":
      result *= number
    case "divided":
      result /= number
    default:
      throw WordyError.syntaxError
    }
    index += 2
  }
  return result
}
