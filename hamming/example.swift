import Foundation

class Hamming {
    class func compute(input: String, against: String) -> Int? {
        var differences = 0
        
        let char1 = convertStringToArray(input)
        let char2 = convertStringToArray(against)
        
        if char1.count != char2.count { return nil }
        for i in 0..<char1.count {
            if char1[i] != char2[i] {
                differences++
            }
        }
        return differences
    }
    
}

func convertStringToArray(input: String) -> [Character] {
    var characterArray: [Character] = []
    
    for character in input {
        characterArray.append(character)
    }
    
    return characterArray
}
