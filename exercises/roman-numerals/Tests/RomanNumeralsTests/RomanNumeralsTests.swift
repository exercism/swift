import XCTest
@testable import RomanNumerals

class RomanNumeralsTests: XCTestCase {
    func test1() {
        XCTAssertEqual("I", String(RomanNumeral(1)))
    }

    func test2() {
        XCTAssertEqual("II", String(RomanNumeral(2)))
    }

    func test3() {
        XCTAssertEqual("III", String(RomanNumeral(3)))
    }

    func test4() {
        XCTAssertEqual("IV", String(RomanNumeral(4)))
    }

    func test5() {
        XCTAssertEqual("V", String(RomanNumeral(5)))
    }

    func test6() {
        XCTAssertEqual("VI", String(RomanNumeral(6)))
    }

    func test9() {
        XCTAssertEqual("IX", String(RomanNumeral(9)))
    }

    func test27() {
        XCTAssertEqual("XXVII", String(RomanNumeral(27)))
    }

    func test48() {
        XCTAssertEqual("XLVIII", String(RomanNumeral(48)))
    }

    func test59() {
        XCTAssertEqual("LIX", String(RomanNumeral(59)))
    }

    func test93() {
        XCTAssertEqual("XCIII", String(RomanNumeral(93)))
    }

    func test141() {
        XCTAssertEqual("CXLI", String(RomanNumeral(141)))
    }

    func test163() {
        XCTAssertEqual("CLXIII", String(RomanNumeral(163)))
    }

    func test402() {
        XCTAssertEqual("CDII", String(RomanNumeral(402)))
    }

    func test575() {
        XCTAssertEqual("DLXXV", String(RomanNumeral(575)))
    }

    func test911() {
        XCTAssertEqual("CMXI", String(RomanNumeral(911)))
    }

    func test1024() {
        XCTAssertEqual("MXXIV", String(RomanNumeral(1024)))
    }

    func test3000() {
        XCTAssertEqual("MMM", String(RomanNumeral(3000)))
    }

    static var allTests: [(String, (RomanNumeralsTests) -> () throws -> Void)] {
        return [
            ("test1", test1),
            ("test2", test2),
            ("test3", test3),
            ("test4", test4),
            ("test5", test5),
            ("test6", test6),
            ("test9", test9),
            ("test27", test27),
            ("test48", test48),
            ("test59", test59),
            ("test93", test93),
            ("test141", test141),
            ("test163", test163),
            ("test402", test402),
            ("test575", test575),
            ("test911", test911),
            ("test1024", test1024),
            ("test3000", test3000),
        ]
    }
}
