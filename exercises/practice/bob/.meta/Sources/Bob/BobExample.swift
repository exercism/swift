import Foundation

class Bob {
  static func response(_ message: String) -> String {
    let trimmedMessage = message.trimmingCharacters(in: .whitespacesAndNewlines)
    let isUppercase =
      trimmedMessage.uppercased() == trimmedMessage && trimmedMessage.lowercased() != trimmedMessage
    if trimmedMessage.isEmpty {
      return "Fine. Be that way!"
    } else if isUppercase && trimmedMessage.last == "?" {
      return "Calm down, I know what I'm doing!"
    } else if isUppercase {
      return "Whoa, chill out!"
    } else if trimmedMessage.last == "?" {
      return "Sure."
    } else {
      return "Whatever."
    }
  }
}
