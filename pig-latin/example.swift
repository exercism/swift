import Foundation


extension String{
    func substringFromIndexInt(indx:Int) -> String {
        let index = advance(self.startIndex, indx)
        return self.substringFromIndex(index)
    }

    func substringWithRangeInt(intRange:Range<Int>)->String{
        let start = advance(self.startIndex,intRange.startIndex)
        let end = advance(self.startIndex,intRange.endIndex)
        return self.substringWithRange(start..<end)
    }
    
    
}

struct PigLatin {
    
    
    static func translate (word:String) -> String {
      return " ".join(word.componentsSeparatedByString(" ").map{self.translateWord($0)})

        
    }
    
    static func translateWord(word:String) -> String{
        
        
        func wordStartsWithPrefixes(word:String, prefixes:[String]) ->Bool{
            return 0 < prefixes.filter{word.hasPrefix($0)}.count
            
        }
        
        func wordStartsWithVowelLike(word:String) ->Bool{
            return wordStartsWithPrefixes(word, ["xr", "yt", "a", "e","i", "o","u" ])
        }
        
        func wordStartsWithConsonantAndQu(word:String) -> Bool{
            let index = advance(word.startIndex, 1)
            return word.substringFromIndex(index).hasPrefix("qu")
        }
        

        
        if wordStartsWithVowelLike(word){return word + "ay"}
        if wordStartsWithPrefixes(word, ["thr", "sch"]){
        return (word.substringFromIndexInt(3) + word.substringWithRangeInt(Range(start: 0,end: 3)) + "ay") }
        
        if wordStartsWithPrefixes(word, ["ch", "qu", "th"]){
        return word.substringFromIndexInt(2) +
            word.substringWithRangeInt(Range(start: 0,end: 2)) + "ay" }
        if wordStartsWithConsonantAndQu(word){
        return word.substringFromIndexInt(3) +
            word.substringWithRangeInt(Range(start: 0,end: 1)) + "quay"}

        return word.substringFromIndexInt(1) +
            word.substringWithRangeInt(Range(start: 0,end: 1)) + "ay"
 
    }
    
    

    
    
    
}