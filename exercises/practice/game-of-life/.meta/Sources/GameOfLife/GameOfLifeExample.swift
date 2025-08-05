
func tick(_ matrix: [[Int]]) -> [[Int]] {
    let neighbors = [
        (-1, -1), (-1, 0), (-1, 1),
        ( 0, -1),          ( 0, 1),
        ( 1, -1), ( 1, 0), ( 1, 1)
    ]

    var result = matrix
    for (rowIndex, row) in matrix.enumerated() {
        for (columnIndex, cellValue) in row.enumerated() {
            var neighborsAlive = 0
            for (dx, dy) in neighbors {
                let x = rowIndex + dx
                let y = columnIndex + dy
                guard x >= 0, x < result.count, y >= 0, y < row.count else { 
                    continue
                }
                neighborsAlive += matrix[x][y]
            }
            
            if cellValue == 1 && (neighborsAlive != 2 && neighborsAlive != 3) {
                result[rowIndex][columnIndex] = 0
            }
            else if cellValue == 0 && neighborsAlive == 3 {
                result[rowIndex][columnIndex] = 1
            }
        }
    }
    return result
}