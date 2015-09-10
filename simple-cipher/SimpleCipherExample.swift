import Foundation

func arc4random_uniform(input:Int)->Int{
    let temp = UInt32(input)
    return Int(arc4random_uniform(temp))
}

public struct Cipher
{
    private let ABC = "abcdefghijklmnopqrstuvwxyz"
    private var alphabet:[Character] { return Array(ABC.characters) }
    private(set) var key:String = ""
    private var keyArray:[Character] { return Array(key.characters) }
    
    
    private func randomKeySet()->String{
        var tempKey = ""
        for _ in (0..<100).enumerate(){
            tempKey.append(alphabet[arc4random_uniform(alphabet.count)])
        }
        return tempKey
    }
    
    private func IsValidKey(key:String)->Bool
    {
        func containsMatch(pattern: String, inString string: String) -> Bool {
            let regex = try? NSRegularExpression(pattern: pattern, options: [])
            let range = NSMakeRange(0, string.characters.count)
            return regex?.firstMatchInString(string, options: [], range: range) != nil
        }
        return containsMatch("^[a-z]+$", inString: key)
    }
    
    init(){
        key = randomKeySet()
    }
    
    init?(key:String)
    {
        if IsValidKey(key){
            self.key = key
        } else { return nil
            //self.key = randomKeySet() // Alternative non Optional faiulure
        }
    }
    
    func encode(plaintext:String) ->String
    {
        let plainTextArray = Array(plaintext.characters)
        
        func EncodeCharacter(plaintext:String, idx:Int)->Character
        {
            //let plainTextArray = Array(plaintext) // hack for subscript support for Strings
            var alphabetIdx:Int =
            (alphabet.indexOf(plainTextArray[idx]) ?? 0) +
                (alphabet.indexOf(keyArray[idx]) ?? 0)
            if alphabetIdx >= alphabet.count {
                alphabetIdx -= alphabet.count
            }
            return alphabet[alphabetIdx]
        }
        
        var ciphertext = ""
        for var i = 0; i < min(plainTextArray.count, keyArray.count); i++ {
            ciphertext.append(EncodeCharacter(plaintext, idx: i))
        }
        return ciphertext
    }
    
    
    
    func decode(ciphertext:String)->String
    {
        let cipherTextArray = Array(ciphertext.characters)
        
        func DecodeCharacter(ciphertext:String, idx:Int)-> Character
        {
            //let cipherTextArray = Array(ciphertext) // no native subscript for String
            var alphabetIdx:Int =
            (alphabet.indexOf(cipherTextArray[idx]) ?? 0) -
                (alphabet.indexOf(keyArray[idx]) ?? 0)
            if alphabetIdx < 0{
                alphabetIdx += alphabet.count
            }
            return alphabet[alphabetIdx]
        }
        
        
        var plaintext = ""
        
        for var i = 0; i < cipherTextArray.count ; i++ {
            plaintext.append(DecodeCharacter(ciphertext, idx: i))
        }
        return plaintext
    }
    
    
}