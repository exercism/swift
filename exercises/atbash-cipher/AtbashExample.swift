// Foundation not needed



struct Atbash {
    
    private static func stripWhiteSpaceAndPunctuations(input:String) ->String{
        var returnString = ""
        input.characters.forEach{
            if !" ,.".containsString(String($0)){
                returnString.append($0)
            }
        }
        
        return returnString
    }
    
    
    
    static let cipherDictApply:[Character : Character] = ["a": "z", "b": "y", "c": "x", "d": "w", "e": "v", "f": "u", "g": "t", "h": "s", "i": "r", "j": "q", "k": "p", "l": "o", "m": "n", "n": "m", "o": "l", "p": "k", "q": "j", "r": "i", "s": "h", "t": "g", "u": "f", "v": "e", "w": "d", "x": "c", "y": "b", "z": "a"]
    
    static func encode( valueIn:String)->String{
       let value = stripWhiteSpaceAndPunctuations(valueIn.lowercaseString  )
        
        var text2return = ""
        
        for each in value.characters{
            text2return.append(cipherDictApply[each] ?? each )
        }
        return insertSpace5th(text2return)
    }
    
    static func insertSpace5th(value:String)->String{
        var tempCounter = 0
        var tempString:String = ""
        for each in value.characters{
            if tempCounter % 5 == 0 && tempCounter != 0{
                tempString += " \(each)"
            } else { tempString += "\(each)" }
            tempCounter += 1
        }
        return tempString
    }

}