import XCTest



class MatrixTest: XCTestCase {
    
    func testExtractARow() {
        let matrix = Matrix("1 2\n10 20")
        XCTAssertEqual([1, 2], matrix.rows[0])
    }
    
    func testExtractSameRowAgain() {
        let matrix = Matrix("9 7\n8 6")
        XCTAssertEqual([9, 7], matrix.rows[0])
    }
    
    func testExtractOtherRow() {
        let matrix = Matrix("9 8 7\n19 18 17")
        XCTAssertEqual([19, 18, 17], matrix.rows[1])
    }
    
    func testExtractOtherRowAgain() {
        let matrix = Matrix("1 4 9\n16 25 36")
        XCTAssertEqual([16, 25, 36], matrix.rows[1])
    }
    
    func testExtractAColumn() {
        let matrix = Matrix("1 2 3\n4 5 6\n7 8 9\n 8 7 6")
        XCTAssertEqual([1, 4, 7, 8], matrix.columns[0])
    }
    
    func testExtractAnotherColumn() {
        let matrix = Matrix("89 1903 3\n18 3 1\n9 4 800")
        XCTAssertEqual([1903, 3, 4], matrix.columns[1])
    }
    
}
