import XCTest


class TrinaryTest: XCTestCase {
    
    func testTrinary1IsDecimal1() {
        XCTAssertEqual(1, Trinary("1").toDecimal)
    }
    
    func testTrinary2IsDecimal2() {
        XCTAssertEqual(2, Trinary("2").toDecimal)
    }
    
    func testTrinary10IsDecimal3() {
        XCTAssertEqual(3, Trinary("10").toDecimal)
    }
    
    func testTrinary11IsDecimal4() {
        XCTAssertEqual(4, Trinary("11").toDecimal)
    }
    
    func testTrinary100IsDecimal9() {
        XCTAssertEqual(9, Trinary("100").toDecimal)
    }
    
    func testTrinary112IsDecimal14() {
        XCTAssertEqual(14, Trinary("112").toDecimal)
    }
    
    func testTrinary222Is26() {
        XCTAssertEqual(26, Trinary("222").toDecimal)
    }
    
    func testTrinary1122000120Is32091() {
        XCTAssertEqual(32091, Trinary("1122000120").toDecimal)
    }
    
    func testInvalidTrinaryIsDecimal0() {
        XCTAssertEqual(0, Trinary("carrot").toDecimal)
    }

    
 }

