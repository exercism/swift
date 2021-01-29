import XCTest
@testable import Grains

class GrainsTests: XCTestCase {

    func testInvalidInput1() {
        XCTAssertThrowsError(try Grains.square(65)) { error in
            if case let Grains.GrainsError.inputTooHigh(message) = error {
                XCTAssertTrue(message == "Input[65] invalid. Input should be between 1 and 64 (inclusive)")
            } else {
                XCTFail("Expected error not thrown")
            }
        }
    }

    func testInvalidInput2() {
        XCTAssertThrowsError(try Grains.square(0)) { error in
            if case let Grains.GrainsError.inputTooLow(message) = error {
                XCTAssertTrue(message == "Input[0] invalid. Input should be between 1 and 64 (inclusive)")
            } else {
                XCTFail("Expected error not thrown")
            }
        }
    }

    func testInvalidInput3() {
        XCTAssertThrowsError(try Grains.square(-1)) { error in
            if case let Grains.GrainsError.inputTooLow(message) = error {
                XCTAssertTrue(message == "Input[-1] invalid. Input should be between 1 and 64 (inclusive)")
            } else {
                XCTFail("Expected error not thrown")
            }
        }
    }

    func testSquare1() {
        XCTAssertEqual(try! Grains.square(1), 1)
    }

    func testSquare2() {
        XCTAssertEqual(try! Grains.square(2), 2)
    }

    func testSquare3() {
        XCTAssertEqual(try! Grains.square(3), 4)
    }

    func testSquare4() {
        XCTAssertEqual(try! Grains.square(4), 8)
    }

    func testSquare16() {
        XCTAssertEqual(try! Grains.square(16), 32_768)
    }

    func testSquare32() {
        XCTAssertEqual(try! Grains.square(32), 2_147_483_648)
    }

    func testSquare64() {
        XCTAssertEqual(try! Grains.square(64), 9_223_372_036_854_775_808)
    }

    func testTotalGrains() {
        XCTAssertEqual(Grains.total, 18_446_744_073_709_551_615)
    }

    static var allTests: [(String, (GrainsTests) -> () throws -> Void)] {
        return [
            ("testInvalidInput1", testInvalidInput1),
            ("testInvalidInput2", testInvalidInput2),
            ("testInvalidInput3", testInvalidInput3),
            ("testSquare1", testSquare1),
            ("testSquare2", testSquare2),
            ("testSquare3", testSquare3),
            ("testSquare4", testSquare4),
            ("testSquare16", testSquare16),
            ("testSquare32", testSquare32),
            ("testSquare64", testSquare64),
            ("testTotalGrains", testTotalGrains),
        ]
    }
}
