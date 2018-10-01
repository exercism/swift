import Foundation

#if os(Linux)
#if swift(>=3.1)
    typealias Regex = NSRegularExpression
#else
    typealias Regex = RegularExpression
#endif
#else
    typealias Regex = NSRegularExpression
#endif

struct Board {

    private let validCharacters: [Character] = ["+", "-", "|", "*", " "]
    private let rows: [String]

    enum BoardError: Error {
        case differentLength
        case faultyBorder
        case invalidCharacter
    }

    init(_ rows: [String]) throws {
        self.rows = rows

        try validateInput()
    }

    func transform() -> [String] {
        var result = [String]()
        let rowsEnumarated = rows.enumerated()
        for (i, row) in rowsEnumarated {
            var newRow = ""
            let rowCharsEnumarated = row.enumerated()

            for (j, character) in rowCharsEnumarated {
                if character != " " {
                    newRow += String(character)
                } else {
                    let mineCount = mineCountForRow(row, i: i, j: j)

                    if mineCount > 0 {
                        newRow += String(mineCount)
                    } else {
                        newRow += " "
                    }
                }
            }
            result.append(newRow)
        }

        return result
    }

    private func mineCountForRow(_ row: String, i: Int, j: Int) -> Int {
        // Must be split up to avoid error: "Expression was too complex to be solved in reasonable time."
        var surroundings = [row[j - 1], row[j + 1], rows[i - 1][j - 1]]
        surroundings += [rows[i - 1][j], rows[i - 1][j + 1]]
        surroundings += [rows[i + 1][j - 1]]
        surroundings += [rows[i + 1][j], rows[i + 1][j + 1]]

        return surroundings.filter { isMine($0) }.count
    }

    private func isMine(_ character: Character) -> Bool {
        return character == "*"
    }

    private func validateInput() throws {
        try validateSize()
        try validateData()
        try validateBorders()
    }

    private func validateSize() throws {
        guard let count = rows.first?.count else {
            throw BoardError.differentLength
        }

        try rows.forEach {
            guard $0.count == count else {
                throw BoardError.differentLength
            }
        }
    }

    private func validateData() throws {
        try rows.forEach {
            try $0.forEach {
                guard validCharacters.contains($0) else {
                    throw BoardError.invalidCharacter
                }
            }
        }
    }

    private func validateBorders() throws {
        let firstAndLast = [rows[0], rows[rows.count - 1]]
        try firstAndLast.forEach {
            guard $0.matchesRegex("^\\+[-]+\\+$") else {
                throw BoardError.faultyBorder
            }
        }

        let middleRows = rows[1 ..< rows.count - 2]
        try middleRows.forEach {
            guard $0.matchesRegex("^\\|.+\\|$") else {
                throw BoardError.faultyBorder
            }
        }
    }
}

private extension String {
    func matchesRegex(_ pattern: String) -> Bool {
        let options = Regex.Options.dotMatchesLineSeparators
        let regex = try? Regex(pattern: pattern, options: options)
        var matches = 0
        if let regex = regex {
            matches = regex.numberOfMatches(in: self,
                                            options: [],
                                            range: NSRange(0..<self.utf16.count) )
        }
        return matches > 0
    }
    subscript(idx: Int) -> Character {
        return self[index(startIndex, offsetBy: idx)]
    }
}
