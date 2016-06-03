// Foundation not needed

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

    #if swift(>=3.0)
    enum Error: ErrorProtocol {
    case InvalidNumberOfLines
    case InvalidNumberOfColumns
    }
    #else
    enum Error: ErrorType {
        case InvalidNumberOfLines
        case InvalidNumberOfColumns
    }
    #endif

    init(_ text: String) throws {
        #if swift(>=3.0)
            let lines = text.characters.split(separator: "\n").map { String($0) }
        #else
            let lines = text.characters.split("\n").map { String($0) }

        #endif

        let rowCount = lines.count

        guard rowCount > 0 && rowCount % 4 == 0 else {
            throw Error.InvalidNumberOfLines
        }

        let columnCount = lines[0].characters.count

        guard columnCount > 0 && columnCount % 3 == 0 else {
            throw Error.InvalidNumberOfColumns
        }

        try lines.forEach {
            guard $0.characters.count == columnCount else {
                throw Error.InvalidNumberOfColumns
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
                    #if swift(>=3.0)
                        let startIndex = line.startIndex.advanced(by:columnIndex)
                        let endIndex = line.startIndex.advanced(by:columnIndex + 2)
                        grouping.append(line[startIndex...endIndex])
                    #else
                        let startIndex = line.startIndex.advancedBy(columnIndex)
                        let endIndex = line.startIndex.advancedBy(columnIndex + 2)
                        grouping.append(line[startIndex...endIndex])

                    #endif

                }

                result += patternForGrouping(grouping)
                columnIndex += 3
            }

            resultArray.append(result)
            rowIndex += 4
        }
        #if swift(>=3.0)
            return resultArray.joined(separator: ",")
        #else
            return resultArray.joinWithSeparator(",")
        #endif
    }

    func patternForGrouping(grouping: [String]) -> String {
        guard let number = patterns[grouping] else {
            return "?"
        }
        return number
    }
}
