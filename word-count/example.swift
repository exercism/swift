import Foundation

class WordCount {
    var words: String
    
    init(words: String) {
        self.words = words
    }
    
    func count() -> Dictionary<String, Int> {
        var wordCounts: Dictionary<String, Int> = [:]
        var useWords = words.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet).lowercaseString
        useWords = useWords.stringByReplacingOccurrencesOfString(": ", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch)
        useWords = useWords.stringByReplacingOccurrencesOfString(",", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch)

        for w in useWords.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) {
            if let thisCount = wordCounts[w] {
                wordCounts[w] = thisCount+1
            } else {
                wordCounts[w] = 1
            }
        }
        return wordCounts
    }
}