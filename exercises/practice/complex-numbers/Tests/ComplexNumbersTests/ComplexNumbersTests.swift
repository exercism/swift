import Foundation
import Testing

@testable import ComplexNumbers

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ComplexNumbersTests {

  @Test("Real part of a purely real number")
  func testRealPartOfAPurelyRealNumber() {
    let complexNumber = ComplexNumbers(realComponent: 1, imaginaryComponent: 0)
    #expect(complexNumber.real == 1)
  }

  @Test("Real part of a purely imaginary number", .enabled(if: RUNALL))
  func testRealPartOfAPurelyImaginaryNumber() {
    let complexNumber = ComplexNumbers(realComponent: 0, imaginaryComponent: 1)
    #expect(complexNumber.real == 0)
  }

  @Test("Real part of a number with real and imaginary part", .enabled(if: RUNALL))
  func testRealPartOfANumberWithRealAndImaginaryPart() {
    let complexNumber = ComplexNumbers(realComponent: 1, imaginaryComponent: 2)
    #expect(complexNumber.real == 1)
  }

  @Test("Imaginary part of a purely real number", .enabled(if: RUNALL))
  func testImaginaryPartOfAPurelyRealNumber() {
    let complexNumber = ComplexNumbers(realComponent: 1, imaginaryComponent: 0)
    #expect(complexNumber.imaginary == 0)
  }

  @Test("Imaginary part of a purely imaginary number", .enabled(if: RUNALL))
  func testImaginaryPartOfAPurelyImaginaryNumber() {
    let complexNumber = ComplexNumbers(realComponent: 0, imaginaryComponent: 1)
    #expect(complexNumber.imaginary == 1)
  }

  @Test("Imaginary part of a number with real and imaginary part", .enabled(if: RUNALL))
  func testImaginaryPartOfANumberWithRealAndImaginaryPart() {
    let complexNumber = ComplexNumbers(realComponent: 1, imaginaryComponent: 2)
    #expect(complexNumber.imaginary == 2)
  }

  @Test("Imaginary unit", .enabled(if: RUNALL))
  func testImaginaryUnit() {
    let complexNumberOne = ComplexNumbers(realComponent: 0, imaginaryComponent: 1)
    let complexNumberTwo = ComplexNumbers(realComponent: 0, imaginaryComponent: 1)
    let result = complexNumberOne.mul(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: -1, imaginaryComponent: 0)
    #expect(expected == result)
  }

  @Test("Add purely real numbers", .enabled(if: RUNALL))
  func testAddPurelyRealNumbers() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 0)
    let complexNumberTwo = ComplexNumbers(realComponent: 2, imaginaryComponent: 0)
    let result = complexNumberOne.add(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 3, imaginaryComponent: 0)
    #expect(expected == result)
  }
  @Test("Add purely imaginary numbers", .enabled(if: RUNALL))
  func testAddPurelyImaginaryNumbers() {
    let complexNumberOne = ComplexNumbers(realComponent: 0, imaginaryComponent: 1)
    let complexNumberTwo = ComplexNumbers(realComponent: 0, imaginaryComponent: 2)
    let result = complexNumberOne.add(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 0, imaginaryComponent: 3)
    #expect(expected == result)
  }
  @Test("Add numbers with real and imaginary part", .enabled(if: RUNALL))
  func testAddNumbersWithRealAndImaginaryPart() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 2)
    let complexNumberTwo = ComplexNumbers(realComponent: 3, imaginaryComponent: 4)
    let result = complexNumberOne.add(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 4, imaginaryComponent: 6)
    #expect(expected == result)
  }

  @Test("Subtract purely real numbers", .enabled(if: RUNALL))
  func testSubtractPurelyRealNumbers() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 0)
    let complexNumberTwo = ComplexNumbers(realComponent: 2, imaginaryComponent: 0)
    let result = complexNumberOne.sub(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: -1, imaginaryComponent: 0)
    #expect(expected == result)
  }
  @Test("Subtract purely imaginary numbers", .enabled(if: RUNALL))
  func testSubtractPurelyImaginaryNumbers() {
    let complexNumberOne = ComplexNumbers(realComponent: 0, imaginaryComponent: 1)
    let complexNumberTwo = ComplexNumbers(realComponent: 0, imaginaryComponent: 2)
    let result = complexNumberOne.sub(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 0, imaginaryComponent: -1)
    #expect(expected == result)
  }
  @Test("Subtract numbers with real and imaginary part", .enabled(if: RUNALL))
  func testSubtractNumbersWithRealAndImaginaryPart() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 2)
    let complexNumberTwo = ComplexNumbers(realComponent: 3, imaginaryComponent: 4)
    let result = complexNumberOne.sub(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: -2, imaginaryComponent: -2)
    #expect(expected == result)
  }

  @Test("Multiply purely real numbers", .enabled(if: RUNALL))
  func testMultiplyPurelyRealNumbers() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 0)
    let complexNumberTwo = ComplexNumbers(realComponent: 2, imaginaryComponent: 0)
    let result = complexNumberOne.mul(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 2, imaginaryComponent: 0)
    #expect(expected == result)
  }
  @Test("Multiply purely imaginary numbers", .enabled(if: RUNALL))
  func testMultiplyPurelyImaginaryNumbers() {
    let complexNumberOne = ComplexNumbers(realComponent: 0, imaginaryComponent: 1)
    let complexNumberTwo = ComplexNumbers(realComponent: 0, imaginaryComponent: 2)
    let result = complexNumberOne.mul(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: -2, imaginaryComponent: 0)
    #expect(expected == result)
  }
  @Test("Multiply numbers with real and imaginary part", .enabled(if: RUNALL))
  func testMultiplyNumbersWithRealAndImaginaryPart() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 2)
    let complexNumberTwo = ComplexNumbers(realComponent: 3, imaginaryComponent: 4)
    let result = complexNumberOne.mul(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: -5, imaginaryComponent: 10)
    #expect(expected == result)
  }

  @Test("Divide purely real numbers", .enabled(if: RUNALL))
  func testDividePurelyRealNumbers() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 0)
    let complexNumberTwo = ComplexNumbers(realComponent: 2, imaginaryComponent: 0)
    let result = complexNumberOne.div(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 0.5, imaginaryComponent: 0)
    #expect(expected == result)
  }
  @Test("Divide purely imaginary numbers", .enabled(if: RUNALL))
  func testDividePurelyImaginaryNumbers() {
    let complexNumberOne = ComplexNumbers(realComponent: 0, imaginaryComponent: 1)
    let complexNumberTwo = ComplexNumbers(realComponent: 0, imaginaryComponent: 2)
    let result = complexNumberOne.div(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 0.5, imaginaryComponent: 0)
    #expect(expected == result)
  }
  @Test("Divide numbers with real and imaginary part", .enabled(if: RUNALL))
  func testDivideNumbersWithRealAndImaginaryPart() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 2)
    let complexNumberTwo = ComplexNumbers(realComponent: 3, imaginaryComponent: 4)
    let result = complexNumberOne.div(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 0.44, imaginaryComponent: 0.08)
    #expect(expected == result)
  }

  @Test("Absolute value of a positive purely real number", .enabled(if: RUNALL))
  func testAbsoluteValueOfAPositivePurelyRealNumber() {
    let complexNumber = ComplexNumbers(realComponent: 5, imaginaryComponent: 0)
    #expect(complexNumber.absolute() == 5)
  }

  @Test("Absolute value of a negative purely real number", .enabled(if: RUNALL))
  func testAbsoluteValueOfANegativePurelyRealNumber() {
    let complexNumber = ComplexNumbers(realComponent: -5, imaginaryComponent: 0)
    #expect(complexNumber.absolute() == 5)
  }

  @Test(
    "Absolute value of a purely imaginary number with positive imaginary part", .enabled(if: RUNALL)
  )
  func testAbsoluteValueOfAPurelyImaginaryNumberWithPositiveImaginaryPart() {
    let complexNumber = ComplexNumbers(realComponent: 0, imaginaryComponent: 5)
    #expect(complexNumber.absolute() == 5)
  }

  @Test(
    "Absolute value of a purely imaginary number with negative imaginary part", .enabled(if: RUNALL)
  )
  func testAbsoluteValueOfAPurelyImaginaryNumberWithNegativeImaginaryPart() {
    let complexNumber = ComplexNumbers(realComponent: 0, imaginaryComponent: -5)
    #expect(complexNumber.absolute() == 5)
  }

  @Test("Absolute value of a number with real and imaginary part", .enabled(if: RUNALL))
  func testAbsoluteValueOfANumberWithRealAndImaginaryPart() {
    let complexNumber = ComplexNumbers(realComponent: 3, imaginaryComponent: 4)
    #expect(complexNumber.absolute() == 5)
  }

  @Test("Conjugate a purely real number", .enabled(if: RUNALL))
  func testConjugateAPurelyRealNumber() {
    let complexNumber = ComplexNumbers(realComponent: 5, imaginaryComponent: 0)
    let expected = ComplexNumbers(realComponent: 5, imaginaryComponent: 0)
    #expect(complexNumber.conjugate() == expected)
  }

  @Test("Conjugate a purely imaginary number", .enabled(if: RUNALL))
  func testConjugateAPurelyImaginaryNumber() {
    let complexNumber = ComplexNumbers(realComponent: 0, imaginaryComponent: 5)
    let expected = ComplexNumbers(realComponent: 0, imaginaryComponent: -5)
    #expect(complexNumber.conjugate() == expected)
  }

  @Test("Conjugate a number with real and imaginary part", .enabled(if: RUNALL))
  func testConjugateANumberWithRealAndImaginaryPart() {
    let complexNumber = ComplexNumbers(realComponent: 1, imaginaryComponent: 1)
    let expected = ComplexNumbers(realComponent: 1, imaginaryComponent: -1)
    #expect(complexNumber.conjugate() == expected)
  }

  @Test("Euler's identity/formula", .enabled(if: RUNALL))
  func testEulersIdentityformula() {
    let complexNumber = ComplexNumbers(realComponent: 0, imaginaryComponent: Double.pi)
    let expected = ComplexNumbers(realComponent: -1, imaginaryComponent: 0)
    #expect(complexNumber.exponent() == expected)
  }

  @Test("Exponential of 0", .enabled(if: RUNALL))
  func testExponentialOf0() {
    let complexNumber = ComplexNumbers(realComponent: 0, imaginaryComponent: 0)
    let expected = ComplexNumbers(realComponent: 1, imaginaryComponent: 0)
    #expect(complexNumber.exponent() == expected)
  }

  @Test("Exponential of a purely real number", .enabled(if: RUNALL))
  func testExponentialOfAPurelyRealNumber() {
    let complexNumber = ComplexNumbers(realComponent: 1, imaginaryComponent: 0)
    let expected = ComplexNumbers(realComponent: exp(1), imaginaryComponent: 0)
    #expect(complexNumber.exponent() == expected)
  }

  @Test("Exponential of a number with real and imaginary part", .enabled(if: RUNALL))
  func testExponentialOfANumberWithRealAndImaginaryPart() {
    let complexNumber = ComplexNumbers(realComponent: log(2), imaginaryComponent: Double.pi)
    let expected = ComplexNumbers(realComponent: -2, imaginaryComponent: 0)
    #expect(complexNumber.exponent() == expected)
  }

  @Test("Exponential resulting in a number with real and imaginary part", .enabled(if: RUNALL))
  func testExponentialResultingInANumberWithRealAndImaginaryPart() {
    let complexNumber = ComplexNumbers(realComponent: log(2) / 2, imaginaryComponent: Double.pi / 4)
    let expected = ComplexNumbers(realComponent: 1, imaginaryComponent: 1)
    #expect(complexNumber.exponent() == expected)
  }

  @Test("Add real number to complex number", .enabled(if: RUNALL))
  func testAddRealNumberToComplexNumber() {
    let complexNumberOne = ComplexNumbers(realComponent: 1, imaginaryComponent: 2)
    let complexNumberTwo = ComplexNumbers(realComponent: 5, imaginaryComponent: nil)
    let result = complexNumberOne.add(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 6, imaginaryComponent: 2)
    #expect(expected == result)
  }

  @Test("Add complex number to real number", .enabled(if: RUNALL))
  func testAddComplexNumberToRealNumber() {
    let complexNumberOne = ComplexNumbers(realComponent: 5, imaginaryComponent: nil)
    let complexNumberTwo = ComplexNumbers(realComponent: 1, imaginaryComponent: 2)
    let result = complexNumberOne.add(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 6, imaginaryComponent: 2)
    #expect(expected == result)
  }

  @Test("Subtract real number from complex number", .enabled(if: RUNALL))
  func testSubtractRealNumberFromComplexNumber() {
    let complexNumberOne = ComplexNumbers(realComponent: 5, imaginaryComponent: 7)
    let complexNumberTwo = ComplexNumbers(realComponent: 4, imaginaryComponent: nil)
    let result = complexNumberOne.sub(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 1, imaginaryComponent: 7)
    #expect(expected == result)
  }

  @Test("Subtract complex number from real number", .enabled(if: RUNALL))
  func testSubtractComplexNumberFromRealNumber() {
    let complexNumberOne = ComplexNumbers(realComponent: 4, imaginaryComponent: nil)
    let complexNumberTwo = ComplexNumbers(realComponent: 5, imaginaryComponent: 7)
    let result = complexNumberOne.sub(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: -1, imaginaryComponent: -7)
    #expect(expected == result)
  }

  @Test("Multiply complex number by real number", .enabled(if: RUNALL))
  func testMultiplyComplexNumberByRealNumber() {
    let complexNumberOne = ComplexNumbers(realComponent: 2, imaginaryComponent: 5)
    let complexNumberTwo = ComplexNumbers(realComponent: 5, imaginaryComponent: nil)
    let result = complexNumberOne.mul(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 10, imaginaryComponent: 25)
    #expect(expected == result)
  }

  @Test("Multiply real number by complex number", .enabled(if: RUNALL))
  func testMultiplyRealNumberByComplexNumber() {
    let complexNumberOne = ComplexNumbers(realComponent: 5, imaginaryComponent: nil)
    let complexNumberTwo = ComplexNumbers(realComponent: 2, imaginaryComponent: 5)
    let result = complexNumberOne.mul(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 10, imaginaryComponent: 25)
    #expect(expected == result)
  }

  @Test("Divide complex number by real number", .enabled(if: RUNALL))
  func testDivideComplexNumberByRealNumber() {
    let complexNumberOne = ComplexNumbers(realComponent: 10, imaginaryComponent: 100)
    let complexNumberTwo = ComplexNumbers(realComponent: 10, imaginaryComponent: nil)
    let result = complexNumberOne.div(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 1, imaginaryComponent: 10)
    #expect(expected == result)
  }

  @Test("Divide real number by complex number", .enabled(if: RUNALL))
  func testDivideRealNumberByComplexNumber() {
    let complexNumberOne = ComplexNumbers(realComponent: 5, imaginaryComponent: nil)
    let complexNumberTwo = ComplexNumbers(realComponent: 1, imaginaryComponent: 1)
    let result = complexNumberOne.div(complexNumber: complexNumberTwo)
    let expected = ComplexNumbers(realComponent: 2.5, imaginaryComponent: -2.5)
    #expect(expected == result)
  }

}
