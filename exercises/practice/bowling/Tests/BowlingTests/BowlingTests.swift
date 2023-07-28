import XCTest

@testable import Bowling

class BowlingTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testShouldBeAbleToScoreAGameWithAllZeros() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    XCTAssertEqual(try! bowling.score(), 0)
  }

  func testShouldBeAbleToScoreAGameWithNoStrikesOrSpares() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6])
    XCTAssertEqual(try! bowling.score(), 90)
  }

  func testASpareFollowedByZerosIsWorthTenPoints() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    XCTAssertEqual(try! bowling.score(), 10)
  }

  func testPointsScoredInTheRollAfterASpareAreCountedTwice() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    XCTAssertEqual(try! bowling.score(), 16)
  }

  func testConsecutiveSparesEachGetAOneRollBonus() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    XCTAssertEqual(try! bowling.score(), 31)
  }

  func testASpareInTheLastFrameGetsAOneRollBonusThatIsCountedOnce() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7])
    XCTAssertEqual(try! bowling.score(), 17)
  }

  func testAStrikeEarnsTenPointsInAFrameWithASingleRoll() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    XCTAssertEqual(try! bowling.score(), 10)
  }

  func testPointsScoredInTheTwoRollsAfterAStrikeAreCountedTwiceAsABonus() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    XCTAssertEqual(try! bowling.score(), 26)
  }

  func testConsecutiveStrikesEachGetTheTwoRollBonus() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    XCTAssertEqual(try! bowling.score(), 81)
  }

  func testAStrikeInTheLastFrameGetsATwoRollBonusThatIsCountedOnce() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1])
    XCTAssertEqual(try! bowling.score(), 18)
  }

  func testRollingASpareWithTheTwoRollBonusDoesNotGetABonusRoll() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3])
    XCTAssertEqual(try! bowling.score(), 20)
  }

  func testStrikesWithTheTwoRollBonusDoNotGetBonusRolls() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10])
    XCTAssertEqual(try! bowling.score(), 30)
  }

  func testLastTwoStrikesFollowedByOnlyLastBonusWithNonStrikePoints() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 1])
    XCTAssertEqual(try! bowling.score(), 31)
  }

  func testAStrikeWithTheOneRollBonusAfterASpareInTheLastFrameDoesNotGetABonus() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10])
    XCTAssertEqual(try! bowling.score(), 20)
  }

  func testAllStrikesIsAPerfectGame() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
    XCTAssertEqual(try! bowling.score(), 300)
  }

  func testRollsCannotScoreNegativePoints() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([])
    XCTAssertThrowsError(try bowling.roll(pins: -1)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.negativePins)
    }
  }

  func testARollCannotScoreMoreThan10Points() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([])
    XCTAssertThrowsError(try bowling.roll(pins: 11)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.tooManyPinsInFrame)
    }
  }

  func testTwoRollsInAFrameCannotScoreMoreThan10Points() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([5])
    XCTAssertThrowsError(try bowling.roll(pins: 6)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.tooManyPinsInFrame)
    }
  }

  func testBonusRollAfterAStrikeInTheLastFrameCannotScoreMoreThan10Points() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])
    XCTAssertThrowsError(try bowling.roll(pins: 11)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.tooManyPinsInFrame)
    }
  }

  func testTwoBonusRollsAfterAStrikeInTheLastFrameCannotScoreMoreThan10Points() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5])
    XCTAssertThrowsError(try bowling.roll(pins: 6)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.tooManyPinsInFrame)
    }
  }

  func testTwoBonusRollsAfterAStrikeInTheLastFrameCanScoreMoreThan10PointsIfOneIsAStrike() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6])
    XCTAssertEqual(try! bowling.score(), 26)
  }

  func testTheSecondBonusRollsAfterAStrikeInTheLastFrameCannotBeAStrikeIfTheFirstOneIsNotAStrike()
    throws
  {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6])
    XCTAssertThrowsError(try bowling.roll(pins: 10)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.tooManyPinsInFrame)
    }
  }

  func testSecondBonusRollAfterAStrikeInTheLastFrameCannotScoreMoreThan10Points() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])
    XCTAssertThrowsError(try bowling.roll(pins: 11)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.tooManyPinsInFrame)
    }
  }

  func testAnUnstartedGameCannotBeScored() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([])
    XCTAssertThrowsError(try bowling.score()) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.gameInProgress)
    }
  }

  func testAnIncompleteGameCannotBeScored() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0])
    XCTAssertThrowsError(try bowling.score()) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.gameInProgress)
    }
  }

  func testCannotRollIfGameAlreadyHasTenFrames() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    XCTAssertThrowsError(try bowling.roll(pins: 0)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.gameIsOver)
    }
  }

  func testBonusRollsForAStrikeInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])
    XCTAssertThrowsError(try bowling.score()) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.gameInProgress)
    }
  }

  func testBothBonusRollsForAStrikeInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])
    XCTAssertThrowsError(try bowling.score()) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.gameInProgress)
    }
  }

  func testBonusRollForASpareInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3])
    XCTAssertThrowsError(try bowling.score()) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.gameInProgress)
    }
  }

  func testCannotRollAfterBonusRollForSpare() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2])
    XCTAssertThrowsError(try bowling.roll(pins: 2)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.gameIsOver)
    }
  }

  func testCannotRollAfterBonusRollsForStrike() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2])
    XCTAssertThrowsError(try bowling.roll(pins: 2)) { error in
      XCTAssertEqual(error as? BowlingError, BowlingError.gameIsOver)
    }
  }
}
