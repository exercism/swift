import Foundation
import Testing

@testable import HighScores

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct HighScoresTests {

  @Test("List of scores")
  func testListOfScores() {
    #expect(HighScores(scores: [30, 50, 20, 70]).scores == [30, 50, 20, 70])
  }

  @Test("Latest score", .enabled(if: RUNALL))
  func testLatestScore() {
    #expect(HighScores(scores: [100, 0, 90, 30]).latest == 30)
  }

  @Test("Personal best", .enabled(if: RUNALL))
  func testPersonalBest() {
    #expect(HighScores(scores: [40, 100, 70]).personalBest == 100)
  }

  @Test("Personal top three from a list of scores", .enabled(if: RUNALL))
  func testPersonalTopThreeFromAListOfScores() {
    var hs = HighScores(scores: [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70])
    #expect(hs.topThree == [100, 90, 70])
  }

  @Test("Personal top highest to lowest", .enabled(if: RUNALL))
  func testPersonalTopHighestToLowest() {
    var hs = HighScores(scores: [20, 10, 30])
    #expect(hs.topThree == [30, 20, 10])
  }

  @Test("Personal top when there is a tie", .enabled(if: RUNALL))
  func testPersonalTopWhenThereIsATie() {
    var hs = HighScores(scores: [40, 20, 40, 30])
    #expect(hs.topThree == [40, 40, 30])
  }

  @Test("Personal top when there are less than 3", .enabled(if: RUNALL))
  func testPersonalTopWhenThereAreLessThan3() {
    var hs = HighScores(scores: [30, 70])
    #expect(hs.topThree == [70, 30])
  }

  @Test("Personal top when there is only one", .enabled(if: RUNALL))
  func testPersonalTopWhenThereIsOnlyOne() {
    var hs = HighScores(scores: [40])
    #expect(hs.topThree == [40])
  }

  @Test("Latest score after personal top scores", .enabled(if: RUNALL))
  func testLatestScoreAfterPersonalTopScores() {
    var hs = HighScores(scores: [70, 50, 20, 30])
    hs.topThree
    #expect(hs.latest == 30)
  }

  @Test("Scores after personal top scores", .enabled(if: RUNALL))
  func testScoresAfterPersonalTopScores() {
    var hs = HighScores(scores: [30, 50, 20, 70])
    hs.topThree
    #expect(hs.scores == [30, 50, 20, 70])
  }

  @Test("Latest score after personal best", .enabled(if: RUNALL))
  func testLatestScoreAfterPersonalBest() {
    var hs = HighScores(scores: [20, 70, 15, 25, 30])
    hs.personalBest
    #expect(hs.latest == 30)
  }

  @Test("Scores after personal best", .enabled(if: RUNALL))
  func testScoresAfterPersonalBest() {
    var hs = HighScores(scores: [20, 70, 15, 25, 30])
    hs.personalBest
    #expect(hs.scores == [20, 70, 15, 25, 30])
  }

}
