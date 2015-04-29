import XCTest

class OctalTest: XCTestCase
{
    
    func testOctal1IsDecimal1() {
        XCTAssertEqual(1, Octal("1").toDecimal)
    }
    
    func testOctal10IsDecimal8() {
        XCTAssertEqual(8, Octal("10").toDecimal)
    }
    
    func testOctal17IsDecimal15() {
        XCTAssertEqual(15, Octal("17").toDecimal)
    }
    
    func testOctal11IsDecimal9() {
        XCTAssertEqual(9, Octal("11").toDecimal)
    }
    
    func testOctal130IsDecimal88() {
        XCTAssertEqual(88, Octal("130").toDecimal)
    }
    
    func testOctal2047IsDecimal1063() {
        XCTAssertEqual(1063, Octal("2047").toDecimal)
    }
    
    func testOctal7777IsDecimal4095() {
        XCTAssertEqual(4095, Octal("7777").toDecimal)
    }
    
    func testOctal1234567IsDecimal342391() {
        XCTAssertEqual(342391, Octal("1234567").toDecimal)
    }
    
    func testInvalidOctalIsDecimal0() {
        XCTAssertEqual(0, Octal("carrot").toDecimal)
    }
    
    func test8IsseenasInvalidandreturns0() {
        XCTAssertEqual(0, Octal("8").toDecimal)
    }
    
    func test9IsseenasInvalidandreturns0() {
        XCTAssertEqual(0, Octal("9").toDecimal)
    }
    
    func test6789IsseenasInvalidandreturns0() {
        XCTAssertEqual(0, Octal("6789").toDecimal)
    }
    
    func testabc1zIsseenasInvalidandreturns0() {
        XCTAssertEqual(0, Octal("abc1z").toDecimal)
    }
    
    func testvalidOctalformattedstring011IsDecimal9() {
        XCTAssertEqual(9, Octal("011").toDecimal)
    }
    
    
}