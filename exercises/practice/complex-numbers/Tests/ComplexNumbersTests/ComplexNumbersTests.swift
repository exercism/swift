import XCTest
@testable import ComplexNumbers

class ComplexNumbersTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRealPartOfPurelyRealNumber() {

        let input = ComplexNumber(realComponent: 1, imaginaryComponent: 0)
        let expectedOutput = Double(1)
        XCTAssertEqual(expectedOutput, input.getRealComponent())
    }

    func testRealPartOfPurelyImaginaryNumber() {

        let input = ComplexNumber(realComponent: 0, imaginaryComponent: 1)
        let expectedOutput = Double(1)
        XCTAssertEqual(expectedOutput, input.getImaginaryComponent())
    }

    func testRealPartOfNumberWithRealAndImaginary() {

        let input = ComplexNumber(realComponent: 1, imaginaryComponent: 2)
        let expectedOutput = Double(1)
        XCTAssertEqual(expectedOutput, input.getRealComponent())
    }

    func testImaginaryPartOfPurelyRealNumber() {

        let input = ComplexNumber(realComponent: 1, imaginaryComponent: 0)
        let expectedOutput = Double(0)
        XCTAssertEqual(expectedOutput, input.getImaginaryComponent())
    }

    func testImaginaryPartOfPurelyImaginaryNumber() {

        let input = ComplexNumber(realComponent: 0, imaginaryComponent: 1)
        let expectedOutput = Double(1)
        XCTAssertEqual(expectedOutput, input.getImaginaryComponent())
    }

    func testImaginaryPartOfNumberWithRealAndImaginary() {

        let input = ComplexNumber(realComponent: 1, imaginaryComponent: 2)
        let expectedOutput = Double(2)
        XCTAssertEqual(expectedOutput, input.getImaginaryComponent())
    }

    func testImaginaryUnit() {

        let multiplicand = ComplexNumber(realComponent: 0, imaginaryComponent: 1)
        let multiplier = ComplexNumber(realComponent: 0, imaginaryComponent: 1)
        let expectedProduct = ComplexNumber(realComponent: -1, imaginaryComponent: 0)
        let actualProduct = multiplicand.multiply(complexNumber: multiplier)
        XCTAssertEqual([expectedProduct.realComponent, expectedProduct.imaginaryComponent], [actualProduct.realComponent, actualProduct.imaginaryComponent])
    }

    func testAddPurelyRealNumbers() {

        let addend = ComplexNumber(realComponent: 1, imaginaryComponent: 0)
        let augend = ComplexNumber(realComponent: 2, imaginaryComponent: 0)
        let expectedSum = ComplexNumber(realComponent: 3, imaginaryComponent: 0)
        let actualSum = ComplexNumber(realComponent: addend.add(complexNumber: augend).realComponent, imaginaryComponent: addend.add(complexNumber: augend).imaginaryComponent)
        XCTAssertEqual([expectedSum.realComponent, expectedSum.imaginaryComponent], [actualSum.realComponent, actualSum.imaginaryComponent])
    }

    func testAddPurelyImaginaryNumbers() {

        let addend = ComplexNumber(realComponent: 0, imaginaryComponent: 1)
        let augend = ComplexNumber(realComponent: 0, imaginaryComponent: 2)
        let expectedSum = ComplexNumber(realComponent: 0, imaginaryComponent: 3)
        let actualSum = addend.add(complexNumber: augend)

        XCTAssertEqual([expectedSum.realComponent, expectedSum.imaginaryComponent], [actualSum.realComponent, actualSum.imaginaryComponent])
    }

    func testAddNumbersWithRealAndImaginaryParts() {

        let addend = ComplexNumber(realComponent: 1, imaginaryComponent: 2)
        let augend = ComplexNumber(realComponent: 3, imaginaryComponent: 4)
        let expectedSum = ComplexNumber(realComponent: 4, imaginaryComponent: 6)
        let actualSum = addend.add(complexNumber: augend)

        XCTAssertEqual([expectedSum.realComponent, expectedSum.imaginaryComponent], [actualSum.realComponent, actualSum.imaginaryComponent])
    }

    func testSubtractPurelyRealNumbers() {

        let subtrahend = ComplexNumber(realComponent: 1, imaginaryComponent: 0)
        let minuend = ComplexNumber(realComponent: 2, imaginaryComponent: 0)
        let expectedDifference = ComplexNumber(realComponent: -1, imaginaryComponent: 0)
        let actualDifference = subtrahend.subtract(complexNumber: minuend)

        XCTAssertEqual([expectedDifference.realComponent, expectedDifference.imaginaryComponent], [actualDifference.realComponent, actualDifference.imaginaryComponent])
    }

    func testSubtractPurelyImaginaryNumbers() {

        let subtrahend = ComplexNumber(realComponent: 0, imaginaryComponent: 1)
        let minuend = ComplexNumber(realComponent: 0, imaginaryComponent: 2)
        let expectedDifference = ComplexNumber(realComponent: 0, imaginaryComponent: -1)
        let actualDifference = subtrahend.subtract(complexNumber: minuend)

        XCTAssertEqual([expectedDifference.realComponent, expectedDifference.imaginaryComponent], [actualDifference.realComponent, actualDifference.imaginaryComponent])
    }

    func testSubtractNumbersWithRealAndImaginaryParts() {

        let subtrahend = ComplexNumber(realComponent: 1, imaginaryComponent: 2)
        let minuend = ComplexNumber(realComponent: 3, imaginaryComponent: 4)
        let expectedDifference = ComplexNumber(realComponent: -2, imaginaryComponent: -2)
        let actualDifference = subtrahend.subtract(complexNumber: minuend)

        XCTAssertEqual([expectedDifference.realComponent, expectedDifference.imaginaryComponent], [actualDifference.realComponent, actualDifference.imaginaryComponent])

    }

    func testMultiplicationOfPurelyRealNumbers() {

        let multiplicand = ComplexNumber(realComponent: 1, imaginaryComponent: 0)
        let multiplier = ComplexNumber(realComponent: 2, imaginaryComponent: 0)
        let expectedProduct = ComplexNumber(realComponent: 2, imaginaryComponent: 0)
        let actualProduct = multiplicand.multiply(complexNumber: multiplier)

        XCTAssertEqual([expectedProduct.realComponent, expectedProduct.imaginaryComponent], [actualProduct.realComponent, actualProduct.imaginaryComponent])

    }

    func testMultiplicationOfPurelyImaginaryNumbers() {

        let multiplicand = ComplexNumber(realComponent: 0, imaginaryComponent: 1)
        let multiplier = ComplexNumber(realComponent: 0, imaginaryComponent: 2)
        let expectedProduct = ComplexNumber(realComponent: -2, imaginaryComponent: 0)
        let actualProduct = multiplicand.multiply(complexNumber: multiplier)

        XCTAssertEqual([expectedProduct.realComponent, expectedProduct.imaginaryComponent], [actualProduct.realComponent, actualProduct.imaginaryComponent])
    }

    func testMultiplyNumbersWithRealAndImaginaryParts() {

        let multiplicand = ComplexNumber(realComponent: 1, imaginaryComponent: 2)
        let multiplier = ComplexNumber(realComponent: 3, imaginaryComponent: 4)
        let expectedProduct = ComplexNumber(realComponent: -5, imaginaryComponent: 10)
        let actualProduct = multiplicand.multiply(complexNumber: multiplier)

        XCTAssertEqual([expectedProduct.realComponent, expectedProduct.imaginaryComponent], [actualProduct.realComponent, actualProduct.imaginaryComponent])
    }

    func testDividePurelyRealNumbers() {

        let dividend = ComplexNumber(realComponent: 1, imaginaryComponent: 0)
        let divisor = ComplexNumber(realComponent: 2, imaginaryComponent: 0)
        let expectedQuotient = ComplexNumber(realComponent: 0.5, imaginaryComponent: 0)
        let actualQuotient = dividend.divide(complexNumber: divisor)

        XCTAssertEqual([expectedQuotient.realComponent, expectedQuotient.imaginaryComponent], [actualQuotient.realComponent, actualQuotient.imaginaryComponent])
    }

    func testDividePurelyImaginaryNumbers() {

        let dividend = ComplexNumber(realComponent: 0, imaginaryComponent: 1)
        let divisor = ComplexNumber(realComponent: 0, imaginaryComponent: 2)
        let expectedQuotient = ComplexNumber(realComponent: 0.5, imaginaryComponent: 0)
        let actualQuotient = dividend.divide(complexNumber: divisor)

        XCTAssertEqual([expectedQuotient.realComponent, expectedQuotient.imaginaryComponent], [actualQuotient.realComponent, actualQuotient.imaginaryComponent])
    }

    func testDividingNumbersWithRealAndImaginaryParts() {

        let dividend = ComplexNumber(realComponent: 1, imaginaryComponent: 2)
        let divisor = ComplexNumber(realComponent: 3, imaginaryComponent: 4)
        let expectedQuotient = ComplexNumber(realComponent: 0.44, imaginaryComponent: 0.08)
        let actualQuotient = dividend.divide(complexNumber: divisor)

        XCTAssertEqual([expectedQuotient.realComponent, expectedQuotient.imaginaryComponent], [actualQuotient.realComponent, actualQuotient.imaginaryComponent])
    }

    func testAbsoluteValueOfPositivePurelyRealNumber() {

        let input = ComplexNumber(realComponent: 5, imaginaryComponent: 0)
        let expectedResult = Double(5)
        XCTAssertEqual(expectedResult, input.absolute())
    }

    func testAbsoluteValueOfNegativePurelyRealNumber() {

        let input = ComplexNumber(realComponent: -5, imaginaryComponent: 0)
        let expectedResult = Double(5)
        XCTAssertEqual(expectedResult, input.absolute())
    }

    func testAbsoluteValueOfPositivePurelyImaginaryNumber() {

        let input = ComplexNumber(realComponent: 0, imaginaryComponent: 5)
        let expectedResult = Double(5)
        XCTAssertEqual(expectedResult, input.absolute())
    }

    func testAbsoluteValueOfNegativePurelyImaginaryNumber() {

        let input = ComplexNumber(realComponent: 0, imaginaryComponent: -5)
        let expectedResult = Double(5)
        XCTAssertEqual(expectedResult, input.absolute())
    }

    func testAbsoluteValueOfNumberWithRealAndImaginaryParts() {

        let input = ComplexNumber(realComponent: 3, imaginaryComponent: 4)
        let expectedResult = Double(5)
        XCTAssertEqual(expectedResult, input.absolute())
    }

    func testConjugateOfAPurelyRealNumber() {

        let input = ComplexNumber(realComponent: 5, imaginaryComponent: 0)
        let expectedResult = ComplexNumber(realComponent: 5, imaginaryComponent: 0)
        let actualResult = input.conjugate()
    XCTAssertEqual([expectedResult.realComponent, expectedResult.imaginaryComponent], [actualResult.realComponent, actualResult.imaginaryComponent])
    }

    func testConjugateOfAPurelyImaginaryNumber() {

        let input = ComplexNumber(realComponent: 0, imaginaryComponent: 5)
        let expectedResult = ComplexNumber(realComponent: 0, imaginaryComponent: -5)
        let actualResult = input.conjugate()
        XCTAssertEqual([expectedResult.realComponent, expectedResult.imaginaryComponent], [actualResult.realComponent, actualResult.imaginaryComponent])
    }

    func testConjugateOfANumberWithRealAndImaginaryParts() {

        let input = ComplexNumber(realComponent: 1, imaginaryComponent: 1)
        let expectedResult = ComplexNumber(realComponent: 1, imaginaryComponent: -1)
        let actualResult = input.conjugate()
        XCTAssertEqual([expectedResult.realComponent, expectedResult.imaginaryComponent], [actualResult.realComponent, actualResult.imaginaryComponent])
    }

    func testEulersIdentityForComplexNumbers() {

        let input = ComplexNumber(realComponent: 0, imaginaryComponent: Double(String(format: "%.3f", Double.pi))!)
        let expectedResult = ComplexNumber(realComponent: -1, imaginaryComponent: 0)
        let actualResult = input.exponent()
    XCTAssertEqual([expectedResult.realComponent, expectedResult.imaginaryComponent], [Double(String(format: "%.3f", actualResult.realComponent))!, Double(String(format: "%.3f", actualResult.imaginaryComponent))!])

    }

    func testExponentOfZero() {

        let input = ComplexNumber(realComponent: 0, imaginaryComponent: 0)
        let expectedResult = ComplexNumber(realComponent: 1, imaginaryComponent: 0)
        let actualResult = input.exponent()
    XCTAssertEqual([expectedResult.realComponent, expectedResult.imaginaryComponent], [actualResult.realComponent, actualResult.imaginaryComponent])
    }

    func testExponentOfPurelyRealNumber() {

        let input = ComplexNumber(realComponent: 1, imaginaryComponent: 0)
        let expectedResult = ComplexNumber(realComponent: exp(1), imaginaryComponent: 0)
        let actualResult = input.exponent()
    XCTAssertEqual([expectedResult.realComponent, expectedResult.imaginaryComponent], [actualResult.realComponent, actualResult.imaginaryComponent])
    }

    func testExponentOfNumberWithRealAndImaginaryPart() {

        let input = ComplexNumber(realComponent: log(2), imaginaryComponent: Double(String(format: "%.3f", Double.pi))!)
        let expectedResult = ComplexNumber(realComponent: -2, imaginaryComponent: 0)
        let actualResult = input.exponent()

        XCTAssertEqual([expectedResult.realComponent, expectedResult.imaginaryComponent], [round(actualResult.realComponent), Double(String(format: "%.1f", actualResult.imaginaryComponent))!])
    }

    static var allTests: [(String, (ComplexNumbersTests) -> () throws -> Void)] {
        return [
            ("testRealPartOfPurelyRealNumber", testRealPartOfPurelyRealNumber),
            ("testRealPartOfPurelyImaginaryNumber", testRealPartOfPurelyImaginaryNumber),
            ("testRealPartOfNumberWithRealAndImaginary", testRealPartOfNumberWithRealAndImaginary),
            ("testImaginaryPartOfPurelyRealNumber", testImaginaryPartOfPurelyRealNumber),
            ("testImaginaryPartOfPurelyImaginaryNumber", testImaginaryPartOfPurelyImaginaryNumber),
            ("testImaginaryPartOfNumberWithRealAndImaginary", testImaginaryPartOfNumberWithRealAndImaginary),
            ("testImaginaryUnit", testImaginaryUnit),
            ("testAddPurelyRealNumbers", testAddPurelyRealNumbers),
            ("testAddPurelyImaginaryNumbers", testAddPurelyImaginaryNumbers),
            ("testAddNumbersWithRealAndImaginaryParts", testAddNumbersWithRealAndImaginaryParts),
            ("testSubtractPurelyRealNumbers", testSubtractPurelyRealNumbers),
            ("testSubtractPurelyImaginaryNumbers", testSubtractPurelyImaginaryNumbers),
            ("testSubtractNumbersWithRealAndImaginaryParts", testSubtractNumbersWithRealAndImaginaryParts),
            ("testMultiplicationOfPurelyRealNumbers", testMultiplicationOfPurelyRealNumbers),
            ("testMultiplicationOfPurelyImaginaryNumbers", testMultiplicationOfPurelyImaginaryNumbers),
            ("testMultiplyNumbersWithRealAndImaginaryParts", testMultiplyNumbersWithRealAndImaginaryParts),
            ("testDividePurelyRealNumbers", testDividePurelyRealNumbers),
            ("testDividePurelyImaginaryNumbers", testDividePurelyImaginaryNumbers),
            ("testDividingNumbersWithRealAndImaginaryParts", testDividingNumbersWithRealAndImaginaryParts),
            ("testAbsoluteValueOfPositivePurelyRealNumber", testAbsoluteValueOfPositivePurelyRealNumber),
            ("testAbsoluteValueOfNegativePurelyRealNumber", testAbsoluteValueOfNegativePurelyRealNumber),
            ("testAbsoluteValueOfPositivePurelyImaginaryNumber", testAbsoluteValueOfPositivePurelyImaginaryNumber),
            ("testAbsoluteValueOfNegativePurelyImaginaryNumber", testAbsoluteValueOfNegativePurelyImaginaryNumber),
            ("testAbsoluteValueOfNumberWithRealAndImaginaryParts", testAbsoluteValueOfNumberWithRealAndImaginaryParts),
            ("testConjugateOfAPurelyRealNumber", testConjugateOfAPurelyRealNumber),
            ("testConjugateOfAPurelyImaginaryNumber", testConjugateOfAPurelyImaginaryNumber),

            ("testConjugateOfANumberWithRealAndImaginaryParts", testConjugateOfANumberWithRealAndImaginaryParts),

            ("testEulersIdentityForComplexNumbers", testEulersIdentityForComplexNumbers),

                ("testExponentOfZero", testExponentOfZero),
            ("testExponentOfPurelyRealNumber", testExponentOfPurelyRealNumber),

            ("testExponentOfNumberWithRealAndImaginaryPart", testExponentOfNumberWithRealAndImaginaryPart)
        ]
    }

}
