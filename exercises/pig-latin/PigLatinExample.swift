// Foundation not needed

private extension String{
    func substringFromIndexInt(indx:Int) -> String {
        let index = self.startIndex.advancedBy(indx)
        return self.substringFromIndex(index)
    }

    func substringWithRangeInt(intRange:Range<Int>)->String{
        let start = self.startIndex.advancedBy(intRange.startIndex)
        let end = self.startIndex.advancedBy(intRange.endIndex)
        return self.substringWithRange(start..<end)
    }
}

struct PigLatin {
    static func translate (word:String) -> String {
        return word.componentsSeparatedByString(" ").map{self.translateWord($0)}.joinWithSeparator(" ")
    }

    static func translateWord(word:String) -> String{
        func wordStartsWithPrefixes(word:String, prefixes:[String]) ->Bool{
            return 0 < prefixes.filter{word.hasPrefix($0)}.count
        }

        func wordStartsWithVowelLike(word:String) ->Bool{
            return wordStartsWithPrefixes(word, prefixes: ["xr", "yt", "a", "e","i", "o","u" ])
        }

        func wordStartsWithConsonantAndQu(word:String) -> Bool{
            let index = word.startIndex.advancedBy(1)
            return word.substringFromIndex(index).hasPrefix("qu")
        }

        if wordStartsWithVowelLike(word){return word + "ay"}
        if wordStartsWithPrefixes(word, prefixes: ["thr", "sch"]){
            return (word.substringFromIndexInt(3) + word.substringWithRangeInt(0..<3) + "ay") }

        if wordStartsWithPrefixes(word, prefixes: ["ch", "qu", "th"]){
            return word.substringFromIndexInt(2) +
                word.substringWithRangeInt(0..<2) + "ay" }
        if wordStartsWithConsonantAndQu(word){
            return word.substringFromIndexInt(3) +
                word.substringWithRangeInt(0..<1) + "quay"}

        return word.substringFromIndexInt(1) +
            word.substringWithRangeInt(0..<1) + "ay"
    }
}
