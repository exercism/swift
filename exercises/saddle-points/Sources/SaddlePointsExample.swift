struct SaddlePointsMatrix {

    let rows: [[Int]]
    let columns: [[Int]]
    let saddlePoints: [[Int]]

    init(_ matrix: String) {
        var rows = [[Int]]()

        let rowItems = matrix.split(separator: "\n").map { String($0) }

        for row in rowItems {
            let rowItems = row.split(separator: " ").map { Int(String($0)) ?? 0 }
            rows.append(rowItems)
        }

        self.rows = rows

        var columns = [[Int]]()

        let count = rows[0].count
        for i in 0..<count {
            var column = [Int]()

            for row in rows {
                column.append(row[i])
            }

            columns.append(column)
        }

        self.columns = columns

        var saddlePoints = [[Int]]()
        for (j, row) in rows.enumerated() {
            let max = row.max() ?? 0
            for (i, number) in row.enumerated() {
                let min = columns[i].min() ?? 0
                if number == max && number == min {
                    saddlePoints.append([j, i])
                }
            }
        }

        self.saddlePoints = saddlePoints
    }

}
