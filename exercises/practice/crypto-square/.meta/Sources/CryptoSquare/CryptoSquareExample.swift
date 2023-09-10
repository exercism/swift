import Foundation

func cryptoSquare(text: String) -> String {
  var result = ""
  let trimmed =
    text
    .lowercased()
    .filter { $0.isLetter || $0.isNumber }
  let size = Int(ceil(sqrt(Double(trimmed.count))))

  for i in 0..<size {
    for j in stride(from: i, to: trimmed.count, by: size) {
      result.append(trimmed[trimmed.index(trimmed.startIndex, offsetBy: j)])
    }
    result.append(
      String(repeating: " ", count: ((trimmed.count - 1) / size) - (trimmed.count - i - 1) / size))
    if i != size - 1 {
      result.append(" ")
    }
  }

  return result
}
