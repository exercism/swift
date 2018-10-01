import Foundation

private extension String {

    func trimWhiteSpace() -> String {
        let removeSpaces = trimCharacters(" ", sourceText: self)
        if removeSpaces.hasSuffix("\n") {
            return String(removeSpaces.dropLast())
        }
        return  removeSpaces
    }

    func trimCharacters(_ charToTrim: Character, sourceText: String) -> String {
        var editCharacterView = Array(sourceText)
        var editString = String(editCharacterView)

        let trimFirst  = sourceText.first == charToTrim
        let trimLast   = sourceText.last == charToTrim

        if trimFirst { editCharacterView  = Array(editCharacterView.dropFirst()) }
        if trimLast { editCharacterView  = Array(editCharacterView.dropLast()) }

        if trimFirst || trimLast == true {
            editString = trimCharacters(charToTrim, sourceText: String(editCharacterView))
        }
        return editString
    }
    var isQuestion: Bool {
        return hasSuffix("?")
    }

    var hasLetters: Bool {
        return containsLetters(self)
    }

    var isShouting: Bool {
        return (self == uppercased() && hasLetters)

    }

    private func containsLetters(_ input: String) -> Bool {
        let abc = "abcdefghijklmnopqrstuvwxyz"
        var contains = false
        let inputStringCollection = input.map({ String($0) })
        let abcStringCollection = abc.map({ String($0) })

        for each in inputStringCollection {
            abcStringCollection.forEach({
                if each == $0 || each == $0.uppercased() {
                    contains = true }

            })
        }
        return contains
    }

}

struct Bob {
    static func hey(_ input: String) -> String {
        if input.trimWhiteSpace().isEmpty {
            return "Fine. Be that way!"
        } else if input.isShouting {
            return "Whoa, chill out!"
        } else if input.isQuestion {
            return "Sure."
        } else {
            return "Whatever."
        }
    }

}
