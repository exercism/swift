import XCTest

// Apple Swift version 2.1

class HexadecimalTest: XCTestCase {
    
    func testHex1IsDecimal1() {
        XCTAssertEqual(1, Hexadecimal("1").toDecimal())
    }
    
    func testHexCIsDecimal12() {
        XCTAssertEqual(12, Hexadecimal("c").toDecimal())
    }
    
    func testHex10IsDecimal16() {
        XCTAssertEqual(16, Hexadecimal("10").toDecimal())
    }
    
    func testHexAFIsDecimal175() {
        XCTAssertEqual(175, Hexadecimal("af").toDecimal())
    }
    
    func testHex100IsDecimal256() {
        XCTAssertEqual(256, Hexadecimal("100").toDecimal())
    }
    
    func testHex19aceIsDecimal105166() {
        XCTAssertEqual(105_166, Hexadecimal("19ace").toDecimal())
    }
    
    func testInvalidHexIsNil() {
        XCTAssertNil(Hexadecimal("carrot").toDecimal())
    }
    
    func testBlack() {
        XCTAssertEqual(0, Hexadecimal("000000").toDecimal())
    }
    
    func testWhite() {
        XCTAssertEqual(16_777_215, Hexadecimal("ffffff").toDecimal())
    }
    
    func testYellow() {
        XCTAssertEqual(16_776_960, Hexadecimal("ffff00").toDecimal())
    }
    
}