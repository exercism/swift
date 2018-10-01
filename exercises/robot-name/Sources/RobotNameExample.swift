#if os(Linux)
    import Glibc
#elseif os(OSX)
    import Darwin
let random = arc4random
#endif

struct Robot {
    var name: String

    init() {
        let numberPart = (Int(random()) % 899) + 100
        name = generateRandomLetter() + generateRandomLetter() + "\(numberPart)"
    }

    mutating func resetName() {
        let numberPart = (Int(random()) % 899) + 100
        name = generateRandomLetter() + generateRandomLetter() + "\(numberPart)"
    }
}

private func convertStringToStringArray(_ input: String) -> [String] {
    var characterArray: [String] = []
    for character in input {
        characterArray.append("\(character)")
    }
    return characterArray
}

private func generateRandomLetter() -> String {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let letters = convertStringToStringArray(alphabet)
    let randomIndex = Int(random()) % letters.count
    return letters[randomIndex]
}
