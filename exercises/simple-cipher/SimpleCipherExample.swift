import Darwin

// Apple Swift version 2.1

func arc4random_uniform(input:Int)->Int{
    let temp = UInt32(input)
    return Int(arc4random_uniform(temp))
}


public struct Cipher
{
    private let abc = "abcdefghijklmnopqrstuvwxyz"
    private var alphabet:[Character] { return Array(abc.characters) }
    private(set) var key:String = ""
    private var keyArray:[Character] { return Array(key.characters) }
    
    
    private func randomKeySet()->String{
        var tempKey = ""
        for _ in (0..<100).enumerate(){
            tempKey.append(alphabet[arc4random_uniform(alphabet.count)])
        }
        return tempKey
    }
    

    init(){
        key = randomKeySet()
    }
    
    
    init?(key:String)
    {
        if isLowerCaseAlfabet(key){
            self.key = key
            
            if key.isEmpty {
                return nil
            }
        } else { return nil
            //self.key = randomKeySet() // Alternative non Optional faiulure
        }
    }
    
    
     func isLowerCaseAlfabet(inkey:String)-> Bool{
        var valid = true
        inkey.characters.forEach{
            
            if "abcdefghijklmnopqrstuvwxyz".containsString(String($0)) == false {
                valid = false
            }
        }
        return valid
    }

    
    func encode(plaintext:String) ->String
    {
        let plainTextArray = Array(plaintext.characters)
        
        func encodeCharacter(plaintext:String, idx:Int)->Character
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
        for i in 0 ..< min(plainTextArray.count, keyArray.count) {
            ciphertext.append(encodeCharacter(plaintext, idx: i))
        }
        return ciphertext
    }
    
    
    
    func decode(ciphertext:String)->String
    {
        let cipherTextArray = Array(ciphertext.characters)
        
        func decodeCharacter(ciphertext:String, idx:Int)-> Character
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
        
        for i in 0 ..< cipherTextArray.count  {
            plaintext.append(decodeCharacter(ciphertext, idx: i))
        }
        return plaintext
    }
    
    
}