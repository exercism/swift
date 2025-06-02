import Foundation
import Testing

@testable import Gigasecond

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct GigasecondTests {
  let dateFormatter = ISO8601DateFormatter()
  let dateTimeFormatter = ISO8601DateFormatter()

  init() {
    dateFormatter.formatOptions = [.withFullDate]
    dateTimeFormatter.formatOptions = [.withFullDate, .withFullTime]
  }

  @Test("date only specification of time")
  func testDateOnlySpecificationOfTime() {
    #expect(
      gigasecond(from: dateFormatter.date(from: "2011-04-25")!) == dateTimeFormatter.date(
        from: "2043-01-01T01:46:40Z")!)
  }

  @Test("second test for date only specification of time", .enabled(if: RUNALL))
  func testSecondTestForDateOnlySpecificationOfTime() {
    #expect(
      gigasecond(from: dateFormatter.date(from: "1977-06-13")!) == dateTimeFormatter.date(
        from: "2009-02-19T01:46:40Z")!)
  }

  @Test("third test for date only specification of time", .enabled(if: RUNALL))
  func testThirdTestForDateOnlySpecificationOfTime() {
    #expect(
      gigasecond(from: dateFormatter.date(from: "1959-07-19")!) == dateTimeFormatter.date(
        from: "1991-03-27T01:46:40Z")!)
  }

  @Test("full time specified", .enabled(if: RUNALL))
  func testFullTimeSpecified() {
    #expect(
      gigasecond(from: dateTimeFormatter.date(from: "2015-01-24T22:00:00Z")!)
        == dateTimeFormatter.date(from: "2046-10-02T23:46:40Z")!)
  }

  @Test("full time with day roll-over", .enabled(if: RUNALL))
  func testFullTimeWithDayRollOver() {
    #expect(
      gigasecond(from: dateTimeFormatter.date(from: "2015-01-24T23:59:59Z")!)
        == dateTimeFormatter.date(from: "2046-10-03T01:46:39Z")!)
  }

  @Test("does not mutate the input", .enabled(if: RUNALL))
  func testDoesNotMutateTheInput() {}
}
