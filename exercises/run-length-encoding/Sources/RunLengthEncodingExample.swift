struct RunLengthEncoding {

    static func encode(_ input: String) -> String {
        var result = ""

        var lastCharacter = input.first!
        var count = 0

        for (index, character) in input.enumerated() {
            if character == lastCharacter {
                count += 1
            }

            func addCharacter() {
                if count == 1 {
                    result += "\(lastCharacter)"
                } else {
                    result += "\(count)\(lastCharacter)"
                }

                lastCharacter = character
                count = 1
            }

            if character != lastCharacter {
                addCharacter()
            }

            let isFinal = index == input.count - 1

            if isFinal {
                addCharacter()
            }
        }

        return result
    }

    static func decode(_ input: String) -> String {
        var result = ""

        var multiplier: Int?

        for character in input {
            if let number = Int(String(character)) {
                if let currentMultiplier = multiplier {
                    multiplier = currentMultiplier * 10 + number
                } else {
                    multiplier = number
                }
            } else {
                for _ in 1...(multiplier ?? 1) {
                    result += "\(character)"
                }

                multiplier = nil
            }
        }

        return result
    }
}
