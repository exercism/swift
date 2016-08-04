#if swift(>=3.0)
    import XCTest
#endif

class HexadecimalTest: XCTestCase {

    func testHex1IsDecimal1() {
        XCTAssertEqual(1, Int(Hexadecimal("1")))
    }

    func testHexCIsDecimal12() {
        XCTAssertEqual(12, Int(Hexadecimal("c")))
    }

    func testHex10IsDecimal16() {
        XCTAssertEqual(16, Int(Hexadecimal("10")))
    }

    func testHexAFIsDecimal175() {
        XCTAssertEqual(175, Int(Hexadecimal("af")))
    }

    func testHex100IsDecimal256() {
        XCTAssertEqual(256, Int(Hexadecimal("100")))
    }

    func testHex19aceIsDecimal105166() {
        XCTAssertEqual(105_166, Int(Hexadecimal("19ace")))
    }

    func testInvalidHexIsNil() {
        XCTAssertNil(Int(Hexadecimal("carrot")))
    }

    func testBlack() {
        XCTAssertEqual(0, Int(Hexadecimal("000000")))
    }

    func testWhite() {
        XCTAssertEqual(16_777_215, Int(Hexadecimal("ffffff")))
    }

    func testYellow() {
        XCTAssertEqual(16_776_960, Int(Hexadecimal("ffff00")))
    }

}
