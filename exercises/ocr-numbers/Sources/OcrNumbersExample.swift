import Foundation

struct OCR {

    let lines: [String]
    let patterns =  [
        [" _ ", "| |", "|_|", "   "] ,
        ["   ", "  |", "  |", "   "] ,
        [" _ ", " _|", "|_ ", "   "] ,
        [" _ ", " _|", " _|", "   "] ,
        ["   ", "|_|", "  |", "   "] ,
        [" _ ", "|_ ", " _|", "   "] ,
        [" _ ", "|_ ", "|_|", "   "] ,
        [" _ ", "  |", "  |", "   "] ,
        [" _ ", "|_|", "|_|", "   "] ,
        [" _ ", "|_|", " _|", "   "]
    ]

    enum OCRError: Error {
        case invalidNumberOfLines
        case invalidNumberOfColumns
    }
    init(_ text: String) throws {
        let lines = text.split(separator: "\n").map { String($0) }

        let rowCount = lines.count

        guard rowCount > 0 && rowCount % 4 == 0 else {
            throw OCRError.invalidNumberOfLines
        }

        let columnCount = lines[0].count

        guard columnCount > 0 && columnCount % 3 == 0 else {
            throw OCRError.invalidNumberOfColumns
        }

        try lines.forEach {
            guard $0.count == columnCount else {
                throw OCRError.invalidNumberOfColumns
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

            while columnIndex < lines[0].count {
                var grouping = [String]()

                for line in selectedLines {
                    let startIndex = line.index(line.startIndex, offsetBy: columnIndex)
                    let endIndex = line.index(line.startIndex, offsetBy: columnIndex + 2)
                    grouping.append(String(line[startIndex...endIndex]))

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
        guard let number = patterns.index(where: { $0 == grouping }) else {
            return "?"
        }
        return "\(number)"
    }

}
