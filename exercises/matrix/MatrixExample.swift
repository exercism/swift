// Foundation not needed





struct Matrix {
    
    let rows: [[Int]]
    let columns: [[Int]]
    
    init(_ stringRepresentation: String) {
        var rows = [[Int]]()
        var columns = [[Int]]()
        
            let rowItems = stringRepresentation.characters.split("\n")
            for item in rowItems {
            let elements = item.split(" ").flatMap { Int(String($0)) }
            rows.append(elements)
            }
        
        
        for i in 0 ..< rows[0].count {
            var column = [Int]()
            for row in rows {
                column.append(row[i])
            }
            
            columns.append(column)
        }
        
        self.rows = rows
        self.columns = columns
    }
    
}