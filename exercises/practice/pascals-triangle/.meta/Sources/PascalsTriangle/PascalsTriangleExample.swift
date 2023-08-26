func pascalsTriangle(rows: Int) -> [[Int]] {
  var triangle = [[Int]]()

  for row in 0..<rows {
    var currentRow = [Int]()
    for col in 0...row {
      if col == 0 || col == row {
        currentRow.append(1)
      } else {
        let left = triangle[row - 1][col - 1]
        let right = triangle[row - 1][col]
        currentRow.append(left + right)
      }
    }
    triangle.append(currentRow)
  }

  return triangle
}
