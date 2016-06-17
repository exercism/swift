import Foundation



struct Board {
    
    private let validCharacters: [Character] = ["+", "-", "|", "*", " "]
    private let rows: [String]
    
    enum Error: ErrorType {
        case DifferentLength
        case FaultyBorder
        case InvalidCharacter
    }
    
    
    init(_ rows: [String]) throws {
        self.rows = rows
        
        try validateInput()
    }
    
    func transform() -> [String] {
        var result = [String]()
            let rowsEnumarated = rows.enumerate()
        
            

        for (i, row) in rowsEnumarated {
            var newRow = ""
            let rowCharsEnumarated = row.characters.enumerate()
            
            
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
    
    private func mineCountForRow(row: String, i: Int, j: Int) -> Int {
        // Must be split up to avoid error: "Expression was too complex to be solved in reasonable time."
        var surroundings = [row[j - 1], row[j + 1], rows[i - 1][j - 1]]
        surroundings += [rows[i - 1][j], rows[i - 1][j + 1]]
        surroundings += [rows[i + 1][j - 1], rows[i + 1][j], rows[i + 1][j + 1]]
        
        return surroundings.filter { isMine($0) }.count
    }
    
    private func isMine(character: Character) -> Bool {
        return character == "*"
    }
    
    private func validateInput() throws {
        try validateSize()
        try validateData()
        try validateBorders()
    }
    
    private func validateSize() throws {
        guard let count = rows.first?.characters.count else {
            throw Error.DifferentLength
        }
        
        try rows.forEach {
            guard $0.characters.count == count else {
                throw Error.DifferentLength
            }
        }
    }
    
    private func validateData() throws {
        try rows.forEach {
            try $0.characters.forEach {
                guard validCharacters.contains($0) else {
                    throw Error.InvalidCharacter
                }
            }
        }
    }
    
    private func validateBorders() throws {
        let firstAndLast = [rows[0], rows[rows.count - 1]]
        try firstAndLast.forEach {
            guard $0.matchesRegex("^\\+[-]+\\+$") else {
                throw Error.FaultyBorder
            }
        }
        
        let middleRows = rows[1 ..< rows.count - 2]
        try middleRows.forEach {
            guard $0.matchesRegex("^\\|.+\\|$") else {
                throw Error.FaultyBorder
            }
        }
    }
}
    private extension String {
    func matchesRegex(pattern: String) -> Bool {
    let options = NSRegularExpressionOptions.DotMatchesLineSeparators
    let regex = try? NSRegularExpression(pattern: pattern, options: options)
    var matches = 0
    if let regex = regex {
    matches = regex.numberOfMatchesInString(self,
    options: [],
    range: NSMakeRange(0, (self as NSString).length))
    }
    return matches > 0
    }
    subscript(index: Int) -> Character {
    let index = startIndex.advancedBy(index)
    return self[index]
    }
    }
