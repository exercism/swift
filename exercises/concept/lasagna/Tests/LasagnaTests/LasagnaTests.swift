import Testing
import Foundation

@testable import Lasagna

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct LasagnaTests {
  @Test("Expected minutes in oven")
  func testExpectedMinutes() {
    #expect(expectedMinutesInOven == 40)
  }

  @Test("Remaining minutes in oven", .enabled(if: RUNALL))
  func testRemainingMinutes() {
    #expect(remainingMinutesInOven(elapsedMinutes: 13) == 27)
  }

  @Test("Remaining minutes in oven when done", .enabled(if: RUNALL))
  func testRemainingMinutesWhenDone() {
    #expect(remainingMinutesInOven(elapsedMinutes: 40) == 0)
  }

  @Test("Remaining minutes in oven when less than one", .enabled(if: RUNALL))
  func testRemainingMinutesWhenLessThanOne() {
    #expect(remainingMinutesInOven(elapsedMinutes: 39) == 1)
  }

  @Test("Preparation time in minutes", .enabled(if: RUNALL))
  func testPreparationMinutes() {
    #expect(preparationTimeInMinutes(layers: 6) == 12)
  }

  @Test("Preparation time in minutes for one layer", .enabled(if: RUNALL))
  func testPreparationMinutesForOneLayer() {
    #expect(preparationTimeInMinutes(layers: 1) == 2)
  }

  @Test("Preparation time in minutes for zero layers", .enabled(if: RUNALL))
  func testPreparationMinutesForZeroLayers() {
    #expect(preparationTimeInMinutes(layers: 0) == 0)
  }

  @Test("Total time in minutes", .enabled(if: RUNALL))
  func testTotalMinutes() {
    #expect(totalTimeInMinutes(layers: 1, elapsedMinutes: 30) == 32)
  }

  @Test("Total time in minutes when done", .enabled(if: RUNALL))
  func testTotalMinutesWhenDone() {
    #expect(totalTimeInMinutes(layers: 2, elapsedMinutes: 25) == 29)
  }

  @Test("Total time in minutes when less than one", .enabled(if: RUNALL))
  func testTotalMinutesWhenLessThanOne() {
    #expect(totalTimeInMinutes(layers: 4, elapsedMinutes: 8) == 16)
  }
}
