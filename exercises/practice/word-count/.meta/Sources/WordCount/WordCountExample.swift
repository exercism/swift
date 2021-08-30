struct WordCount {

    func splitStringToArray(_ inString: String) -> [String] {
        return inString.split(whereSeparator: { splitAt($0) }).map { String($0) }
    }

    func splitAt(_ characterToCompare: Character, charToSplitAt: String = " !&$%^&,:") -> Bool {
        for each in charToSplitAt where each == characterToCompare {
            return true
        }
        return false
    }

    let words: String

    init(words: String) {
        self.words = words
    }

    func count() -> [String: Int] {
        var dict = [String: Int]()
        let cleanArray = splitStringToArray(words)

        cleanArray.forEach { string in
            if !string.isEmpty {
                if let count = dict[string.lowercased()] {
                    dict[string.lowercased()] = count + 1
                } else { dict[string.lowercased()] = 1
                }
            }
        }
        return dict
    }
}
