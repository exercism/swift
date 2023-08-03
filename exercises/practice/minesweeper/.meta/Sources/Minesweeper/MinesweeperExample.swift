class Board {
  var rows: [String]

  init(_ rows: [String]) {
    self.rows = rows
  }

  func transform() -> [String] {
    var result = [String]()
    for (rowIndex, row) in rows.enumerated() {
      var resultRow = ""
      for (columnIndex, column) in row.enumerated() {
        if column == "*" {
          resultRow += "*"
        } else {
          let count = countMines(rowIndex: rowIndex, columnIndex: columnIndex)
          resultRow += count == 0 ? " " : String(count)
        }
      }
      result.append(resultRow)
    }

    return result
  }

  private func countMines(rowIndex: Int, columnIndex: Int) -> Int {
    var count = 0
    for row in rowIndex - 1...rowIndex + 1 {
      for column in columnIndex - 1...columnIndex + 1 {
        if row >= 0 && row < rows.count && column >= 0 && column < rows[row].count {
          let currentRow = rows[row]
          let currentColumn = currentRow[currentRow.index(currentRow.startIndex, offsetBy: column)]
          if currentColumn == "*" {
            count += 1
          }
        }
      }
    }
    return count
  }
}
