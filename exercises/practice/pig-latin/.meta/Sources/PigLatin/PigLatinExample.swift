class PigLatin {
  static func translate(_ input: String) -> String {
    let words = input.lowercased().split(separator: " ")
    let translatedWords = words.map { translateWord(String($0)) }
    return translatedWords.joined(separator: " ")
  }

  private static func translateWord(_ word: String) -> String {
    if word.isEmpty {
      return word
    }

    if ["a", "e", "i", "o", "u"].contains(String(word.first!)) || word.starts(with: "xr")
      || word.starts(with: "yt")
    {
      return word + "ay"
    }

    if word.starts(with: "squ") || word.starts(with: "thr") || word.starts(with: "sch") {
      return word.dropFirst(3) + String(word.prefix(3)) + "ay"
    }

    let firstTwoCharacters = word.prefix(2)
    let isFirstTwoCharactersVocals = ["a", "e", "i", "o", "u"].contains(String(firstTwoCharacters))

    var thirdLetter = ""
    if word.count >= 3 {
      thirdLetter = String(word[word.index(word.startIndex, offsetBy: 2)])
    }

    if word.starts(with: "ch") || word.starts(with: "qu") || word.starts(with: "th")
      || (!isFirstTwoCharactersVocals && thirdLetter == "y")
    {
      return word.dropFirst(2) + String(word.prefix(2)) + "ay"
    }

    return word.dropFirst() + String(word.prefix(1)) + "ay"

  }
}
