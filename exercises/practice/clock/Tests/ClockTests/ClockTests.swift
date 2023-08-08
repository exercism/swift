import XCTest

@testable import Clock

class ClockTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testOnTheHour() {
    XCTAssertEqual(Clock(hours: 8, minutes: 0).description, "08:00")
  }

  func testPastTheHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 11, minutes: 9).description, "11:09")
  }

  func testMidnightIsZeroHours() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 24, minutes: 0).description, "00:00")
  }

  func testHourRollsOver() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 25, minutes: 0).description, "01:00")
  }

  func testHourRollsOverContinuously() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 100, minutes: 0).description, "04:00")
  }

  func testSixtyMinutesIsNextHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 1, minutes: 60).description, "02:00")
  }

  func testMinutesRollOver() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 0, minutes: 160).description, "02:40")
  }

  func testMinutesRollOverContinuously() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 0, minutes: 1723).description, "04:43")
  }

  func testHourAndMinutesRollOver() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 25, minutes: 160).description, "03:40")
  }

  func testHourAndMinutesRollOverContinuously() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 201, minutes: 3001).description, "11:01")
  }

  func testHourAndMinutesRollOverToExactlyMidnight() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 72, minutes: 8640).description, "00:00")
  }

  func testNegativeHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: -1, minutes: 15).description, "23:15")
  }

  func testNegativeHourRollsOver() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: -25, minutes: 0).description, "23:00")
  }

  func testNegativeHourRollsOverContinuously() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: -91, minutes: 0).description, "05:00")
  }

  func testNegativeMinutes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 1, minutes: -40).description, "00:20")
  }

  func testNegativeMinutesRollOver() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 1, minutes: -160).description, "22:20")
  }

  func testNegativeMinutesRollOverContinuously() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 1, minutes: -4820).description, "16:40")
  }

  func testNegativeSixtyMinutesIsPreviousHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: 2, minutes: -60).description, "01:00")
  }

  func testNegativeHourAndMinutesBothRollOver() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: -25, minutes: -160).description, "20:20")
  }

  func testNegativeHourAndMinutesBothRollOverContinuously() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Clock(hours: -121, minutes: -5810).description, "22:10")
  }

  func testAddMinutes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 10, minutes: 0).add(minutes: 3)
    XCTAssertEqual(clock.description, "10:03")
  }

  func testAddNoMinutes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 6, minutes: 41).add(minutes: 0)
    XCTAssertEqual(clock.description, "06:41")
  }

  func testAddToNextHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 0, minutes: 45).add(minutes: 40)
    XCTAssertEqual(clock.description, "01:25")
  }

  func testAddMoreThanOneHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 10, minutes: 0).add(minutes: 61)
    XCTAssertEqual(clock.description, "11:01")
  }

  func testAddMoreThanTwoHoursWithCarry() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 0, minutes: 45).add(minutes: 160)
    XCTAssertEqual(clock.description, "03:25")
  }

  func testAddAcrossMidnight() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 23, minutes: 59).add(minutes: 2)
    XCTAssertEqual(clock.description, "00:01")
  }

  func testAddMoreThanOneDay1500Min25Hrs() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 5, minutes: 32).add(minutes: 1500)
    XCTAssertEqual(clock.description, "06:32")
  }

  func testAddMoreThanTwoDays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 1, minutes: 1).add(minutes: 3500)
    XCTAssertEqual(clock.description, "11:21")
  }

  func testSubtractMinutes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 3)
    XCTAssertEqual(clock.description, "10:00")
  }

  func testSubtractToPreviousHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 30)
    XCTAssertEqual(clock.description, "09:33")
  }

  func testSubtractMoreThanAnHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 70)
    XCTAssertEqual(clock.description, "08:53")
  }

  func testSubtractAcrossMidnight() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 0, minutes: 3).subtract(minutes: 4)
    XCTAssertEqual(clock.description, "23:59")
  }

  func testSubtractMoreThanTwoHours() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 0, minutes: 0).subtract(minutes: 160)
    XCTAssertEqual(clock.description, "21:20")
  }

  func testSubtractMoreThanTwoHoursWithBorrow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 6, minutes: 15).subtract(minutes: 160)
    XCTAssertEqual(clock.description, "03:35")
  }

  func testSubtractMoreThanOneDay1500Min25Hrs() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 5, minutes: 32).subtract(minutes: 1500)
    XCTAssertEqual(clock.description, "04:32")
  }

  func testSubtractMoreThanTwoDays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock = Clock(hours: 2, minutes: 20).subtract(minutes: 3000)
    XCTAssertEqual(clock.description, "00:20")
  }

  func testClocksWithSameTime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 15, minutes: 37)
    let clock2 = Clock(hours: 15, minutes: 37)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksAMinuteApart() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 15, minutes: 36)
    let clock2 = Clock(hours: 15, minutes: 37)
    XCTAssertNotEqual(clock1, clock2)
  }

  func testClocksAnHourApart() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 14, minutes: 37)
    let clock2 = Clock(hours: 15, minutes: 37)
    XCTAssertNotEqual(clock1, clock2)
  }

  func testClocksWithHourOverflow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 10, minutes: 37)
    let clock2 = Clock(hours: 34, minutes: 37)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithHourOverflowBySeveralDays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 3, minutes: 11)
    let clock2 = Clock(hours: 99, minutes: 11)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithNegativeHour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 22, minutes: 40)
    let clock2 = Clock(hours: -2, minutes: 40)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithNegativeHourThatWraps() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 17, minutes: 3)
    let clock2 = Clock(hours: -31, minutes: 3)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithNegativeHourThatWrapsMultipleTimes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 13, minutes: 49)
    let clock2 = Clock(hours: -83, minutes: 49)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithMinuteOverflow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 0, minutes: 1)
    let clock2 = Clock(hours: 0, minutes: 1441)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithMinuteOverflowBySeveralDays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 2, minutes: 2)
    let clock2 = Clock(hours: 2, minutes: 4322)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithNegativeMinute() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 2, minutes: 40)
    let clock2 = Clock(hours: 3, minutes: -20)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithNegativeMinuteThatWraps() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 4, minutes: 10)
    let clock2 = Clock(hours: 5, minutes: -1490)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithNegativeMinuteThatWrapsMultipleTimes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 6, minutes: 15)
    let clock2 = Clock(hours: 6, minutes: -4305)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithNegativeHoursAndMinutes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 7, minutes: 32)
    let clock2 = Clock(hours: -12, minutes: -268)
    XCTAssertEqual(clock1, clock2)
  }

  func testClocksWithNegativeHoursAndMinutesThatWrap() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 18, minutes: 7)
    let clock2 = Clock(hours: -54, minutes: -11513)
    XCTAssertEqual(clock1, clock2)
  }

  func testFullClockAndZeroedClock() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let clock1 = Clock(hours: 24, minutes: 0)
    let clock2 = Clock(hours: 0, minutes: 0)
    XCTAssertEqual(clock1, clock2)
  }
}
