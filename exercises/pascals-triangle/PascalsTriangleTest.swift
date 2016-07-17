#if swift(>=3.0)
    import XCTest
#endif

class PascalsTriangleTest: XCTestCase {

    func testOneRow() {
        let triangle = PascalsTriangle(1)
        XCTAssertEqual([[1]], triangle.rows)
    }

    func testTwoRows() {
        let triangle = PascalsTriangle(2)
        XCTAssertEqual([[1], [1, 1]], triangle.rows)
    }

    func testThreeRows() {
        let triangle = PascalsTriangle(3)
        XCTAssertEqual([[1], [1, 1], [1, 2, 1]], triangle.rows)
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

}
