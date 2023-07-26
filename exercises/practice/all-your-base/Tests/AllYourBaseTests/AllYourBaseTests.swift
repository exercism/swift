import XCTest

@testable import AllYourBase

class AllYourBaseTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testSingleBitOneToDecimal() {
    XCTAssertEqual(try! Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: 10, [1]))
  }

  func testBinaryToSingleDecimal() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1], outputBase: 10, [5]))
  }

  func testSingleDecimalToBinary() {
    try XCTSkipIf(true && !runAll) // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 10, inputDigits: [5], outputBase: 2, [1, 0, 1]))
  }

  func testBinaryToMultipleDecimal() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(
        inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 10, [4, 2]))
  }

  func testDecimalToBinary() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(
        inputBase: 10, inputDigits: [4, 2], outputBase: 2, [1, 0, 1, 0, 1, 0]))
  }

  func testTrinaryToHexadecimal() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 3, inputDigits: [1, 1, 2, 0], outputBase: 16, [2, 10]))
  }

  func testHexadecimalToTrinary() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 16, inputDigits: [2, 10], outputBase: 3, [1, 1, 2, 0]))
  }

  func test15BitInteger() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 97, inputDigits: [3, 46, 60], outputBase: 73, [6, 10, 45]))
  }

  func testEmptyList() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Base.outputDigits(inputBase: 2, inputDigits: [], outputBase: 10, [0]))
  }

  func testSingleZero() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Base.outputDigits(inputBase: 10, inputDigits: [0], outputBase: 2, [0]))
  }

  func testMultipleZeros() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 10, inputDigits: [0, 0, 0], outputBase: 2, [0]))
  }

  func testLeadingZeros() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! Base.outputDigits(inputBase: 7, inputDigits: [0, 6, 0], outputBase: 10, [4, 2]))
  }

  func testInputBaseIsOne() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: 1, inputDigits: [0], outputBase: 10) { error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }

  func testInputBaseIsZero() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: 0, inputDigits: [], outputBase: 10) { error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }

  func testInputBaseIsNegative() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: -2, inputDigits: [1], outputBase: 10) { error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }

  func testNegativeDigit() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: 2, inputDigits: [1, -1, 1, 0, 1, 0], outputBase: 10) {
        error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }

  func testInvalidPositiveDigit() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: 2, inputDigits: [1, 2, 1, 0, 1, 0], outputBase: 10) {
        error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }

  func testOutputBaseIsOne() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: 2, inputDigits: [1, 0, 1, 0, 1, 0], outputBase: 1) {
        error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }

  func testOutputBaseIsZero() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: 10, inputDigits: [7], outputBase: 0) { error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }

  func testOutputBaseIsNegative() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: 2, inputDigits: [1], outputBase: -7) { error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }

  func testBothBasesAreNegative() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(
      try! Base.outputDigits(inputBase: -2, inputDigits: [1], outputBase: -7) { error in
        XCTAssertEqual(error as? BaseError, BaseError.invalidInputBase)
      }
    )
  }
}
