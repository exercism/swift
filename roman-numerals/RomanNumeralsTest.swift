import XCTest

class  RomanNumeralsTest: XCTestCase {
    func test1() {
        XCTAssertEqual("I", 1.toRoman)
    }
    
    func test2() {
        XCTAssertEqual("II", 2.toRoman)
    }
    
    func test3() {
        XCTAssertEqual("III", 3.toRoman)
    }
    
    func test4() {
        XCTAssertEqual("IV", 4.toRoman)
    }
    
    func test5() {
        XCTAssertEqual("V", 5.toRoman)
    }
    
    func test6() {
        XCTAssertEqual("VI", 6.toRoman)
    }
    
    func test9() {
        XCTAssertEqual("IX", 9.toRoman)
    }
    
    func test27() {
        XCTAssertEqual("XXVII", 27.toRoman)
    }
    
    func test48() {
        XCTAssertEqual("XLVIII", 48.toRoman)
    }
    
    func test59() {
        XCTAssertEqual("LIX", 59.toRoman)
    }
    
    func test93() {
        XCTAssertEqual("XCIII", 93.toRoman)
    }
    
    func test141() {
        XCTAssertEqual("CXLI", 141.toRoman)
    }
    
    func test163() {
        XCTAssertEqual("CLXIII", 163.toRoman)
    }
    
    func test402() {
        XCTAssertEqual("CDII", 402.toRoman)
    }
    
    func test575() {
        XCTAssertEqual("DLXXV", 575.toRoman)
    }
    
    func test911() {
        XCTAssertEqual("CMXI", 911.toRoman)
    }
    
    func test1024() {
        XCTAssertEqual("MXXIV", 1024.toRoman)
    }
    
    func test3000() {
        XCTAssertEqual("MMM", 3000.toRoman)
    }
    
}
