//Foundation not needed

struct WordCount {

    func splitStringToArray(inString:String) -> [String]{
        
        return inString.characters.split(isSeparator: { splitAt($0) }).map{String($0)}
    }
    
    func splitAt(characterToCompare:Character, charToSplitAt:String = " !&$%^&,:")-> Bool{
        for each in charToSplitAt.characters{
            if each == characterToCompare{
                return true
            }
        }
        return false
    }
    
    let words: String
    
    init(words: String) {
        self.words = words
    }
    
    func count() -> [String: Int] {
        var dict = [String:Int]()
        let cleanArray = splitStringToArray(words)
        
        cleanArray.forEach { string in
            if !string.isEmpty {
                if let count = dict[string.lowercaseString] {
                    dict[string.lowercaseString] = count + 1
                } else { dict[string.lowercaseString] = 1
                }
                }
                }
            return dict
        }
}


