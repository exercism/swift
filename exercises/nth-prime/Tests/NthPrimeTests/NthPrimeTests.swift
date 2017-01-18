import XCTest
@testable import NthPrime

class NthPrimeTests: XCTestCase {
    func testFirst() {
        XCTAssertEqual(2, Prime.nth(1))
    }

    func testSecond() {
        XCTAssertEqual(3, Prime.nth(2))
    }

    func testSixthPrime() {
        XCTAssertEqual(13, Prime.nth(6))
    }

    func testBigPrime() {
        XCTAssertEqual(104_743, Prime.nth(10_001))
    }

    func testWeirdCase() {
        XCTAssertNil(Prime.nth(0))
    }

    static var allTests: [(String, (NthPrimeTests) -> () throws -> Void)] {
        return [
            ("testFirst", testFirst),
            ("testSecond", testSecond),
            ("testSixthPrime", testSixthPrime),
            ("testBigPrime", testBigPrime),
            ("testWeirdCase", testWeirdCase),
        ]
    }
}
