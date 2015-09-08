import XCTest


class RaindropsTest: XCTestCase {
    
    func test1() {
        XCTAssertEqual("1", Raindrops.convert(1))
    }
    
    func test3() {
        XCTAssertEqual("Pling", Raindrops.convert(3))
    }
    
    func test5() {
        XCTAssertEqual("Plang", Raindrops.convert(5))
    }
    
    func test7() {
        XCTAssertEqual("Plong", Raindrops.convert(7))
    }
    
    func test6() {
        XCTAssertEqual("Pling", Raindrops.convert(6))
    }
    
    func test9() {
        XCTAssertEqual("Pling", Raindrops.convert(9))
    }
    
    func test10() {
        XCTAssertEqual("Plang", Raindrops.convert(10))
    }
    
    func test14() {
        XCTAssertEqual("Plong", Raindrops.convert(14))
    }
    
    func test15() {
        XCTAssertEqual("PlingPlang", Raindrops.convert(15))
    }
    
    func test21() {
        XCTAssertEqual("PlingPlong", Raindrops.convert(21))
    }
    
    func test25() {
        XCTAssertEqual("Plang", Raindrops.convert(25))
    }
    
    func test35() {
        XCTAssertEqual("PlangPlong", Raindrops.convert(35))
    }
    
    func test49() {
        XCTAssertEqual("Plong", Raindrops.convert(49))
    }
    
    func test52() {
        XCTAssertEqual("52", Raindrops.convert(52))
    }
    
    func test105() {
        XCTAssertEqual("PlingPlangPlong", Raindrops.convert(105))
    }
    
    func test12121() {
        XCTAssertEqual("12121", Raindrops.convert(12_121))
    }
    
}

