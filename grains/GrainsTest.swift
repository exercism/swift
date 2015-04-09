import Foundation
import XCTest

//Return multiple types and compare by overloading ==

class GrainsTest: XCTestCase {
    
    func test_invalidInput1(){
        XCTAssertTrue((result: 0, error: "Input[65] invalid. Input should be between 1 and 64 (inclusive)") == Grains.square(65))
    }
    
    func test_invalidInput2(){
        XCTAssertTrue((result: 0, error: "Input[0] invalid. Input should be between 1 and 64 (inclusive)") == Grains.square(0))
    }
    
    func test_invalidInput3(){
        XCTAssertTrue((result: 0, error: "Input[-1] invalid. Input should be between 1 and 64 (inclusive)") == Grains.square(-1))
    }
    
    func test_square_1(){
        XCTAssertTrue((result: 1, error: nil) == Grains.square(1) )
    }
    
    func test_square_2(){
        XCTAssertTrue((result: 2, error: nil) == Grains.square(2))
    }

    func test_square_3(){
        XCTAssertTrue((result: 4, error: nil) == Grains.square(3))
    }

    func test_square_4(){
        XCTAssertTrue((result: 8, error: nil) == Grains.square(4))
    }

    func test_square_16(){
        XCTAssertTrue((result: 32_768, error: nil) == Grains.square(16))
    }

    func test_square_32(){
        XCTAssertTrue((result: 2_147_483_648, error: nil) == Grains.square(32))
    }

    func test_square_64(){
        XCTAssertTrue((result:9_223_372_036_854_775_808 , error: nil) == Grains.square(64))
    }
    
    func test_total_grains(){
        XCTAssertTrue(18_446_744_073_709_551_615 == Grains.total)
    }
}
