class Proverb {
  let words: [String]

  init(_ words: [String]) {
    self.words = words
  }

  func recite() -> String {
    var result = ""
    for i in 0..<words.count {
      if i == words.count - 1 {
        result += "And all for the want of a \(words[0])."
      } else {
        result += "For want of a \(words[i]) the \(words[i + 1]) was lost.\n"
      }
    }
    return result
  }
}
