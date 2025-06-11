import Foundation
import Testing

@testable import BirdWatcher

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct BirdWatcherTests {
  @Test("calculates the correct total number of birds")
  func testTotalBirdCount() {
    let birdCount = [9, 0, 8, 4, 5, 1, 3]
    let expected = 30
    #expect(totalBirdCount(birdCount) == expected)
  }

  @Test("works for a short bird count list", .enabled(if: RUNALL))
  func testTotalBirdCountShort() {
    let birdCount = [2]
    let expected = 2
    #expect(totalBirdCount(birdCount) == expected)
  }

  @Test("works for a long bird count list", .enabled(if: RUNALL))
  func testTotalBirdCountLong() {
    let birdCount = [2, 8, 4, 1, 3, 5, 0, 4, 1, 6, 0, 3, 0, 1, 5, 4, 1, 1, 2, 6]
    let expected = 57
    #expect(totalBirdCount(birdCount) == expected)
  }

  @Test("calculates the number of birds in the first week", .enabled(if: RUNALL))
  func testBirdsInFirstWeek() {
    let birdCount = [3, 0, 5, 1, 0, 4, 1, 0, 3, 4, 3, 0, 8, 0]
    let weekNumber = 1
    let expected = 14
    #expect(birdsInWeek(birdCount, weekNumber: weekNumber) == expected)
  }

  @Test("calculates the number of birds for a week in the middle of the log", .enabled(if: RUNALL))
  func testBirdsInMiddleWeek() {
    let birdCount = [4, 7, 3, 2, 1, 1, 2, 0, 2, 3, 2, 7, 1, 3, 0, 6, 5, 3, 7, 2, 3]
    let weekNumber = 2
    let expected = 18
    #expect(birdsInWeek(birdCount, weekNumber: weekNumber) == expected)
  }

  @Test("calculates the number of birds for a week in the end of the log", .enabled(if: RUNALL))
  func testBirdsInLastWeek() {
    let birdCount = [4, 7, 3, 2, 1, 1, 2, 0, 2, 3, 2, 7, 1, 3, 0, 6, 5, 3, 7, 2, 3]
    let weekNumber = 3
    let expected = 26
    #expect(birdsInWeek(birdCount, weekNumber: weekNumber) == expected)
  }

  @Test("works when there is only one week", .enabled(if: RUNALL))
  func testBirdsInOneWeek() {
    let birdCount = [3, 0, 3, 3, 2, 1, 0]
    let weekNumber = 1
    let expected = 12
    #expect(birdsInWeek(birdCount, weekNumber: weekNumber) == expected)
  }

  @Test("returns a bird count list with the corrected values", .enabled(if: RUNALL))
  func testFixBirdCountLog() {
    let birdCount = [3, 0, 5, 1, 0, 4, 1, 0, 3, 4, 3, 0]
    let expected = [4, 0, 6, 1, 1, 4, 2, 0, 4, 4, 4, 0]
    #expect(fixBirdCountLog(birdCount) == expected)
  }

  @Test("works for a short bird count list", .enabled(if: RUNALL))
  func testFixBirdCountLogShort() {
    let birdCount = [4, 2]
    let expected = [5, 2]
    #expect(fixBirdCountLog(birdCount) == expected)
  }

  @Test("works for a long bird count list", .enabled(if: RUNALL))
  func testFixBirdCountLogLong() {
    let birdCount = [2, 8, 4, 1, 3, 5, 0, 4, 1, 6, 0, 3, 0, 1, 5, 4, 1, 1, 2, 6]
    let expected = [3, 8, 5, 1, 4, 5, 1, 4, 2, 6, 1, 3, 1, 1, 6, 4, 2, 1, 3, 6]
    #expect(fixBirdCountLog(birdCount) == expected)
  }
}
