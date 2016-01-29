import XCTest

// Apple Swift version 2.1

class HexadecimalTest: XCTestCase {
    
    func testHex1IsDecimal1() {
        XCTAssertEqual(1, Int(hex: "1"))
    }
    
    func testHexCIsDecimal12() {
        XCTAssertEqual(12, Int(hex: "c"))
    }
    
    func testHex10IsDecimal16() {
        XCTAssertEqual(16, Int(hex: "10"))
    }
    
    func testHexAFIsDecimal175() {
        XCTAssertEqual(175, Int(hex: "af"))
    }
    
    func testHex100IsDecimal256() {
        XCTAssertEqual(256, Int(hex: "100"))
    }
    
    func testHex19aceIsDecimal105166() {
        XCTAssertEqual(105_166, Int(hex: "19ace"))
    }
    
    func testInvalidHexIsNil() {
        XCTAssertNil(Int(hex: "carrot"))
    }
    
    func testBlack() {
        XCTAssertEqual(0, Int(hex: "000000"))
    }
    
    func testWhite() {
        XCTAssertEqual(16_777_215, Int(hex: "ffffff"))
    }
    
    func testYellow() {
        XCTAssertEqual(16_776_960, Int(hex: "ffff00"))
    }
    
}