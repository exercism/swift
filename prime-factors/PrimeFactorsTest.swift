import XCTest


class BlankTest: XCTestCase {
    
    func test1() {
        XCTAssertEqual([], PrimeFactors.For(1))
    }
    
    func test2() {
        XCTAssertEqual([2] , PrimeFactors.For(2))
    }
    
    func test3() {
        XCTAssertEqual([3], PrimeFactors.For(3))
    }
    
    func test4() {
        XCTAssertEqual([2, 2], PrimeFactors.For(4))
    }
    
    func test6() {
        XCTAssertEqual([2, 3], PrimeFactors.For(6))
    }
    
    func test8() {
        XCTAssertEqual([2, 2, 2], PrimeFactors.For(8))
    }
    
    func test9() {
        XCTAssertEqual([3, 3], PrimeFactors.For(9))
    }
    
    func test27() {
        XCTAssertEqual([3, 3, 3], PrimeFactors.For(27))
    }
    
    func test625() {
        XCTAssertEqual([5, 5, 5, 5], PrimeFactors.For(625))
    }
    
    func test901255() {
        XCTAssertEqual([5, 17, 23, 461], PrimeFactors.For(901_255))
    }
    
    func test93819012551() {
        XCTAssertEqual([11, 9539, 894_119], PrimeFactors.For(93_819_012_551))
    }
    
    
    
}

