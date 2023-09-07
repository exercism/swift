enum OcrNumberError: Error {
  case invalidInput
}

class OcrNumber {
  static func convert(rows: [String]) throws -> String {
    guard rows.count.isMultiple(of: 4) && rows[0].count.isMultiple(of: 3) else {
      throw OcrNumberError.invalidInput
    }
    let digits = stride(from: 0, to: rows[0].count, by: 3).map { index in
      rows.map { row in
        let startIndex = row.index(row.startIndex, offsetBy: index)
        let endIndex = row.index(startIndex, offsetBy: 3)
        return row[startIndex..<endIndex]
      }
    }
    var result = ""
    var idx = 0
    while idx + 2 < digits[0].count {
      for digit in digits {
        switch digit[(idx)...(idx + 2)] {
        case [" _ ", "| |", "|_|"]:
          result += "0"
        case ["   ", "  |", "  |"]:
          result += "1"
        case [" _ ", " _|", "|_ "]:
          result += "2"
        case [" _ ", " _|", " _|"]:
          result += "3"
        case ["   ", "|_|", "  |"]:
          result += "4"
        case [" _ ", "|_ ", " _|"]:
          result += "5"
        case [" _ ", "|_ ", "|_|"]:
          result += "6"
        case [" _ ", "  |", "  |"]:
          result += "7"
        case [" _ ", "|_|", "|_|"]:
          result += "8"
        case [" _ ", "|_|", " _|"]:
          result += "9"
        default:
          result += "?"
        }
      }
      idx += 4
      if idx + 2 < digits[0].count {
        result += ","
      }
    }
    return result
  }
}
