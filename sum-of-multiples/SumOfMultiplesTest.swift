import XCTest


class SumOfMultiplesTest:XCTestCase {
    
    
    func testSumTo1(){
        let result = SumOfMultiples.toLimit(1)
        
        XCTAssertTrue(0 == result)
    }
    
    func testSumTo3(){
        XCTAssertTrue(3 == SumOfMultiples.toLimit(4))
    }
    
    func testSumTo10(){
        XCTAssertTrue(23 == SumOfMultiples.toLimit(10))
    }
   
    func testSumTo1000(){
        XCTAssertTrue(233168 == SumOfMultiples.toLimit(1000))
    }
    
    func testConfigurable_7_13_17_to_20(){
        XCTAssertTrue(51 == SumOfMultiples.toLimit(20, inMultiples: [7, 13, 17]))

    }
    
    func testConfigurable_43_47_to_10000(){
        XCTAssertTrue(2203160 == SumOfMultiples.toLimit(10000, inMultiples: [43, 47]))
        
    }

    
    func testConfigurable_0_to_10(){
        XCTAssertTrue(0 == SumOfMultiples.toLimit(10, inMultiples: [0]))
        
    }


    func testConfigurable_0_1_to_10(){
        XCTAssertTrue(45 == SumOfMultiples.toLimit(10, inMultiples: [0, 1]))
    }
    
}
