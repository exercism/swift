import Foundation
import Testing

@testable import AllYourBase

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct AllYourBaseTests {

  @Test("single bit one to decimal")
  func testSingleBitOneToDecimal() {
    #expect(try! Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: 10) == [1])
  }

  @Test("binary to single decimal", .enabled(if: RUNALL))
  func testBinaryToSingleDecimal() {
    #expect(try! Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1], outputBase: 10) == [5])
  }

  @Test("single decimal to binary", .enabled(if: RUNALL))
  func testSingleDecimalToBinary() {
    #expect(try! Base.outputDigits(inputBase: 10, inputDigits: [5], outputBase: 2) == [1, 0, 1])
  }

  @Test("binary to multiple decimal", .enabled(if: RUNALL))
  func testBinaryToMultipleDecimal() {
    #expect(
      try! Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 10) == [
        4, 2,
      ])
  }

  @Test("decimal to binary", .enabled(if: RUNALL))
  func testDecimalToBinary() {
    #expect(
      try! Base.outputDigits(inputBase: 10, inputDigits: [4, 2], outputBase: 2) == [
        1, 0, 1, 0, 1, 0,
      ])
  }

  @Test("trinary to hexadecimal", .enabled(if: RUNALL))
  func testTrinaryToHexadecimal() {
    #expect(
      try! Base.outputDigits(inputBase: 3, inputDigits: [1, 1, 2, 0], outputBase: 16) == [2, 10])
  }

  @Test("hexadecimal to trinary", .enabled(if: RUNALL))
  func testHexadecimalToTrinary() {
    #expect(
      try! Base.outputDigits(inputBase: 16, inputDigits: [2, 10], outputBase: 3) == [1, 1, 2, 0])
  }

  @Test("15-bit integer", .enabled(if: RUNALL))
  func test15BitInteger() {
    #expect(
      try! Base.outputDigits(inputBase: 97, inputDigits: [3, 46, 60], outputBase: 73) == [
        6, 10, 45,
      ])
  }

  @Test("empty list", .enabled(if: RUNALL))
  func testEmptyList() {
    #expect(try! Base.outputDigits(inputBase: 2, inputDigits: [], outputBase: 10) == [0])
  }

  @Test("single zero", .enabled(if: RUNALL))
  func testSingleZero() {
    #expect(try! Base.outputDigits(inputBase: 10, inputDigits: [0], outputBase: 2) == [0])
  }

  @Test("multiple zeros", .enabled(if: RUNALL))
  func testMultipleZeros() {
    #expect(try! Base.outputDigits(inputBase: 10, inputDigits: [0, 0, 0], outputBase: 2) == [0])
  }

  @Test("leading zeros", .enabled(if: RUNALL))
  func testLeadingZeros() {
    #expect(
      try! Base.outputDigits(inputBase: 7, inputDigits: [0, 6, 0], outputBase: 10) == [4, 2])
  }

  @Test("input base is one", .enabled(if: RUNALL))
  func testInputBaseIsOne() {
    #expect(throws: BaseError.invalidInputBase) {
      try Base.outputDigits(inputBase: 1, inputDigits: [0], outputBase: 10)
    }
  }

  @Test("input base is zero", .enabled(if: RUNALL))
  func testInputBaseIsZero() {
    #expect(throws: BaseError.invalidInputBase) {
      try Base.outputDigits(inputBase: 0, inputDigits: [], outputBase: 10)
    }
  }

  @Test("input base is negative", .enabled(if: RUNALL))
  func testInputBaseIsNegative() {
    #expect(throws: BaseError.invalidInputBase) {
      try Base.outputDigits(inputBase: -2, inputDigits: [1], outputBase: 10)
    }
  }

  @Test("negative digit", .enabled(if: RUNALL))
  func testNegativeDigit() {
    #expect(throws: BaseError.negativeDigit) {
      try Base.outputDigits(inputBase: 2, inputDigits: [1, -1, 1, 0, 1, 0], outputBase: 10)
    }
  }

  @Test("invalid positive digit", .enabled(if: RUNALL))
  func testInvalidPositiveDigit() {
    #expect(throws: BaseError.invalidPositiveDigit) {
      try Base.outputDigits(inputBase: 2, inputDigits: [1, 2, 1, 0, 1, 0], outputBase: 10)
    }
  }

  @Test("output base is one", .enabled(if: RUNALL))
  func testOutputBaseIsOne() {
    #expect(throws: BaseError.invalidOutputBase) {
      try Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 1)
    }
  }

  @Test("output base is zero", .enabled(if: RUNALL))
  func testOutputBaseIsZero() {
    #expect(throws: BaseError.invalidOutputBase) {
      try Base.outputDigits(inputBase: 10, inputDigits: [7], outputBase: 0)
    }
  }

  @Test("output base is negative", .enabled(if: RUNALL))
  func testOutputBaseIsNegative() {
    #expect(throws: BaseError.invalidOutputBase) {
      try Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: -7)
    }
  }

  @Test("both bases are negative", .enabled(if: RUNALL))
  func testBothBasesAreNegative() {
    #expect(throws: BaseError.invalidInputBase) {
      try Base.outputDigits(inputBase: -2, inputDigits: [1], outputBase: -7)
    }
  }
}
