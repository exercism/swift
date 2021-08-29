import XCTest
@testable import DifferenceOfSquares

class DifferenceOfSquaresTests: XCTestCase {

    func testSquareOfSumTo5() {
        XCTAssertEqual(225, Squares(5).squareOfSum)
    }

    func testSumOfSquaresTo5() {
        XCTAssertEqual(55, Squares(5).sumOfSquares)
    }

    func testDifferenceOfSquaresOfSumTo5() {
        XCTAssertEqual(170, Squares(5).differenceOfSquares)
    }

    func testSquareOfSumTo10() {
        XCTAssertEqual(3025, Squares(10).squareOfSum)
    }

    func testSumOfSquaresTo10() {
        XCTAssertEqual(385, Squares(10).sumOfSquares)
    }

    func testDifferenceOfSquaresOfSumTo10() {
        XCTAssertEqual(2640, Squares(10).differenceOfSquares)
    }

    func testSquareOfSumTo100() {
        XCTAssertEqual(25_502_500, Squares(100).squareOfSum)
    }

    func testSumOfSquaresTo100() {
        XCTAssertEqual(338_350, Squares(100).sumOfSquares)
    }

    func testDifferenceOfSquaresOfSumTo100() {
        XCTAssertEqual(25_164_150, Squares(100).differenceOfSquares)
    }

    static var allTests: [(String, (DifferenceOfSquaresTests) -> () throws -> Void)] {
        return [
            ("testSquareOfSumTo5", testSquareOfSumTo5),
            ("testSumOfSquaresTo5", testSumOfSquaresTo5),
            ("testDifferenceOfSquaresOfSumTo5", testDifferenceOfSquaresOfSumTo5),
            ("testSquareOfSumTo10", testSquareOfSumTo10),
            ("testSumOfSquaresTo10", testSumOfSquaresTo10),
            ("testDifferenceOfSquaresOfSumTo10", testDifferenceOfSquaresOfSumTo10),
            ("testSquareOfSumTo100", testSquareOfSumTo100),
            ("testSumOfSquaresTo100", testSumOfSquaresTo100),
            ("testDifferenceOfSquaresOfSumTo100", testDifferenceOfSquaresOfSumTo100),
        ]
    }
}
