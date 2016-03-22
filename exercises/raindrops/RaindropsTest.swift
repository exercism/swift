import XCTest




class RaindropsTest: XCTestCase {
    
    func test1() {
        XCTAssertEqual("1", Raindrops(1).sounds)
    }
    
    func test3() {
        XCTAssertEqual("Pling", Raindrops(3).sounds)
    }
    
    func test5() {
        XCTAssertEqual("Plang", Raindrops(5).sounds)
    }
    
    func test7() {
        XCTAssertEqual("Plong", Raindrops(7).sounds)
    }
    
    func test6() {
        XCTAssertEqual("Pling", Raindrops(6).sounds)
    }
    
    func test9() {
        XCTAssertEqual("Pling", Raindrops(9).sounds)
    }
    
    func test10() {
        XCTAssertEqual("Plang", Raindrops(10).sounds)
    }
    
    func test14() {
        XCTAssertEqual("Plong", Raindrops(14).sounds)
    }
    
    func test15() {
        XCTAssertEqual("PlingPlang", Raindrops(15).sounds)
    }
    
    func test21() {
        XCTAssertEqual("PlingPlong", Raindrops(21).sounds)
    }
    
    func test25() {
        XCTAssertEqual("Plang", Raindrops(25).sounds)
    }
    
    func test35() {
        XCTAssertEqual("PlangPlong", Raindrops(35).sounds)
    }
    
    func test49() {
        XCTAssertEqual("Plong", Raindrops(49).sounds)
    }
    
    func test52() {
        XCTAssertEqual("52", Raindrops(52).sounds)
    }
    
    func test105() {
        XCTAssertEqual("PlingPlangPlong", Raindrops(105).sounds)
    }
    
    func test12121() {
        XCTAssertEqual("12121", Raindrops(12_121).sounds)
    }
    
}

