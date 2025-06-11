struct SaddlePoints {
  static func saddlePoints(_ matrix: [[Int]]) -> [Position] {
    var saddlePoints = [Position]()
    for (rowIndex, row) in matrix.enumerated() {
      for (columnIndex, _) in row.enumerated() {
        if isSaddlePoint(matrix, rowIndex, columnIndex) {
          saddlePoints.append(Position(row: rowIndex + 1, column: columnIndex + 1))
        }
      }
    }
    return saddlePoints
  }

  static private func isSaddlePoint(_ matrix: [[Int]], _ rowIndex: Int, _ columnIndex: Int) -> Bool
  {
    let element = matrix[rowIndex][columnIndex]
    let row = matrix[rowIndex]
    let column = matrix.map { $0[columnIndex] }
    return row.allSatisfy { $0 <= element } && column.allSatisfy { $0 >= element }
  }
}
