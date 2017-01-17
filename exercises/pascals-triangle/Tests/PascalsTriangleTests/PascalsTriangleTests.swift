import XCTest
@testable import PascalsTriangle

private extension XCTest {
    func XCTAssertEqualMultiArray(_ aArray1: [[Int]], _ aArray2: [[Int]]) {
        XCTAssertEqual(Array(aArray1.joined()), Array(aArray2.joined()))
    }
}

class PascalsTriangleTests: XCTestCase {
    func testOneRow() {
        let triangle = PascalsTriangle(1)
        XCTAssertEqualMultiArray([[1]], triangle.rows)
    }

    func testTwoRows() {
        let triangle = PascalsTriangle(2)
        XCTAssertEqualMultiArray([[1], [1, 1]], triangle.rows)
    }

    func testThreeRows() {
        let triangle = PascalsTriangle(3)
        XCTAssertEqualMultiArray([[1], [1, 1], [1, 2, 1]], triangle.rows)
    }

    func testFourthRow() {
        let triangle = PascalsTriangle(4)
        XCTAssertEqual([1, 3, 3, 1], triangle.rows.last!)
    }

    func testFifthRow() {
        let triangle = PascalsTriangle(5)
        XCTAssertEqual([1, 4, 6, 4, 1], triangle.rows.last!)
    }

    func testTwentiethRow() {
        let triangle = PascalsTriangle(20)
        let expected = [
            1, 19, 171, 969, 3876, 11_628, 27_132, 50_388, 75_582, 92_378, 92_378,
            75_582, 50_388, 27_132, 11_628, 3876, 969, 171, 19, 1
        ]
        XCTAssertEqual(expected, triangle.rows.last!)
    }

    static var allTests: [(String, (PascalsTriangleTests) -> () throws -> Void)] {
        return [
            ("testOneRow", testOneRow),
            ("testTwoRows", testTwoRows),
            ("testThreeRows", testThreeRows),
            ("testFourthRow", testFourthRow),
            ("testFifthRow", testFifthRow),
            ("testTwentiethRow", testTwentiethRow),
        ]
    }
}
