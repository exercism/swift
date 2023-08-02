import XCTest

@testable import Leap

class LeapTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testYearNotDivisibleBy4InCommonYear() {
    let year = Year(calendarYear: 2015)
    XCTAssertFalse(year.isLeapYear)
  }

  func testYearDivisibleBy2NotDivisibleBy4InCommonYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let year = Year(calendarYear: 1970)
    XCTAssertFalse(year.isLeapYear)
  }

  func testYearDivisibleBy4NotDivisibleBy100InLeapYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let year = Year(calendarYear: 1996)
    XCTAssertTrue(year.isLeapYear)
  }

  func testYearDivisibleBy4And5IsStillALeapYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let year = Year(calendarYear: 1960)
    XCTAssertTrue(year.isLeapYear)
  }

  func testYearDivisibleBy100NotDivisibleBy400InCommonYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let year = Year(calendarYear: 2100)
    XCTAssertFalse(year.isLeapYear)
  }

  func testYearDivisibleBy100ButNotBy3IsStillNotALeapYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let year = Year(calendarYear: 1900)
    XCTAssertFalse(year.isLeapYear)
  }

  func testYearDivisibleBy400IsLeapYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let year = Year(calendarYear: 2000)
    XCTAssertTrue(year.isLeapYear)
  }

  func testYearDivisibleBy400ButNotBy125IsStillALeapYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let year = Year(calendarYear: 2400)
    XCTAssertTrue(year.isLeapYear)
  }

  func testYearDivisibleBy200NotDivisibleBy400InCommonYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let year = Year(calendarYear: 1800)
    XCTAssertFalse(year.isLeapYear)
  }
}
