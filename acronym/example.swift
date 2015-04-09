import Foundation


struct Acronym{
    static func abbreviate(input:String)->String{

        func listMatches(#pattern: String, inString string: String) -> [String] {
            let regex = NSRegularExpression(pattern: pattern, options: .allZeros, error: nil)
            let range = NSMakeRange(0, count(string))
            let matches = regex?.matchesInString(string, options: .allZeros, range: range) as! [NSTextCheckingResult]
            
            return matches.map {
                let range = $0.range
                return (string as NSString).substringWithRange(range)
            }
        }
        
        return "".join(listMatches(pattern: "[A-Z]+[a-z]*|[a-z]+", inString: input).map{$0.capitalizedString.substringToIndex(advance(input.startIndex, 1))})
        
        

            
        
    }
}