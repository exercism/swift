import Testing
import Foundation
import RealModule

@testable import FreelancerRates

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct FreelancerRatesTests {
  @Test("Daily rate from hourly rate")
  func testTaskDailyRateFrom() {
    #expect(dailyRateFrom(hourlyRate: 60).isApproximatelyEqual(to: 480.0, relativeTolerance: 0.002))
  }

  @Test("Daily rate from hourly rate with 16 as rate", .enabled(if: RUNALL))
  func testTaskDailyRateFromFor16() {
    #expect(dailyRateFrom(hourlyRate: 16).isApproximatelyEqual(to: 128.0, relativeTolerance: 0.002))
  }

  @Test("Daily rate from hourly rate with 25 as rate", .enabled(if: RUNALL))
  func testTaskDailyRateFromFor25() {
    #expect(dailyRateFrom(hourlyRate: 25).isApproximatelyEqual(to: 200.0, relativeTolerance: 0.002))
  }

  @Test("Montly rate with whole result", .enabled(if: RUNALL))
  func testmonthlyWithWholeResult() {
    #expect(monthlyRateFrom(hourlyRate: 80, withDiscount: 50).isApproximatelyEqual(to: 7040, relativeTolerance: 0.001))
  }

  @Test("Montly rate round down", .enabled(if: RUNALL))
  func testmonthlyRoundDown() {
    #expect(monthlyRateFrom(hourlyRate: 77, withDiscount: 10.5).isApproximatelyEqual(to: 12129, relativeTolerance: 0.001))
  }

  @Test("Montly rate round up", .enabled(if: RUNALL))
  func testmonthlyRoundUp() {
    #expect(monthlyRateFrom(hourlyRate: 80, withDiscount: 10.5).isApproximatelyEqual(to: 12602, relativeTolerance: 0.001))
  }


  @Test("Workdays in small budget", .enabled(if: RUNALL))
  func testworkdaysInSmallBudget() {
    #expect(workdaysIn(budget: 1000, hourlyRate: 50, withDiscount: 10).isApproximatelyEqual(to: 2.0, relativeTolerance: 0.001))
  }

  @Test("Workdays in medium budget", .enabled(if: RUNALL))
  func testworkdaysInMediumBudget() {
    #expect(workdaysIn(budget: 5000, hourlyRate: 60, withDiscount: 10).isApproximatelyEqual(to: 11.0, relativeTolerance: 0.001))
  }

  @Test("Workdays large budget", .enabled(if: RUNALL))
  func testworkdaysLargebudget() {
    #expect(workdaysIn(budget: 25_000, hourlyRate: 80, withDiscount: 10).isApproximatelyEqual(to: 43.0, relativeTolerance: 0.001))
  }

  @Test("Workdays should round", .enabled(if: RUNALL))
  func testworkdaysShouldRound() {
    #expect(workdaysIn(budget: 20000, hourlyRate: 80, withDiscount: 11).isApproximatelyEqual(to: 35.0, relativeTolerance: 0.001))
  }

  @Test("Workdays should not round to nearst integer", .enabled(if: RUNALL))
  func testworkdaysShouldNotRoundToNearstInteger() {
    #expect(workdaysIn(budget: 25_000, hourlyRate: 80, withDiscount: 11).isApproximatelyEqual(to: 43.0, relativeTolerance: 0.001))
  }
}
