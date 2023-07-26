import XCTest

@testable import AllYourBase

class AllYourBaseTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testSingleBitOneToDecimal() {
    XCTAssertEqual(try! Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: 10), [1])
  }

  func testBinaryToSingleDecimal() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1], outputBase: 10), [5])
  }

  func testSingleDecimalToBinary() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 10, inputDigits: [5], outputBase: 2), [1, 0, 1])
  }

  func testBinaryToMultipleDecimal() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 10), [4, 2])
  }

  func testDecimalToBinary() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 10, inputDigits: [4, 2], outputBase: 2), [1, 0, 1, 0, 1, 0])
  }

  func testTrinaryToHexadecimal() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 3, inputDigits: [1, 1, 2, 0], outputBase: 16), [2, 10])
  }

  func testHexadecimalToTrinary() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 16, inputDigits: [2, 10], outputBase: 3), [1, 1, 2, 0])
  }

  func test15BitInteger() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 97, inputDigits: [3, 46, 60], outputBase: 73), [6, 10, 45])
  }

  func testEmptyList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Base.outputDigits(inputBase: 2, inputDigits: [], outputBase: 10), [0])
  }

  func testSingleZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Base.outputDigits(inputBase: 10, inputDigits: [0], outputBase: 2), [0])
  }

  func testMultipleZeros() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 10, inputDigits: [0, 0, 0], outputBase: 2), [0])
  }

  func testLeadingZeros() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 7, inputDigits: [0, 6, 0], outputBase: 10), [4, 2])
  }

  func testInputBaseIsOne() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Base.outputDigits(inputBase: 1, inputDigits: [0], outputBase: 10)) {
      error in
      XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
    }
  }

  func testInputBaseIsZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Base.outputDigits(inputBase: 0, inputDigits: [], outputBase: 10)) {
      error in
      XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
    }
  }

  func testInputBaseIsNegative() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Base.outputDigits(inputBase: -2, inputDigits: [1], outputBase: 10)) {
      error in
      XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
    }
  }

  func testNegativeDigit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try Base.outputDigits(inputBase: 2, inputDigits: [1, -1, 1, 0, 1, 0], outputBase: 10)
    ) { error in
      XCTAssertEqual(error as? BaseError, BaseError.negativeDigit)
    }
  }

  func testInvalidPositiveDigit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try Base.outputDigits(inputBase: 2, inputDigits: [1, 2, 1, 0, 1, 0], outputBase: 10)
    ) { error in
      XCTAssertEqual(error as? BaseError, BaseError.invalidPositiveDigit)
    }
  }

  func testOutputBaseIsOne() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 1)
    ) { error in
      XCTAssertEqual(error as? BaseError, BaseError.invalidOutputBase)
    }
  }

  func testOutputBaseIsZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Base.outputDigits(inputBase: 10, inputDigits: [7], outputBase: 0)) {
      error in
      XCTAssertEqual(error as? BaseError, BaseError.invalidOutputBase)
    }
  }

  func testOutputBaseIsNegative() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: -7)) {
      error in
      XCTAssertEqual(error as? BaseError, BaseError.invalidOutputBase)
    }
  }

  func testBothBasesAreNegative() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Base.outputDigits(inputBase: -2, inputDigits: [1], outputBase: -7)) {
      error in
      XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
    }
  }
}
