import Foundation

class AtbashCipher {
  static func encode(_ phrase: String) -> String {
    let letters = Array("abcdefghijklmnopqrstuvwxyz")
    let input = phrase.lowercased().filter { $0.isLetter || $0.isNumber }
    var output = ""
    var count = 0

    for character in input {
      if let index = letters.firstIndex(of: character) {
        output.append(letters[letters.count - index - 1])
      } else {
        output.append(character)
      }

      count += 1

      if count % 5 == 0 {
        output.append(" ")
      }
    }

    return output.trimmingCharacters(in: .whitespaces)
  }

  static func decode(_ phrase: String) -> String {
    let letters = Array("abcdefghijklmnopqrstuvwxyz")
    let input = phrase.lowercased().filter { $0.isLetter || $0.isNumber }
    var output = ""

    for character in input {
      if let index = letters.firstIndex(of: character) {
        output.append(letters[letters.count - index - 1])
      } else {
        output.append(character)
      }
    }

    return output
  }
}
