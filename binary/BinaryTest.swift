import XCTest

// Apple Swift version 2.0

class BinaryTests: XCTestCase {
    
    func testBinary0IsDecimal0() {
        XCTAssertEqual( 0, Binary("0")?.toDecimal)
    }
    
    func testBinary1isDecimal1() {
        XCTAssertEqual( 1, Binary("1")?.toDecimal)
    }
    
    func testBinary10isDecimal2() {
        XCTAssertEqual( 2, Binary("10")?.toDecimal)
    }
    
    func testBinary11isDecimal3() {
        XCTAssertEqual( 3, Binary("11")?.toDecimal)
    }
    
    func testBinary100isDecimal4() {
        XCTAssertEqual( 4, Binary("100")?.toDecimal)
    }
    
    func testBinary1001isDecimal9() {
        XCTAssertEqual( 9, Binary("1001")?.toDecimal)
    }
    
    func testBinary11010isDecimal26() {
        XCTAssertEqual( 26, Binary("11010")?.toDecimal)
    }
    
    func testBinary10001101000isDecimal1128() {
        XCTAssertEqual( 1128, Binary("10001101000")?.toDecimal)
    }
    
    func testBinaryIgnoresLeadingZeros() {
        XCTAssertEqual( 31, Binary("000011111")?.toDecimal)
    }
    
    func testInvalidBinaryIsDecimal0() {
        XCTAssertNil ( Binary("carrot123")?.toDecimal)
    }
    
    func testInvalidBinaryNumbers() {
        XCTAssertNil ( Binary("012")?.toDecimal)
        XCTAssertNil ( Binary("10nope")?.toDecimal)
        XCTAssertNil ( Binary("nope10")?.toDecimal)

    }
    
}
