struct OCR {

    let lines: [String]
    let patterns =  [
        [" _ ", "| |", "|_|", "   "] : "0",
        ["   ", "  |", "  |", "   "] : "1",
        [" _ ", " _|", "|_ ", "   "] : "2",
        [" _ ", " _|", " _|", "   "] : "3",
        ["   ", "|_|", "  |", "   "] : "4",
        [" _ ", "|_ ", " _|", "   "] : "5",
        [" _ ", "|_ ", "|_|", "   "] : "6",
        [" _ ", "  |", "  |", "   "] : "7",
        [" _ ", "|_|", "|_|", "   "] : "8",
        [" _ ", "|_|", " _|", "   "] : "9"
    ]

    enum Error: ErrorProtocol {
        case invalidNumberOfLines
        case invalidNumberOfColumns
    }
    init(_ text: String) throws {
        let lines = text.characters.split(separator: "\n").map { String($0) }

        let rowCount = lines.count

        guard rowCount > 0 && rowCount % 4 == 0 else {
            throw Error.invalidNumberOfLines
        }

        let columnCount = lines[0].characters.count

        guard columnCount > 0 && columnCount % 3 == 0 else {
            throw Error.invalidNumberOfColumns
        }

        try lines.forEach {
            guard $0.characters.count == columnCount else {
                throw Error.invalidNumberOfColumns
            }
        }

        self.lines = lines
    }

    func converted() -> String {
        var resultArray = [String]()

        var rowIndex = 0

        while rowIndex < lines.count {
            let selectedLines = lines[rowIndex ... rowIndex + 3]
            var result = ""

            var columnIndex = 0

            while columnIndex < lines[0].characters.count {
                var grouping = [String]()

                for line in selectedLines {
                    let startIndex = line.characters.index(line.startIndex, offsetBy: columnIndex)
                    let endIndex = line.characters.index(line.startIndex, offsetBy: columnIndex + 2)
                    grouping.append(line[startIndex...endIndex])

                }

                result += patternForGrouping(grouping)
                columnIndex += 3
            }

            resultArray.append(result)
            rowIndex += 4
        }
        return resultArray.joined(separator: ",")

    }

    func patternForGrouping(_ grouping: [String]) -> String {
        guard let number = patterns[grouping] else {
            return "?"
        }
        return number
    }

}
