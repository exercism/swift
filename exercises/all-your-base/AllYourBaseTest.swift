#if swift(>=3.0)
    import XCTest
#endif

class AllYourBaseTest: XCTestCase {
    
    func errorThrown<T, U: Error>(byExpression expression: @autoclosure () throws -> T) -> U? {
        do {
            let _ = try expression()
            return nil
        } catch {
            return error as? U
        }
    }
    
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
        let error: BaseError? = errorThrown(byExpression: try Base.outputDigits(inputBase: 2, inputDigits: [1, -1, 1, 0, 1, 0], outputBase: 10))
        XCTAssertTrue(error == .negativeDigit)
    }
    
    func testInvalidPositiveDigit() {
        let error: BaseError? = errorThrown(byExpression: try Base.outputDigits(inputBase: 2, inputDigits: [1, 2, 1, 0, 1, 0], outputBase: 10))
        XCTAssertTrue(error == .invalidPositiveDigit)
    }
    
    func testFirstBaseIsOne() {
        let error: BaseError? = errorThrown(byExpression: try Base.outputDigits(inputBase: 1, inputDigits: [], outputBase: 10))
        XCTAssertTrue(error == .invalidInputBase)
    }
    
    func testSecondBaseIsOne() {
        let error: BaseError? = errorThrown(byExpression: try Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 1))
        XCTAssertTrue(error == .invalidOutputBase)
    }
    
    func testFirstBaseIsZero() {
        let error: BaseError? = errorThrown(byExpression: try Base.outputDigits(inputBase: 0, inputDigits: [], outputBase: 10))
        XCTAssertTrue(error == .invalidInputBase)
    }
    
    func testSecondBaseIsZero() {
        let error: BaseError? = errorThrown(byExpression: try Base.outputDigits(inputBase: 10, inputDigits: [7], outputBase: 0))
        XCTAssertTrue(error == .invalidOutputBase)
    }
    
    func testFirstBaseIsNegative() {
        let error: BaseError? = errorThrown(byExpression: try Base.outputDigits(inputBase: -2, inputDigits: [1], outputBase: 10))
        XCTAssertTrue(error == .invalidInputBase)
    }
    
    func testSecondBaseIsNegative() {
        let error: BaseError? = errorThrown(byExpression: try Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: -7))
        XCTAssertTrue(error == .invalidOutputBase)
    }
}
