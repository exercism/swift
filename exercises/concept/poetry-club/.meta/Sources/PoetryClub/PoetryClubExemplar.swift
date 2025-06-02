import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
  return poem.components(separatedBy: "\n")
}

func frontDoorPassword(_ phrase: String) -> String {
  let letters = splitOnNewlines(phrase)
  var result = ""
  for letter in letters {
    let character = letter.first ?? "_"
    result += String(character)
  }
  return result
}

func backDoorPassword(_ phrase: String) -> String {
  let letters = splitOnNewlines(phrase)
  var result = ""
  for letter in letters {
    let clearedMessage = letter.trimmingCharacters(in: .whitespaces)
    let character = clearedMessage.last ?? "_"
    result += String(character)
  }
  return "\(result), please"
}

func secretRoomPassword(_ phrase: String) -> String {
  let letters = splitOnNewlines(phrase)
  var result = ""
  for i in 0..<letters.count {
    let clearedMessage = letters[i].trimmingCharacters(in: .whitespaces)
    let character = clearedMessage.index(clearedMessage.startIndex, offsetBy: i)
    result += String(clearedMessage[character])
  }
  return "\(result.uppercased())!"
}
