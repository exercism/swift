#if swift(>=3.0)
    import XCTest
#endif

class NthPrimeTest: XCTestCase {

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

}
