class RunLengthEncoding {
  static func encode(_ phrase: String) -> String {
    var encodedString = ""
    var count = 1
    var previousChar = ""
    for char in phrase {
      if previousChar == "" {
        previousChar = String(char)
      } else if previousChar == String(char) {
        count += 1
      } else {
        if count > 1 {
          encodedString += String(count)
        }
        encodedString += previousChar
        count = 1
        previousChar = String(char)
      }
    }
    if count > 1 {
      encodedString += String(count)
    }
    encodedString += previousChar
    return encodedString
  }

  static func decode(_ phrase: String) -> String {
    var decodedString = ""
    var count = ""
    for char in phrase {
      if char.isNumber {
        count += String(char)
      } else {
        if count == "" {
          decodedString += String(char)
        } else {
          decodedString += String(repeating: String(char), count: Int(count)!)
          count = ""
        }
      }
    }
    return decodedString
  }
}
