import XCTest

@testable import Series

class SeriesTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testSlicesOfOneFromOne() {
    let series = Series("1")
    XCTAssertEqual(try! series.slice(1), ["1"])
  }

  func testSlicesOfOneFromTwo() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("12")
    XCTAssertEqual(try! series.slice(1), ["1", "2"])
  }

  func testSlicesOfTwo() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("35")
    XCTAssertEqual(try! series.slice(2), ["35"])
  }

  func testSlicesOfTwoOverlap() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("9142")
    XCTAssertEqual(try! series.slice(2), ["91", "14", "42"])
  }

  func testSlicesCanIncludeDuplicates() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("777777")
    XCTAssertEqual(try! series.slice(3), ["777", "777", "777", "777"])
  }

  func testSlicesOfALongSeries() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("918493904243")
    XCTAssertEqual(
      try! series.slice(5),
      ["91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243"])
  }

  func testSliceLengthIsTooLarge() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("12345")
    XCTAssertThrowsError(try series.slice(6)) { error in
      XCTAssertEqual(error as? SeriesError, SeriesError.sliceLengthLongerThanSeries)
    }
  }

  func testSliceLengthIsWayTooLarge() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("12345")
    XCTAssertThrowsError(try series.slice(42)) { error in
      XCTAssertEqual(error as? SeriesError, SeriesError.sliceLengthLongerThanSeries)
    }
  }

  func testSliceLengthCannotBeZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("12345")
    XCTAssertThrowsError(try series.slice(0)) { error in
      XCTAssertEqual(error as? SeriesError, SeriesError.sliceLengthZeroOrLess)
    }
  }

  func testSliceLengthCannotBeNegative() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("123")
    XCTAssertThrowsError(try series.slice(-1)) { error in
      XCTAssertEqual(error as? SeriesError, SeriesError.sliceLengthZeroOrLess)
    }
  }

  func testEmptySeriesIsInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let series = Series("")
    XCTAssertThrowsError(try series.slice(1)) { error in
      XCTAssertEqual(error as? SeriesError, SeriesError.emptySeries)
    }
  }
}
