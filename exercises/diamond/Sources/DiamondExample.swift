struct Diamond {
    static let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { $0 }

    static func makeDiamond(letter: Character) -> [String] {
        guard let index = alphabet.index(of: letter) else {
            return []
        }

        let numberOfLines = index * 2 + 1
        let middle = numberOfLines / 2
        var result = [String]()

        for lineNumber in 0..<numberOfLines {
            var line = ""

            for column in 0..<numberOfLines {
                let distanceFromMiddle = middle - abs(middle - lineNumber)

                if abs(middle - column) == distanceFromMiddle {
                    line.append(alphabet[distanceFromMiddle])
                } else {
                    line.append(" ")
                }
            }
            result.append(line)
        }

        return result
    }
}
