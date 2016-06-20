



private extension String {

    func trimWhiteSpace() -> String {
        let removeSpaces = trimCharacters(" ", sourceText: self)
        if removeSpaces.hasSuffix("\n") {
            return String(removeSpaces.characters.dropLast())
        }
        return  removeSpaces
    }

    func trimCharacters(_ charToTrim: Character, sourceText: String) -> String {
        var editCharacterView = sourceText.characters
        var editString = String(editCharacterView)

        let trimFirst  = sourceText.characters.first == charToTrim
        let trimLast   = sourceText.characters.last == charToTrim

        if trimFirst { editCharacterView  = editCharacterView.dropFirst() }
        if trimLast { editCharacterView  = editCharacterView.dropLast() }

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
        let inputStringCollection = input.characters.map({String($0)})
        let abcStringCollection = abc.characters.map({String($0)})

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
            return "Fine, be that way."
        } else if input.isShouting {
            return "Woah, chill out!"
        } else if input.isQuestion {
            return "Sure."
        } else {
            return "Whatever."
        }
    }

}
