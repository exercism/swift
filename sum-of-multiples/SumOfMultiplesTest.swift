import XCTest


class SumOfMultiplesTest: XCTestCase {
    
    
    func testSumTo1(){
        let result = SumOfMultiples(1)
        
        XCTAssertTrue(0 == result)
    }
    
    func testSumTo3(){
        XCTAssertTrue(3 == SumOfMultiples(4))
    }
    
    func testSumTo10(){
        XCTAssertTrue(23 == SumOfMultiples(10))
    }
   
    func testSumTo1000(){
        XCTAssertTrue(233168 == SumOfMultiples(1000))
    }
    
    func testConfigurable_7_13_17_to_20(){
        XCTAssertTrue(51 == SumOfMultiples(20, [7, 13, 17]))

    }
    
    func testConfigurable_43_47_to_10000(){
        XCTAssertTrue(2203160 == SumOfMultiples(10000, [43, 47]))
        
    }

    
    func testConfigurable_0_to_10(){
        XCTAssertTrue(0 == SumOfMultiples(10, [0]))
        
    }


    func testConfigurable_0_1_to_10(){
        XCTAssertTrue(45 == SumOfMultiples(10, [0, 1]))
    }
    
}
