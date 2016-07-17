struct Anagram {
    var baseWord = ""
    init (word: String) {
        baseWord = word
    }

    func sortLetters(_ wordToSort: String) -> String {
        var characters: [String] = []
        for char in wordToSort.characters {
            characters.append("\(char)")
        }
        characters = characters.sorted(isOrderedBefore: < )
        return characters.reduce("", combine: +)
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
