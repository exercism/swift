import Darwin

// Apple Swift version 2.1

class Robot {
    var name: String
    
    init() {
        let numberPart = (Int(rand()) % 899) + 100
        name = generateRandomLetter() + generateRandomLetter() + "\(numberPart)"
    }

    func resetName() {
        let numberPart = (Int(rand()) % 899) + 100
        name = generateRandomLetter() + generateRandomLetter() + "\(numberPart)"
    }
}

func convertStringToStringArray(input: String) -> [String] {
    var characterArray: [String] = []
    for character in input.characters {
        characterArray.append("\(character)")
    }
    return characterArray
}

func generateRandomLetter() -> String {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let letters = convertStringToStringArray(alphabet)
    let randomIndex = Int(rand()) % letters.count
    return letters[randomIndex]
}
