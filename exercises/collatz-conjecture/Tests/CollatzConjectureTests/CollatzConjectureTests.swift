import XCTest
@testable import CollatzConjecture

class CollatzConjectureTests: XCTestCase {

    func testZeroStepsForOne() {
        XCTAssertEqual(0, try CollatzConjecture.steps(1))
    }

    func testDivideIfEven() {
        XCTAssertEqual(4, try CollatzConjecture.steps(16))
    }

    func testEvenAndOddSteps() {
        XCTAssertEqual(9, try CollatzConjecture.steps(12))
    }

    func testLargeNumberOfEvenAndOddSteps() {
        XCTAssertEqual(152, try CollatzConjecture.steps(1_000_000))
    }

    func testZeroIsAnError() {
        XCTAssertThrowsError(try CollatzConjecture.steps(0))
    }

    func testNegativeValueIsAnError() {
        XCTAssertThrowsError(try CollatzConjecture.steps(-15))
    }

    static var allTests: [(String, (CollatzConjectureTests) -> () throws -> Void)] {
        return [
            ("testZeroStepsForOne", testZeroStepsForOne),
            ("testDivideIfEven", testDivideIfEven),
            ("testEvenAndOddSteps", testEvenAndOddSteps),
            ("testLargeNumberOfEvenAndOddSteps", testLargeNumberOfEvenAndOddSteps),
            ("testZeroIsAnError", testZeroIsAnError),
            ("testNegativeValueIsAnError", testNegativeValueIsAnError),
        ]
    }
}
