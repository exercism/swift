import XCTest
@testable import Binary

class BinaryTests: XCTestCase {

    func testBinary0IsDecimal0() {
        XCTAssertEqual( 0, Int(Binary("0")))
    }

    func testBinary1isDecimal1() {
        XCTAssertEqual( 1, Int(Binary("1")))
    }

    func testBinary10isDecimal2() {
        XCTAssertEqual( 2, Int(Binary("10")))
    }

    func testBinary11isDecimal3() {
        XCTAssertEqual( 3, Int(Binary("11")))
    }

    func testBinary100isDecimal4() {
        XCTAssertEqual( 4, Int(Binary("100")))
    }

    func testBinary1001isDecimal9() {
        XCTAssertEqual( 9, Int(Binary("1001")))
    }

    func testBinary11010isDecimal26() {
        XCTAssertEqual( 26, Int(Binary("11010")))
    }

    func testBinary10001101000isDecimal1128() {
        XCTAssertEqual( 1128, Int(Binary("10001101000")))
    }

    func testBinaryIgnoresLeadingZeros() {
        XCTAssertEqual( 31, Int(Binary("000011111")))
    }

    func testInvalidBinaryIsDecimal0() {
        XCTAssertNil ( Binary("carrot123"))
    }

    func testInvalidBinaryNumbers() {
        XCTAssertNil ( Binary("012"))
        XCTAssertNil ( Binary("10nope"))
        XCTAssertNil ( Binary("nope10"))

    }

    static var allTests: [(String, (BinaryTests) -> () throws -> Void)] {
        return [
            ("testBinary0IsDecimal0", testBinary0IsDecimal0),
            ("testBinary1isDecimal1", testBinary1isDecimal1),
            ("testBinary10isDecimal2", testBinary10isDecimal2),
            ("testBinary11isDecimal3", testBinary11isDecimal3),
            ("testBinary100isDecimal4", testBinary100isDecimal4),
            ("testBinary1001isDecimal9", testBinary1001isDecimal9),
            ("testBinary11010isDecimal26", testBinary11010isDecimal26),
            ("testBinary10001101000isDecimal1128", testBinary10001101000isDecimal1128),
            ("testBinaryIgnoresLeadingZeros", testBinaryIgnoresLeadingZeros),
            ("testInvalidBinaryIsDecimal0", testInvalidBinaryIsDecimal0),
            ("testInvalidBinaryNumbers", testInvalidBinaryNumbers),
        ]
    }
}
