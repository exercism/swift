struct Anagram {
    var baseWord = ""
    init (word: String) {
        baseWord = word
    }

    func sortLetters(_ wordToSort: String) -> String {
        var characters: [String] = []
        for char in wordToSort {
            characters.append("\(char)")
        }
        characters = characters.sorted(by: < )
        return characters.reduce("", +)
    }

    func match(_ words: [String]) -> [String] {
        var matches: [String] = []

        for candidateWord in words {
            if sortLetters(baseWord.lowercased()) == sortLetters(candidateWord.lowercased())
                && baseWord.lowercased() != candidateWord.lowercased() {
                matches.append(candidateWord)
            }
        }

        return matches
    }

}
