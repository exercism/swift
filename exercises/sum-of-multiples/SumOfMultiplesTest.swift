import XCTest




class SumOfMultiplesTest:XCTestCase {
    
    func testSumTo1() {
        XCTAssertEqual(0, SumOfMultiples.toLimit(1))
    }
    
    func testSumTo3() {
        XCTAssertEqual(3,  SumOfMultiples.toLimit(4))
    }
    
    func testSumTo10() {
        XCTAssertEqual(23,  SumOfMultiples.toLimit(10))
    }

    func testSumTo100() {
        XCTAssertEqual(2318,  SumOfMultiples.toLimit(100))
    }
   
    func testSumTo1000() {
        XCTAssertEqual(233168,  SumOfMultiples.toLimit(1000))
    }
    
    func testConfigurable_7_13_17_to_20() {
        XCTAssertEqual(51,  SumOfMultiples.toLimit(20, inMultiples: [7, 13, 17]))
    }
    
    func testConfigurable_4_6_to_15() {
        XCTAssertEqual(30,  SumOfMultiples.toLimit(15, inMultiples: [4, 6]))
    }
    
    func testConfigurable_5_6_8_to_150() {
        XCTAssertEqual(4419,  SumOfMultiples.toLimit(150, inMultiples: [5, 6, 8]))
    }
    
    func testConfigurable_43_47_to_10000() {
        XCTAssertEqual(2203160,  SumOfMultiples.toLimit(10000, inMultiples: [43, 47]))
    }

    func testConfigurable_0_to_10() {
        XCTAssertEqual(0,  SumOfMultiples.toLimit(10, inMultiples: [0]))
    }

    func testConfigurable_0_1_to_10() {
        XCTAssertEqual(45,  SumOfMultiples.toLimit(10, inMultiples: [0, 1]))
    }
    
}
