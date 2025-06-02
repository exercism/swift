import Foundation
import Testing

@testable import Leap

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct LeapTests {

  @Test("year not divisible by 4 in common year")
  func testYearNotDivisibleBy4InCommonYear() {
    let year = Year(calendarYear: 2015)
    #expect(!year.isLeapYear)
  }

  @Test("year divisible by 2, not divisible by 4 in common year", .enabled(if: RUNALL))
  func testYearDivisibleBy2NotDivisibleBy4InCommonYear() {
    let year = Year(calendarYear: 1970)
    #expect(!year.isLeapYear)
  }

  @Test("year divisible by 4, not divisible by 100 in leap year", .enabled(if: RUNALL))
  func testYearDivisibleBy4NotDivisibleBy100InLeapYear() {
    let year = Year(calendarYear: 1996)
    #expect(year.isLeapYear)
  }

  @Test("year divisible by 4 and 5 is still a leap year", .enabled(if: RUNALL))
  func testYearDivisibleBy4And5IsStillALeapYear() {
    let year = Year(calendarYear: 1960)
    #expect(year.isLeapYear)
  }

  @Test("year divisible by 100, not divisible by 400 in common year", .enabled(if: RUNALL))
  func testYearDivisibleBy100NotDivisibleBy400InCommonYear() {
    let year = Year(calendarYear: 2100)
    #expect(!year.isLeapYear)
  }

  @Test("year divisible by 100 but not by 3 is still not a leap year", .enabled(if: RUNALL))
  func testYearDivisibleBy100ButNotBy3IsStillNotALeapYear() {
    let year = Year(calendarYear: 1900)
    #expect(!year.isLeapYear)
  }

  @Test("year divisible by 400 is leap year", .enabled(if: RUNALL))
  func testYearDivisibleBy400IsLeapYear() {
    let year = Year(calendarYear: 2000)
    #expect(year.isLeapYear)
  }

  @Test("year divisible by 400 but not by 125 is still a leap year", .enabled(if: RUNALL))
  func testYearDivisibleBy400ButNotBy125IsStillALeapYear() {
    let year = Year(calendarYear: 2400)
    #expect(year.isLeapYear)
  }

  @Test("year divisible by 200, not divisible by 400 in common year", .enabled(if: RUNALL))
  func testYearDivisibleBy200NotDivisibleBy400InCommonYear() {
    let year = Year(calendarYear: 1800)
    #expect(!year.isLeapYear)
  }
}
