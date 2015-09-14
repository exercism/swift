
import XCTest

// Apple Swift version 2.0

// Return multiple types and compare by overloading ==

class GrainsTest: XCTestCase {
    
    func testInvalidInput1() {
        XCTAssertTrue((result: 0, error: "Input[65] invalid. Input should be between 1 and 64 (inclusive)") == Grains.square(65))
    }
    
    func testInvalidInput2() {
        XCTAssertTrue((result: 0, error: "Input[0] invalid. Input should be between 1 and 64 (inclusive)") == Grains.square(0))
    }
    
    func testInvalidInput3() {
        XCTAssertTrue((result: 0, error: "Input[-1] invalid. Input should be between 1 and 64 (inclusive)") == Grains.square(-1))
    }
    
    func testSquare1() {
        XCTAssertTrue((result: 1, error: nil) == Grains.square(1) )
    }
    
    func testSquare2() {
        XCTAssertTrue((result: 2, error: nil) == Grains.square(2))
    }

    func testSquare3() {
        XCTAssertTrue((result: 4, error: nil) == Grains.square(3))
    }

    func testSquare4() {
        XCTAssertTrue((result: 8, error: nil) == Grains.square(4))
    }

    func testSquare16() {
        XCTAssertTrue((result: 32_768, error: nil) == Grains.square(16))
    }

    func testSquare32() {
        XCTAssertTrue((result: 2_147_483_648, error: nil) == Grains.square(32))
    }

    func testSquare64() {
        XCTAssertTrue((result:9_223_372_036_854_775_808 , error: nil) == Grains.square(64))
    }
    
    func testTotalGrains() {
        XCTAssertTrue(18_446_744_073_709_551_615 == Grains.total)
    }
}
