import XCTest
@testable import Trinary

class TrinaryTests: XCTestCase {
    func testTrinary1IsDecimal1() {
        XCTAssertEqual(1, Int(Trinary("1")))
    }

    func testTrinary2IsDecimal2() {
        XCTAssertEqual(2, Int(Trinary("2")))
    }

    func testTrinary10IsDecimal3() {
        XCTAssertEqual(3, Int(Trinary("10")))
    }

    func testTrinary11IsDecimal4() {
        XCTAssertEqual(4, Int(Trinary("11")))
    }

    func testTrinary100IsDecimal9() {
        XCTAssertEqual(9, Int(Trinary("100")))
    }

    func testTrinary112IsDecimal14() {
        XCTAssertEqual(14, Int(Trinary("112")))
    }

    func testTrinary222Is26() {
        XCTAssertEqual(26, Int(Trinary("222")))
    }

    func testTrinary1122000120Is32091() {
        XCTAssertEqual(32091, Int(Trinary("1122000120")))
    }

    func testInvalidTrinaryIsDecimal0() {
        XCTAssertEqual(0, Int(Trinary("carrot")))
    }

    static var allTests: [(String, (TrinaryTests) -> () throws -> Void)] {
        return [
            ("testTrinary1IsDecimal1", testTrinary1IsDecimal1),
            ("testTrinary2IsDecimal2", testTrinary2IsDecimal2),
            ("testTrinary10IsDecimal3", testTrinary10IsDecimal3),
            ("testTrinary11IsDecimal4", testTrinary11IsDecimal4),
            ("testTrinary100IsDecimal9", testTrinary100IsDecimal9),
            ("testTrinary112IsDecimal14", testTrinary112IsDecimal14),
            ("testTrinary222Is26", testTrinary222Is26),
            ("testTrinary1122000120Is32091", testTrinary1122000120Is32091),
            ("testInvalidTrinaryIsDecimal0", testInvalidTrinaryIsDecimal0),
        ]
    }
}
