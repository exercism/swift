import Foundation
import Testing

@testable import Clock

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ClockTests {

  @Test("on the hour")
  func testOnTheHour() {
    #expect(Clock(hours: 8, minutes: 0).description == "08:00")
  }

  @Test("past the hour", .enabled(if: RUNALL))
  func testPastTheHour() {
    #expect(Clock(hours: 11, minutes: 9).description == "11:09")
  }

  @Test("midnight is zero hours", .enabled(if: RUNALL))
  func testMidnightIsZeroHours() {
    #expect(Clock(hours: 24, minutes: 0).description == "00:00")
  }

  @Test("hour rolls over", .enabled(if: RUNALL))
  func testHourRollsOver() {
    #expect(Clock(hours: 25, minutes: 0).description == "01:00")
  }

  @Test("hour rolls over continuously", .enabled(if: RUNALL))
  func testHourRollsOverContinuously() {
    #expect(Clock(hours: 100, minutes: 0).description == "04:00")
  }

  @Test("sixty minutes is next hour", .enabled(if: RUNALL))
  func testSixtyMinutesIsNextHour() {
    #expect(Clock(hours: 1, minutes: 60).description == "02:00")
  }

  @Test("minutes roll over", .enabled(if: RUNALL))
  func testMinutesRollOver() {
    #expect(Clock(hours: 0, minutes: 160).description == "02:40")
  }

  @Test("minutes roll over continuously", .enabled(if: RUNALL))
  func testMinutesRollOverContinuously() {
    #expect(Clock(hours: 0, minutes: 1723).description == "04:43")
  }

  @Test("hour and minutes roll over", .enabled(if: RUNALL))
  func testHourAndMinutesRollOver() {
    #expect(Clock(hours: 25, minutes: 160).description == "03:40")
  }

  @Test("hour and minutes roll over continuously", .enabled(if: RUNALL))
  func testHourAndMinutesRollOverContinuously() {
    #expect(Clock(hours: 201, minutes: 3001).description == "11:01")
  }

  @Test("hour and minutes roll over to exactly midnight", .enabled(if: RUNALL))
  func testHourAndMinutesRollOverToExactlyMidnight() {
    #expect(Clock(hours: 72, minutes: 8640).description == "00:00")
  }

  @Test("negative hour", .enabled(if: RUNALL))
  func testNegativeHour() {
    #expect(Clock(hours: -1, minutes: 15).description == "23:15")
  }

  @Test("negative hour rolls over", .enabled(if: RUNALL))
  func testNegativeHourRollsOver() {
    #expect(Clock(hours: -25, minutes: 0).description == "23:00")
  }

  @Test("negative hour rolls over continuously", .enabled(if: RUNALL))
  func testNegativeHourRollsOverContinuously() {
    #expect(Clock(hours: -91, minutes: 0).description == "05:00")
  }

  @Test("negative minutes", .enabled(if: RUNALL))
  func testNegativeMinutes() {
    #expect(Clock(hours: 1, minutes: -40).description == "00:20")
  }

  @Test("negative minutes roll over", .enabled(if: RUNALL))
  func testNegativeMinutesRollOver() {
    #expect(Clock(hours: 1, minutes: -160).description == "22:20")
  }

  @Test("negative minutes roll over continuously", .enabled(if: RUNALL))
  func testNegativeMinutesRollOverContinuously() {
    #expect(Clock(hours: 1, minutes: -4820).description == "16:40")
  }

  @Test("negative sixty minutes is previous hour", .enabled(if: RUNALL))
  func testNegativeSixtyMinutesIsPreviousHour() {
    #expect(Clock(hours: 2, minutes: -60).description == "01:00")
  }

  @Test("negative hour and minutes both roll over", .enabled(if: RUNALL))
  func testNegativeHourAndMinutesBothRollOver() {
    #expect(Clock(hours: -25, minutes: -160).description == "20:20")
  }

  @Test("negative hour and minutes both roll over continuously", .enabled(if: RUNALL))
  func testNegativeHourAndMinutesBothRollOverContinuously() {
    #expect(Clock(hours: -121, minutes: -5810).description == "22:10")
  }

  @Test("add minutes", .enabled(if: RUNALL))
  func testAddMinutes() {
    let clock = Clock(hours: 10, minutes: 0).add(minutes: 3)
    #expect(clock.description == "10:03")
  }

  @Test("add no minutes", .enabled(if: RUNALL))
  func testAddNoMinutes() {
    let clock = Clock(hours: 6, minutes: 41).add(minutes: 0)
    #expect(clock.description == "06:41")
  }

  @Test("add to next hour", .enabled(if: RUNALL))
  func testAddToNextHour() {
    let clock = Clock(hours: 0, minutes: 45).add(minutes: 40)
    #expect(clock.description == "01:25")
  }

  @Test("add more than one hour", .enabled(if: RUNALL))
  func testAddMoreThanOneHour() {
    let clock = Clock(hours: 10, minutes: 0).add(minutes: 61)
    #expect(clock.description == "11:01")
  }

  @Test("add more than two hours with carry", .enabled(if: RUNALL))
  func testAddMoreThanTwoHoursWithCarry() {
    let clock = Clock(hours: 0, minutes: 45).add(minutes: 160)
    #expect(clock.description == "03:25")
  }

  @Test("add across midnight", .enabled(if: RUNALL))
  func testAddAcrossMidnight() {
    let clock = Clock(hours: 23, minutes: 59).add(minutes: 2)
    #expect(clock.description == "00:01")
  }

  @Test("add more than one day (1500 min = 25 hrs)", .enabled(if: RUNALL))
  func testAddMoreThanOneDay1500Min25Hrs() {
    let clock = Clock(hours: 5, minutes: 32).add(minutes: 1500)
    #expect(clock.description == "06:32")
  }

  @Test("add more than two days", .enabled(if: RUNALL))
  func testAddMoreThanTwoDays() {
    let clock = Clock(hours: 1, minutes: 1).add(minutes: 3500)
    #expect(clock.description == "11:21")
  }

  @Test("subtract minutes", .enabled(if: RUNALL))
  func testSubtractMinutes() {
    let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 3)
    #expect(clock.description == "10:00")
  }

  @Test("subtract to previous hour", .enabled(if: RUNALL))
  func testSubtractToPreviousHour() {
    let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 30)
    #expect(clock.description == "09:33")
  }

  @Test("subtract more than an hour", .enabled(if: RUNALL))
  func testSubtractMoreThanAnHour() {
    let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 70)
    #expect(clock.description == "08:53")
  }

  @Test("subtract across midnight", .enabled(if: RUNALL))
  func testSubtractAcrossMidnight() {
    let clock = Clock(hours: 0, minutes: 3).subtract(minutes: 4)
    #expect(clock.description == "23:59")
  }

  @Test("subtract more than two hours", .enabled(if: RUNALL))
  func testSubtractMoreThanTwoHours() {
    let clock = Clock(hours: 0, minutes: 0).subtract(minutes: 160)
    #expect(clock.description == "21:20")
  }

  @Test("subtract more than two hours with borrow", .enabled(if: RUNALL))
  func testSubtractMoreThanTwoHoursWithBorrow() {
    let clock = Clock(hours: 6, minutes: 15).subtract(minutes: 160)
    #expect(clock.description == "03:35")
  }

  @Test("subtract more than one day (1500 min = 25 hrs)", .enabled(if: RUNALL))
  func testSubtractMoreThanOneDay1500Min25Hrs() {
    let clock = Clock(hours: 5, minutes: 32).subtract(minutes: 1500)
    #expect(clock.description == "04:32")
  }

  @Test("subtract more than two days", .enabled(if: RUNALL))
  func testSubtractMoreThanTwoDays() {
    let clock = Clock(hours: 2, minutes: 20).subtract(minutes: 3000)
    #expect(clock.description == "00:20")
  }

  @Test("clocks with same time", .enabled(if: RUNALL))
  func testClocksWithSameTime() {
    let clock1 = Clock(hours: 15, minutes: 37)
    let clock2 = Clock(hours: 15, minutes: 37)
    #expect(clock1 == clock2)
  }

  @Test("clocks a minute apart", .enabled(if: RUNALL))
  func testClocksAMinuteApart() {
    let clock1 = Clock(hours: 15, minutes: 36)
    let clock2 = Clock(hours: 15, minutes: 37)
    #expect(clock1 != clock2)
  }

  @Test("clocks an hour apart", .enabled(if: RUNALL))
  func testClocksAnHourApart() {
    let clock1 = Clock(hours: 14, minutes: 37)
    let clock2 = Clock(hours: 15, minutes: 37)
    #expect(clock1 != clock2)
  }

  @Test("clocks with hour overflow", .enabled(if: RUNALL))
  func testClocksWithHourOverflow() {
    let clock1 = Clock(hours: 10, minutes: 37)
    let clock2 = Clock(hours: 34, minutes: 37)
    #expect(clock1 == clock2)
  }

  @Test("clocks with hour overflow by several days", .enabled(if: RUNALL))
  func testClocksWithHourOverflowBySeveralDays() {
    let clock1 = Clock(hours: 3, minutes: 11)
    let clock2 = Clock(hours: 99, minutes: 11)
    #expect(clock1 == clock2)
  }

  @Test("clocks with negative hour", .enabled(if: RUNALL))
  func testClocksWithNegativeHour() {
    let clock1 = Clock(hours: 22, minutes: 40)
    let clock2 = Clock(hours: -2, minutes: 40)
    #expect(clock1 == clock2)
  }

  @Test("clocks with negative hour that wraps", .enabled(if: RUNALL))
  func testClocksWithNegativeHourThatWraps() {
    let clock1 = Clock(hours: 17, minutes: 3)
    let clock2 = Clock(hours: -31, minutes: 3)
    #expect(clock1 == clock2)
  }

  @Test("clocks with negative hour that wraps multiple times", .enabled(if: RUNALL))
  func testClocksWithNegativeHourThatWrapsMultipleTimes() {
    let clock1 = Clock(hours: 13, minutes: 49)
    let clock2 = Clock(hours: -83, minutes: 49)
    #expect(clock1 == clock2)
  }

  @Test("clocks with minute overflow", .enabled(if: RUNALL))
  func testClocksWithMinuteOverflow() {
    let clock1 = Clock(hours: 0, minutes: 1)
    let clock2 = Clock(hours: 0, minutes: 1441)
    #expect(clock1 == clock2)
  }

  @Test("clocks with minute overflow by several days", .enabled(if: RUNALL))
  func testClocksWithMinuteOverflowBySeveralDays() {
    let clock1 = Clock(hours: 2, minutes: 2)
    let clock2 = Clock(hours: 2, minutes: 4322)
    #expect(clock1 == clock2)
  }

  @Test("clocks with negative minute", .enabled(if: RUNALL))
  func testClocksWithNegativeMinute() {
    let clock1 = Clock(hours: 2, minutes: 40)
    let clock2 = Clock(hours: 3, minutes: -20)
    #expect(clock1 == clock2)
  }

  @Test("clocks with negative minute that wraps", .enabled(if: RUNALL))
  func testClocksWithNegativeMinuteThatWraps() {
    let clock1 = Clock(hours: 4, minutes: 10)
    let clock2 = Clock(hours: 5, minutes: -1490)
    #expect(clock1 == clock2)
  }

  @Test("clocks with negative minute that wraps multiple times", .enabled(if: RUNALL))
  func testClocksWithNegativeMinuteThatWrapsMultipleTimes() {
    let clock1 = Clock(hours: 6, minutes: 15)
    let clock2 = Clock(hours: 6, minutes: -4305)
    #expect(clock1 == clock2)
  }

  @Test("clocks with negative hours and minutes", .enabled(if: RUNALL))
  func testClocksWithNegativeHoursAndMinutes() {
    let clock1 = Clock(hours: 7, minutes: 32)
    let clock2 = Clock(hours: -12, minutes: -268)
    #expect(clock1 == clock2)
  }

  @Test("clocks with negative hours and minutes that wrap", .enabled(if: RUNALL))
  func testClocksWithNegativeHoursAndMinutesThatWrap() {
    let clock1 = Clock(hours: 18, minutes: 7)
    let clock2 = Clock(hours: -54, minutes: -11513)
    #expect(clock1 == clock2)
  }

  @Test("full clock and zeroed clock", .enabled(if: RUNALL))
  func testFullClockAndZeroedClock() {
    let clock1 = Clock(hours: 24, minutes: 0)
    let clock2 = Clock(hours: 0, minutes: 0)
    #expect(clock1 == clock2)
  }
}
