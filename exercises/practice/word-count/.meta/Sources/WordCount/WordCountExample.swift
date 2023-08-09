import Foundation

class WordCount {
  let words: String

  init(words: String) {
    self.words = words
  }

  func count() -> [String: Int] {
    var result = [String: Int]()
    let trimmingCharacters = CharacterSet(charactersIn: ".,:!&@$%^&'")
    let words = self.words
      .lowercased()
      .split(whereSeparator: { $0.isWhitespace || $0 == "," })
      .map { String($0).trimmingCharacters(in: trimmingCharacters) }
    for word in words {
      result[word, default: 0] += 1
    }
    return result
  }
}
