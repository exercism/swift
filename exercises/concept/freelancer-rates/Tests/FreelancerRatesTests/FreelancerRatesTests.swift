import XCTest

@testable import FreelancerRates

let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

class TaskDailyRateFrom: XCTestCase {
  func testdailyRateFromFor60() {
    XCTAssertEqual(dailyRateFrom(hourlyRate: 60), 480.0, accuracy: 0.001)
  }

  func testdailyRateFromFor16() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dailyRateFrom(hourlyRate: 16), 128.0, accuracy: 0.001)
  }

  func testdailyRateFromFor25() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dailyRateFrom(hourlyRate: 25), 200.0, accuracy: 0.001)
  }
}

class TaskMonthlyRateFrom: XCTestCase {
  func testmonthlyWithWholeResult() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(monthlyRateFrom(hourlyRate: 80, withDiscount: 50), 7040, accuracy: 0.001)
  }

  func testmonthlyRoundDown() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5), 12129, accuracy: 0.001)
  }

  func testmonthlyRoundUp() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(monthlyRateFrom(hourlyRate: 80, withDiscount: 10.5), 12602, accuracy: 0.001)
  }
}

class TaskWorkdaysIn: XCTestCase {
  func testworkdaysInSmallBudget() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      workdaysIn(budget: 1000, hourlyRate: 50, withDiscount: 10), 2.0, accuracy: 0.001)
  }

  func testworkdaysInMediumBudget() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      workdaysIn(budget: 5000, hourlyRate: 60, withDiscount: 10), 11.0, accuracy: 0.001)
  }

  func testworkdaysLargebudget() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      workdaysIn(budget: 25_000, hourlyRate: 80, withDiscount: 10), 43.0, accuracy: 0.001)
  }

  func testworkdaysShouldRound() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11), 35.0, accuracy: 0.001)
  }

  func testworkdaysShouldNotRoundToNearstInteger() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      workdaysIn(budget: 25_000, hourlyRate: 80, withDiscount: 11), 43.0, accuracy: 0.001)
  }
}
