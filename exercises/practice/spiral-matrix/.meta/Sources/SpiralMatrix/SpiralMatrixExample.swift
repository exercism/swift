
func spiralMatrix(size: Int) -> [[Int]] {
    if size <= 0 { return [] }
    else if size == 1 { return [[1]] }

    var matrix = Array(repeating: Array(repeating: 0, count: size), count: size)
    var rowStart = 0
    var rowEnd = size - 1
    var columnStart = 0
    var columnEnd = size - 1
    var counter = 1

    while (rowStart <= rowEnd && columnStart <= columnEnd) {
        if columnStart <= columnEnd {
            for i in columnStart...columnEnd {
                matrix[rowStart][i] = counter
                counter += 1
            }
        }
        rowStart += 1

        if rowStart <= rowEnd {
            for i in rowStart...rowEnd {
                matrix[i][columnEnd] = counter
                counter += 1
            }
        }
        columnEnd -= 1

        if columnStart <= columnEnd {
            for i in stride(from: columnEnd, through: columnStart, by: -1) {
                matrix[rowEnd][i] = counter
                counter += 1
            }
        }
        rowEnd -= 1

        if rowStart <= rowEnd {
            for i in stride(from: rowEnd, through: rowStart, by: -1) {
                matrix[i][columnStart] = counter
                counter += 1
            }

        }
        columnStart += 1
    }
    return matrix
}