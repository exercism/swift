import Foundation

struct Transpose {
  static func transpose(_ lines: [String]) -> [String] {
    var rows = lines.map { String($0).replacingOccurrences(of: " ", with: "_") }
    let maxLength = rows.map { $0.count }.max() ?? 0
    rows = rows.map { $0.padding(toLength: maxLength, withPad: " ", startingAt: 0) }

    var transposed: [String] = []
    for columnIndex in 0..<maxLength {
      let transposedLine = rows.map { row -> Character in
        let index = row.index(row.startIndex, offsetBy: columnIndex)
        return row[index]
      }
      transposed.append(
        String(transposedLine).replacingOccurrences(
          of: "\\s+$", with: "", options: .regularExpression
        ).replacingOccurrences(of: "_", with: " "))
    }

    return transposed
  }
}
