import Foundation
import Testing

@testable import Bowling

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct BowlingTests {

  @Test("should be able to score a game with all zeros")
  func testShouldBeAbleToScoreAGameWithAllZeros() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    #expect(try! bowling.score() == 0)
  }

  @Test("should be able to score a game with no strikes or spares", .enabled(if: RUNALL))
  func testShouldBeAbleToScoreAGameWithNoStrikesOrSpares() {
    let bowling = Bowling([3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6])
    #expect(try! bowling.score() == 90)
  }

  @Test("a spare followed by zeros is worth ten points", .enabled(if: RUNALL))
  func testASpareFollowedByZerosIsWorthTenPoints() {
    let bowling = Bowling([6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    #expect(try! bowling.score() == 10)
  }

  @Test("points scored in the roll after a spare are counted twice", .enabled(if: RUNALL))
  func testPointsScoredInTheRollAfterASpareAreCountedTwice() {
    let bowling = Bowling([6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    #expect(try! bowling.score() == 16)
  }

  @Test("consecutive spares each get a one roll bonus", .enabled(if: RUNALL))
  func testConsecutiveSparesEachGetAOneRollBonus() {
    let bowling = Bowling([5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    #expect(try! bowling.score() == 31)
  }

  @Test(
    "a spare in the last frame gets a one roll bonus that is counted once", .enabled(if: RUNALL))
  func testASpareInTheLastFrameGetsAOneRollBonusThatIsCountedOnce() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7])
    #expect(try! bowling.score() == 17)
  }

  @Test("a strike earns ten points in a frame with a single roll", .enabled(if: RUNALL))
  func testAStrikeEarnsTenPointsInAFrameWithASingleRoll() {
    let bowling = Bowling([10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    #expect(try! bowling.score() == 10)
  }

  @Test(
    "points scored in the two rolls after a strike are counted twice as a bonus",
    .enabled(if: RUNALL))
  func testPointsScoredInTheTwoRollsAfterAStrikeAreCountedTwiceAsABonus() {
    let bowling = Bowling([10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    #expect(try! bowling.score() == 26)
  }

  @Test("consecutive strikes each get the two roll bonus", .enabled(if: RUNALL))
  func testConsecutiveStrikesEachGetTheTwoRollBonus() {
    let bowling = Bowling([10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    #expect(try! bowling.score() == 81)
  }

  @Test(
    "a strike in the last frame gets a two roll bonus that is counted once", .enabled(if: RUNALL))
  func testAStrikeInTheLastFrameGetsATwoRollBonusThatIsCountedOnce() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1])
    #expect(try! bowling.score() == 18)
  }

  @Test("rolling a spare with the two roll bonus does not get a bonus roll", .enabled(if: RUNALL))
  func testRollingASpareWithTheTwoRollBonusDoesNotGetABonusRoll() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3])
    #expect(try! bowling.score() == 20)
  }

  @Test("strikes with the two roll bonus do not get bonus rolls", .enabled(if: RUNALL))
  func testStrikesWithTheTwoRollBonusDoNotGetBonusRolls() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10])
    #expect(try! bowling.score() == 30)
  }

  @Test("last two strikes followed by only last bonus with non strike points", .enabled(if: RUNALL))
  func testLastTwoStrikesFollowedByOnlyLastBonusWithNonStrikePoints() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 1])
    #expect(try! bowling.score() == 31)
  }

  @Test(
    "a strike with the one roll bonus after a spare in the last frame does not get a bonus",
    .enabled(if: RUNALL))
  func testAStrikeWithTheOneRollBonusAfterASpareInTheLastFrameDoesNotGetABonus() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10])
    #expect(try! bowling.score() == 20)
  }

  @Test("all strikes is a perfect game", .enabled(if: RUNALL))
  func testAllStrikesIsAPerfectGame() {
    let bowling = Bowling([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])
    #expect(try! bowling.score() == 300)
  }

  @Test("rolls cannot score negative points", .enabled(if: RUNALL))
  func testRollsCannotScoreNegativePoints() {
    let bowling = Bowling([])
    #expect(
      throws:
        BowlingError.negativePins
    ) { try bowling.roll(pins: -1) }

  }

  @Test("a roll cannot score more than 10 points", .enabled(if: RUNALL))
  func testARollCannotScoreMoreThan10Points() {
    let bowling = Bowling([])
    #expect(
      throws:
        BowlingError.tooManyPinsInFrame
    ) { try bowling.roll(pins: 11) }

  }

  @Test("two rolls in a frame cannot score more than 10 points", .enabled(if: RUNALL))
  func testTwoRollsInAFrameCannotScoreMoreThan10Points() {
    let bowling = Bowling([5])
    #expect(
      throws:
        BowlingError.tooManyPinsInFrame
    ) { try bowling.roll(pins: 6) }

  }

  @Test(
    "bonus roll after a strike in the last frame cannot score more than 10 points",
    .enabled(if: RUNALL))
  func testBonusRollAfterAStrikeInTheLastFrameCannotScoreMoreThan10Points() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])
    #expect(
      throws:
        BowlingError.tooManyPinsInFrame
    ) { try bowling.roll(pins: 11) }

  }

  @Test(
    "two bonus rolls after a strike in the last frame cannot score more than 10 points",
    .enabled(if: RUNALL))
  func testTwoBonusRollsAfterAStrikeInTheLastFrameCannotScoreMoreThan10Points() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5])
    #expect(
      throws:
        BowlingError.tooManyPinsInFrame
    ) { try bowling.roll(pins: 6) }

  }

  @Test(
    "two bonus rolls after a strike in the last frame can score more than 10 points if one is a strike",
    .enabled(if: RUNALL))
  func testTwoBonusRollsAfterAStrikeInTheLastFrameCanScoreMoreThan10PointsIfOneIsAStrike() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6])
    #expect(try! bowling.score() == 26)
  }

  @Test(
    "the second bonus rolls after a strike in the last frame cannot be a strike if the first one is not a strike",
    .enabled(if: RUNALL))
  func testTheSecondBonusRollsAfterAStrikeInTheLastFrameCannotBeAStrikeIfTheFirstOneIsNotAStrike() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6])
    #expect(
      throws:
        BowlingError.tooManyPinsInFrame
    ) { try bowling.roll(pins: 10) }

  }

  @Test(
    "second bonus roll after a strike in the last frame cannot score more than 10 points",
    .enabled(if: RUNALL))
  func testSecondBonusRollAfterAStrikeInTheLastFrameCannotScoreMoreThan10Points() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])
    #expect(
      throws:
        BowlingError.tooManyPinsInFrame
    ) { try bowling.roll(pins: 11) }

  }

  @Test("an unstarted game cannot be scored", .enabled(if: RUNALL))
  func testAnUnstartedGameCannotBeScored() {
    let bowling = Bowling([])
    #expect(
      throws:
        BowlingError.gameInProgress
    ) { try bowling.score() }
  }

  @Test("an incomplete game cannot be scored", .enabled(if: RUNALL))
  func testAnIncompleteGameCannotBeScored() {
    let bowling = Bowling([0, 0])
    #expect(
      throws:
        BowlingError.gameInProgress
    ) { try bowling.score() }
  }

  @Test("cannot roll if game already has ten frames", .enabled(if: RUNALL))
  func testCannotRollIfGameAlreadyHasTenFrames() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    #expect(
      throws:
        BowlingError.gameIsOver
    ) { try bowling.roll(pins: 0) }

  }

  @Test(
    "bonus rolls for a strike in the last frame must be rolled before score can be calculated",
    .enabled(if: RUNALL))
  func testBonusRollsForAStrikeInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])
    #expect(
      throws:
        BowlingError.gameInProgress
    ) { try bowling.score() }
  }

  @Test(
    "both bonus rolls for a strike in the last frame must be rolled before score can be calculated",
    .enabled(if: RUNALL))
  func testBothBonusRollsForAStrikeInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])
    #expect(
      throws:
        BowlingError.gameInProgress
    ) { try bowling.score() }
  }

  @Test(
    "bonus roll for a spare in the last frame must be rolled before score can be calculated",
    .enabled(if: RUNALL))
  func testBonusRollForASpareInTheLastFrameMustBeRolledBeforeScoreCanBeCalculated() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3])
    #expect(
      throws:
        BowlingError.gameInProgress
    ) { try bowling.score() }
  }

  @Test("cannot roll after bonus roll for spare", .enabled(if: RUNALL))
  func testCannotRollAfterBonusRollForSpare() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2])
    #expect(
      throws:
        BowlingError.gameIsOver
    ) { try bowling.roll(pins: 2) }

  }

  @Test("cannot roll after bonus rolls for strike", .enabled(if: RUNALL))
  func testCannotRollAfterBonusRollsForStrike() {
    let bowling = Bowling([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2])
    #expect(
      throws:
        BowlingError.gameIsOver
    ) { try bowling.roll(pins: 2) }

  }
}
