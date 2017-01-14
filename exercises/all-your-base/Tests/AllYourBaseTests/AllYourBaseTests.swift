import XCTest
@testable import AllYourBase

class AllYourBaseTests: XCTestCase {
    func testSingleBitOneToDecimal() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: 10), [1])
    }

    func testBinaryToSingleDecimal() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1], outputBase: 10), [5])
    }

    func testSingleDecimalToBinary() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 10, inputDigits: [5], outputBase: 2), [1, 0, 1])
    }

    func testBinaryToMultipleDecimal() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 10), [4, 2])
    }

    func testDecimalToBinary() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 10, inputDigits: [4, 2], outputBase: 2), [1, 0, 1, 0, 1, 0])
    }

    func testTrinaryToHexadecimal() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 3, inputDigits: [1, 1, 2, 0], outputBase: 16), [2, 10])
    }

    func testHexadecimalToTrinary() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 16, inputDigits: [2, 10], outputBase: 3), [1, 1, 2, 0])
    }

    func test15BitInteger() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 97, inputDigits: [3, 46, 60], outputBase: 73), [6, 10, 45])
    }

    func testEmptyList() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 2, inputDigits: [], outputBase: 10), [])
    }

    func testSingleZero() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 10, inputDigits: [0], outputBase: 2), [])
    }

    func testMultipleZeros() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 10, inputDigits: [0, 0, 0], outputBase: 2), [])
    }

    func testLeadingZeros() {
        XCTAssertEqual(try! Base.outputDigits(inputBase: 7, inputDigits: [0, 6, 0], outputBase: 10), [4, 2])
    }

    func testNegativeDigit() {
        XCTAssertThrowsError(try Base.outputDigits(inputBase: 2, inputDigits: [1, -1, 1, 0, 1, 0], outputBase: 10)) { error in
            XCTAssertEqual(error as? BaseError, BaseError.negativeDigit)
        }
    }

    func testInvalidPositiveDigit() {
        XCTAssertThrowsError(try Base.outputDigits(inputBase: 2, inputDigits: [1, 2, 1, 0, 1, 0], outputBase: 10)) { error in
            XCTAssertEqual(error as? BaseError, BaseError.invalidPositiveDigit)
        }
    }

    func testFirstBaseIsOne() {
        XCTAssertThrowsError(try Base.outputDigits(inputBase: 1, inputDigits: [], outputBase: 10)) { error in
            XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
        }
    }

    func testSecondBaseIsOne() {
        XCTAssertThrowsError(try Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 1)) { error in
            XCTAssertEqual(error as? BaseError, BaseError.invalidOutputBase)
        }
    }

    func testFirstBaseIsZero() {
        XCTAssertThrowsError(try Base.outputDigits(inputBase: 0, inputDigits: [], outputBase: 10)) { error in
            XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
        }
    }

    func testSecondBaseIsZero() {
        XCTAssertThrowsError(try Base.outputDigits(inputBase: 10, inputDigits: [7], outputBase: 0)) { error in
            XCTAssertEqual(error as? BaseError, BaseError.invalidOutputBase)
        }
    }

    func testFirstBaseIsNegative() {
        XCTAssertThrowsError(try Base.outputDigits(inputBase: -2, inputDigits: [1], outputBase: 10)) { error in
            XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
        }
    }

    func testSecondBaseIsNegative() {
        XCTAssertThrowsError(try Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: -7)) { error in
            XCTAssertEqual(error as? BaseError, BaseError.invalidOutputBase)
        }
    }

    static var allTests: [(String, (AllYourBaseTests) -> () throws -> Void)] {
        return [
            ("testSingleBitOneToDecimal", testSingleBitOneToDecimal),
            ("testBinaryToSingleDecimal", testBinaryToSingleDecimal),
            ("testSingleDecimalToBinary", testSingleDecimalToBinary),
            ("testBinaryToMultipleDecimal", testBinaryToMultipleDecimal),
            ("testDecimalToBinary", testDecimalToBinary),
            ("testTrinaryToHexadecimal", testTrinaryToHexadecimal),
            ("testHexadecimalToTrinary", testHexadecimalToTrinary),
            ("test15BitInteger", test15BitInteger),
            ("testSingleZero", testSingleZero),
            ("testMultipleZeros", testMultipleZeros),
            ("testLeadingZeros", testLeadingZeros),
            ("testNegativeDigit", testNegativeDigit),
            ("testInvalidPositiveDigit", testInvalidPositiveDigit),
            ("testFirstBaseIsOne", testFirstBaseIsOne),
            ("testSecondBaseIsOne", testSecondBaseIsOne),
            ("testFirstBaseIsZero", testFirstBaseIsZero),
            ("testSecondBaseIsZero", testSecondBaseIsZero),
            ("testFirstBaseIsNegative", testFirstBaseIsNegative),
            ("testSecondBaseIsNegative", testSecondBaseIsNegative),
        ]
    }
}
