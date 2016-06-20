import Darwin

struct Robot {
    var name: String

    init() {
        let numberPart = (Int(arc4random()) % 899) + 100
        name = generateRandomLetter() + generateRandomLetter() + "\(numberPart)"
    }

    mutating func resetName() {
        let numberPart = (Int(arc4random()) % 899) + 100
        name = generateRandomLetter() + generateRandomLetter() + "\(numberPart)"
    }
}

private func convertStringToStringArray(_ input: String) -> [String] {
    var characterArray: [String] = []
    for character in input.characters {
        characterArray.append("\(character)")
    }
    return characterArray
}

private func generateRandomLetter() -> String {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let letters = convertStringToStringArray(alphabet)
    let randomIndex = Int(arc4random()) % letters.count
    return letters[randomIndex]
}
