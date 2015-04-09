import Foundation

extension String {
    
    func stripCharSet(charSet:NSCharacterSet) -> String{
        let tempstring:NSArray = self.componentsSeparatedByCharactersInSet(charSet)
        let returnString = tempstring.componentsJoinedByString("")
        return returnString
    }
    var stripWhiteSpace:String { get {
        return stripCharSet(.whitespaceAndNewlineCharacterSet())
        }}
    var stripPunctuations:String { get {
        return stripCharSet(.punctuationCharacterSet())
        }}
}

struct Atbash {
    
    
    static let cipherDictApply:[Character : Character] = ["a": "z", "b": "y", "c": "x", "d": "w", "e": "v", "f": "u", "g": "t", "h": "s", "i": "r", "j": "q", "k": "p", "l": "o", "m": "n", "n": "m", "o": "l", "p": "k", "q": "j", "r": "i", "s": "h", "t": "g", "u": "f", "v": "e", "w": "d", "x": "c", "y": "b", "z": "a"]
    
    static func encode(var value:String)->String{
        value = value.stripWhiteSpace.lowercaseString.stripPunctuations
        
        var text2return = ""
        
        for each in value{
            text2return.append(cipherDictApply[each] ?? each )
        }
        return insertSpace5th(text2return)
    }
    
    static func insertSpace5th(value:String)->String{
        var tempCounter = 0
        var tempString:String = ""
        for each in value{
            if tempCounter % 5 == 0 && tempCounter != 0{
                tempString += " \(each)"
            } else { tempString += "\(each)" }
            tempCounter++
        }
        return tempString
    }

}