import Foundation

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


struct Acronym{
    static func abbreviate(input:String)->String{

        func listMatches(pattern pattern: String, inString string: String) -> [String] {
            let regex = try? NSRegularExpression(pattern: pattern, options: [])
            let range = NSMakeRange(0, string.characters.count)
            guard let matches = regex?.matchesInString(string, options: [], range: range) else {fatalError("Nothing Matched")}
            
            return matches.map {
                let rangeIn = $0.range
                guard let rangeInt = rangeIn.toRange() else {fatalError("Nothing Matched")}

                return string.substringWithRangeInt(rangeInt) ?? ""
            }
        }
        
        return listMatches(pattern: "[A-Z]+[a-z]*|[a-z]+", inString: input).map{$0.capitalizedString.substringToIndex(input.startIndex.advancedBy(1))}.joinWithSeparator("")
     
        
    }
}