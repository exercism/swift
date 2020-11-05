import XCTest
@testable import SaddlePoints

private extension XCTest {
    func XCTAssertEqualMultiArray(_ aArray1: [[Int]], _ aArray2: [[Int]]) {
        XCTAssertEqual(Array(aArray1.joined()), Array(aArray2.joined()))
    }
}

class SaddlePointsTests: XCTestCase {
    func testExtractARow() {
        let matrix = SaddlePointsMatrix("1 2\n10 20")
        XCTAssertEqual([1, 2], matrix.rows[0])
    }

    func testExtractSameRowAgain() {
        let matrix = SaddlePointsMatrix("9 7\n8 6")
        XCTAssertEqual([9, 7], matrix.rows[0])
    }

    func testExtractOtherRow() {
        let matrix = SaddlePointsMatrix("9 8 7\n19 18 17")
        XCTAssertEqual([19, 18, 17], matrix.rows[1])
    }

    func testExtractOtherRowAgain() {
        let matrix = SaddlePointsMatrix("1 4 9\n16 25 36")
        XCTAssertEqual([16, 25, 36], matrix.rows[1])
    }

    func testExtractAColumn() {
        let matrix = SaddlePointsMatrix("1 2 3\n4 5 6\n7 8 9\n8 7 6")
        XCTAssertEqual([1, 4, 7, 8], matrix.columns[0])
    }

    func testExtractAnotherColumn() {
        let matrix = SaddlePointsMatrix("89 1903 3\n18 3 1\n9 4 800")
        XCTAssertEqual([1903, 3, 4], matrix.columns[1])
    }

    func testNoSaddlePoint() {
        let matrix = SaddlePointsMatrix("2 1\n1 2")
        XCTAssertEqualMultiArray([[Int]()], matrix.saddlePoints)
    }

    func testASaddlePoint() {
        let matrix = SaddlePointsMatrix("1 2\n3 4")
        XCTAssertEqualMultiArray([[0, 1]], matrix.saddlePoints)
    }

    func testAnotherSaddlePoint() {
        let matrix = SaddlePointsMatrix("18 3 39 19 91\n38 10 8 77 320\n3 4 8 6 7")
        XCTAssertEqualMultiArray([[2, 2]], matrix.saddlePoints)
    }

    func testMultipleSaddlePoints() {
        let matrix = SaddlePointsMatrix("4 5 4\n3 5 5\n1 5 4")
        XCTAssertEqualMultiArray([[0, 1], [1, 1], [2, 1]], matrix.saddlePoints)
    }

    static var allTests: [(String, (SaddlePointsTests) -> () throws -> Void)] {
        return [
            ("testExtractARow", testExtractARow),
            ("testExtractSameRowAgain", testExtractSameRowAgain),
            ("testExtractOtherRow", testExtractOtherRow),
            ("testExtractOtherRowAgain", testExtractOtherRowAgain),
            ("testExtractAColumn", testExtractAColumn),
            ("testExtractAnotherColumn", testExtractAnotherColumn),
            ("testNoSaddlePoint", testNoSaddlePoint),
            ("testASaddlePoint", testASaddlePoint),
            ("testAnotherSaddlePoint", testAnotherSaddlePoint),
            ("testMultipleSaddlePoints", testMultipleSaddlePoints),
        ]
    }
}
