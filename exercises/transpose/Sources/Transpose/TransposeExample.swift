import Foundation

struct Transpose {
    static func transpose(_ input: [String]) -> [String] {
        let maxLineLength = input.map { $0.count }.max()

        guard let maxLength = maxLineLength else {
            return []
        }

        var result = [String](repeatElement("", count: maxLength))

        for i in 0..<maxLength {
            for line in input {
                if let start = line.index(line.startIndex, offsetBy: i, limitedBy: line.endIndex),
                    let end = line.index(start, offsetBy: 1, limitedBy: line.endIndex) {
                    let character = line[start..<end]
                    result[i].append(String(character))
                } else {
                    result[i].append(" ")
                }
            }
        }

        return result.map { stripTrailingWhitespace($0) }
    }

    private static func stripTrailingWhitespace(_ input: String) -> String {
        var result = input

        while result.hasSuffix(" ") {
            result.remove(at: result.index(before: result.endIndex))
        }

        return result
    }
}
