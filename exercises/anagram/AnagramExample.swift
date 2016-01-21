// Foundation not needed

// Apple Swift version 2.1

struct Anagram {
    var baseWord = ""
    init (word: String) {
        baseWord = word
    }
    
    func sortLetters(wordToSort: String) -> String {
        var characters: [String] = []
        for char in wordToSort.characters {
            characters.append("\(char)")
        }
        characters = characters.sort(< )
        return characters.reduce("", combine: +)
    }
    
    func match(words: [String]) -> [String] {
        var matches: [String] = []
        
        for candidateWord in words {
            if sortLetters(baseWord.lowercaseString) == sortLetters(candidateWord.lowercaseString)
                && baseWord.lowercaseString != candidateWord.lowercaseString {
                matches.append(candidateWord)
            }
        }
        
        return matches
    }
    
}


