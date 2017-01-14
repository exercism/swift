import XCTest
@testable import hexadecimal

class hexadecimalTests: XCTestCase {

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

    static var allTests: [(String, (hexadecimalTests) -> () throws -> Void)] {
        return [
            ("testHex1IsDecimal1", testHex1IsDecimal1),
            ("testHexCIsDecimal12", testHexCIsDecimal12),
            ("testHex10IsDecimal16", testHex10IsDecimal16),
            ("testHexAFIsDecimal175", testHexAFIsDecimal175),
            ("testHex100IsDecimal256", testHex100IsDecimal256),
            ("testHex19aceIsDecimal105166", testHex19aceIsDecimal105166),
            ("testInvalidHexIsNil", testInvalidHexIsNil),
            ("testBlack", testBlack),
            ("testWhite", testWhite),
            ("testYellow", testYellow),
        ]
    }
}
