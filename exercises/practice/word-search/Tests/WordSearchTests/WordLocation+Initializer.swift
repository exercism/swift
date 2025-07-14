@testable import WordSearch

extension WordLocation {

    init?(start: [String: Int], end: [String: Int]) {
        guard
            let startRow = start["row"],
            let startColumn = start["column"],
            let endRow = end["row"],
            let endColumn = end["column"]
        else {
            return nil
        }
        let start = Location(row: startRow, column: startColumn)
        let end = Location(row: endRow, column: endColumn)
        self.init(start: start, end: end)
  }

}
