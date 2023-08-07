import XCTest

@testable import Gigasecond

class GigasecondTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  let dateFormatter = ISO8601DateFormatter()
  let dateTimeFormatter = ISO8601DateFormatter()

  override func setUp() {
    dateFormatter.formatOptions = [.withFullDate]
    dateTimeFormatter.formatOptions = [.withFullDate, .withFullTime]
  }

  func testDateOnlySpecificationOfTime() {
    XCTAssertEqual(
      gigasecond(from: dateFormatter.date(from: "2011-04-25")!),
      dateTimeFormatter.date(from: "2043-01-01T01:46:40Z")!)
  }

  func testSecondTestForDateOnlySpecificationOfTime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      gigasecond(from: dateFormatter.date(from: "1977-06-13")!),
      dateTimeFormatter.date(from: "2009-02-19T01:46:40Z")!)
  }

  func testThirdTestForDateOnlySpecificationOfTime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      gigasecond(from: dateFormatter.date(from: "1959-07-19")!),
      dateTimeFormatter.date(from: "1991-03-27T01:46:40Z")!)
  }

  func testFullTimeSpecified() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      gigasecond(from: dateTimeFormatter.date(from: "2015-01-24T22:00:00Z")!),
      dateTimeFormatter.date(from: "2046-10-02T23:46:40Z")!)
  }

  func testFullTimeWithDayRollOver() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      gigasecond(from: dateTimeFormatter.date(from: "2015-01-24T23:59:59Z")!),
      dateTimeFormatter.date(from: "2046-10-03T01:46:39Z")!)
  }

  func testDoesNotMutateTheInput() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
  }
}
