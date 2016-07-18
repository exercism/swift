
import XCTest

class AllYourBaseTest: XCTestCase {
    
    func errorThrownByExpression<T, U: ErrorType>(@autoclosure expression: () throws -> T) -> U? {
        do {
            try expression()
            return nil
        } catch {
            return error as? U
        }
    }
    
    func testSingleBitOneToDecimal() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(2, inputDigits: [1], outputBase: 10), [1])
    }
    
    func testBinaryToSingleDecimal() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(2, inputDigits: [1, 0, 1], outputBase: 10), [5])
    }
    
    func testSingleDecimalToBinary() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(10, inputDigits: [5], outputBase: 2), [1, 0, 1])
    }
    
    func testBinaryToMultipleDecimal() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 10), [4, 2])
    }
    
    func testDecimalToBinary() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(10, inputDigits: [4, 2], outputBase: 2), [1, 0, 1, 0, 1, 0])
    }
    
    func testTrinaryToHexadecimal() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(3, inputDigits: [1, 1, 2, 0], outputBase: 16), [2, 10])
    }
    
    func testHexadecimalToTrinary() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(16, inputDigits: [2, 10], outputBase: 3), [1, 1, 2, 0])
    }
    
    func test15BitInteger() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(97, inputDigits: [3, 46, 60], outputBase: 73), [6, 10, 45])
    }
    
    func testEmptyList() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(2, inputDigits: [], outputBase: 10), [])
    }
    
    func testSingleZero() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(10, inputDigits: [0], outputBase: 2), [])
    }
    
    func testMultipleZeros() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(10, inputDigits: [0, 0, 0], outputBase: 2), [])
    }
    
    func testLeadingZeros() {
        XCTAssertEqual(try! Base.outputDigitsFromInputBase(7, inputDigits: [0, 6, 0], outputBase: 10), [4, 2])
    }
    
    func testNegativeDigit() {
        let error: BaseError? = errorThrownByExpression(try Base.outputDigitsFromInputBase(2, inputDigits: [1, -1, 1, 0, 1, 0], outputBase: 10))
        XCTAssertTrue(error == .NegativeDigit)
    }
    
    func testInvalidPositiveDigit() {
        let error: BaseError? = errorThrownByExpression(try Base.outputDigitsFromInputBase(2, inputDigits: [1, 2, 1, 0, 1, 0], outputBase: 10))
        XCTAssertTrue(error == .InvalidPositiveDigit)
    }
    
    func testFirstBaseIsOne() {
        let error: BaseError? = errorThrownByExpression(try Base.outputDigitsFromInputBase(1, inputDigits: [], outputBase: 10))
        XCTAssertTrue(error == .InvalidInputBase)
    }
    
    func testSecondBaseIsOne() {
        let error: BaseError? = errorThrownByExpression(try Base.outputDigitsFromInputBase(2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 1))
        XCTAssertTrue(error == .InvalidOutputBase)
    }
    
    func testFirstBaseIsZero() {
        let error: BaseError? = errorThrownByExpression(try Base.outputDigitsFromInputBase(0, inputDigits: [], outputBase: 10))
        XCTAssertTrue(error == .InvalidInputBase)
    }

    func testSecondBaseIsZero() {
        let error: BaseError? = errorThrownByExpression(try Base.outputDigitsFromInputBase(10, inputDigits: [7], outputBase: 0))
        XCTAssertTrue(error == .InvalidOutputBase)
    }

    func testFirstBaseIsNegative() {
        let error: BaseError? = errorThrownByExpression(try Base.outputDigitsFromInputBase(-2, inputDigits: [1], outputBase: 10))
        XCTAssertTrue(error == .InvalidInputBase)
    }

    func testSecondBaseIsNegative() {
        let error: BaseError? = errorThrownByExpression(try Base.outputDigitsFromInputBase(2, inputDigits: [1], outputBase: -7))
        XCTAssertTrue(error == .InvalidOutputBase)
    }
}

