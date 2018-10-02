import Foundation

struct Isogram {

    static func isIsogram(_ string: String) -> Bool {
        let lowercasedString = string.lowercased()
        let lowercaseLetterSet = CharacterSet.lowercaseLetters

        var letters: Set<UnicodeScalar> = []

        for character in lowercasedString.unicodeScalars {
            guard lowercaseLetterSet.contains(character) else {
                continue
            }

            guard !letters.contains(character) else {
                return false
            }

            letters.insert(character)
        }

        return true
    }
}
