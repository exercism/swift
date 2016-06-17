// Foundation not needed



struct Hamming {
    static func compute(_ input: String, against: String) -> Int? {
        var differences = 0
        
        let char1 = convertStringToArray(input)
        let char2 = convertStringToArray(against)
        
        if char1.count != char2.count { return nil }
        for i in 0..<char1.count {
            if char1[i] != char2[i] {
                differences += 1
            }
        }
        return differences
    }
    
}

private func convertStringToArray(_ input: String) -> [Character] {
    var characterArray: [Character] = []
    
    for character in input.characters {
        characterArray.append(character)
    }
    
    return characterArray
}
