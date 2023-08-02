import XCTest

@testable import LargestSeriesProduct

class LargestSeriesProductTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testFindsTheLargestProductIfSpanEqualsLength() {
    XCTAssertEqual(try! NumberSeries("29").largestProduct(2), 18)
  }

  func testCanFindTheLargestProductOf2WithNumbersInOrder() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! NumberSeries("0123456789").largestProduct(2), 72)
  }

  func testCanFindTheLargestProductOf2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! NumberSeries("576802143").largestProduct(2), 48)
  }

  func testCanFindTheLargestProductOf3WithNumbersInOrder() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! NumberSeries("0123456789").largestProduct(3), 504)
  }

  func testCanFindTheLargestProductOf3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! NumberSeries("1027839564").largestProduct(3), 270)
  }

  func testCanFindTheLargestProductOf5WithNumbersInOrder() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! NumberSeries("0123456789").largestProduct(5), 15120)
  }

  func testCanGetTheLargestProductOfABigNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! NumberSeries("73167176531330624919225119674426574742355349194934").largestProduct(6),
      23520)
  }

  func testReportsZeroIfTheOnlyDigitsAreZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! NumberSeries("0000").largestProduct(2), 0)
  }

  func testReportsZeroIfAllSpansIncludeZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! NumberSeries("99099").largestProduct(3), 0)
  }

  func testRejectsSpanLongerThanStringLength() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try NumberSeries("123").largestProduct(4)) { error in
      XCTAssertEqual(error as? NumberSeriesError, NumberSeriesError.spanLongerThanInput)
    }
  }

  func testRejectsEmptyStringAndNonzeroSpan() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try NumberSeries("").largestProduct(1)) { error in
      XCTAssertEqual(error as? NumberSeriesError, NumberSeriesError.spanLongerThanInput)
    }
  }

  func testRejectsInvalidCharacterInDigits() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try NumberSeries("1234a5").largestProduct(2)) { error in
      XCTAssertEqual(error as? NumberSeriesError, NumberSeriesError.invalidCharacter)
    }
  }

  func testRejectsNegativeSpan() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try NumberSeries("12345").largestProduct(-1)) { error in
      XCTAssertEqual(error as? NumberSeriesError, NumberSeriesError.spanIsZeroOrNegative)
    }
  }
}
