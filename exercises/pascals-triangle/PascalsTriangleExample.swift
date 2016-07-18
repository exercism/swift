struct PascalsTriangle {

    let rows: [[Int]]

    init(_ numberOfRows: Int) {
        var triangle = [[Int]]()

        for rowNumber in 0..<numberOfRows {
            var values = [Int]()
            if rowNumber == 0 {
                values.append(1)
            } else {
                let lastRow = triangle[rowNumber - 1]
                let length = lastRow.count

                for position in 0...length {
                    let left: Int
                    if position == 0 {
                        left = 0
                    } else {
                        left = lastRow[position - 1]
                    }

                    let right: Int
                    if position < length {
                        right = lastRow[position]
                    } else {
                        right = 0
                    }

                    values.append(left + right)
                }
            }
            triangle.append(values)
        }

        self.rows = triangle
    }

}
