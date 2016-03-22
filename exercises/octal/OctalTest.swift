import XCTest



class OctalTest: XCTestCase
{
    
    func testOctal1IsDecimal1() {
        XCTAssertEqual(1, Int(Octal("1")))
    }
    
    func testOctal10IsDecimal8() {
        XCTAssertEqual(8, Int(Octal("10")))
    }
    
    func testOctal17IsDecimal15() {
        XCTAssertEqual(15, Int(Octal("17")))
    }
    
    func testOctal11IsDecimal9() {
        XCTAssertEqual(9, Int(Octal("11")))
    }
    
    func testOctal130IsDecimal88() {
        XCTAssertEqual(88, Int(Octal("130")))
    }
    
    func testOctal2047IsDecimal1063() {
        XCTAssertEqual(1063, Int(Octal("2047")))
    }
    
    func testOctal7777IsDecimal4095() {
        XCTAssertEqual(4095, Int(Octal("7777")))
    }
    
    func testOctal1234567IsDecimal342391() {
        XCTAssertEqual(342391, Int(Octal("1234567")))
    }
    
    func testInvalidOctalIsDecimal0() {
        XCTAssertEqual(0, Int(Octal("carrot")))
    }
    
    func test8IsseenasInvalidandreturns0() {
        XCTAssertEqual(0, Int(Octal("8")))
    }
    
    func test9IsseenasInvalidandreturns0() {
        XCTAssertEqual(0, Int(Octal("9")))
    }
    
    func test6789IsseenasInvalidandreturns0() {
        XCTAssertEqual(0, Int(Octal("6789")))
    }
    
    func testabc1zIsseenasInvalidandreturns0() {
        XCTAssertEqual(0, Int(Octal("abc1z")))
    }
    
    func testvalidOctalformattedstring011IsDecimal9() {
        XCTAssertEqual(9, Int(Octal("011")))
    }
    
    
}