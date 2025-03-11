import Testing
import Foundation

@testable import WingsQuest

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct WingsQuestTests {
  @Test("Get bonus points")
  func testTaskBonusPoints() {
    #expect(bonusPoints(powerUpActive: true, touchingEagle: true))
  }

  @Test("No bonus points when not power up active", .enabled(if: RUNALL))
  func testNoBonusPointsWhenNotPowerUpActive() {
    #expect(!bonusPoints(powerUpActive: false, touchingEagle: true))
  }

  @Test("No bonus points when not touching other bird", .enabled(if: RUNALL))
  func testNoBonusPointsWhenNotTouchingOtherBird() {
    #expect(!bonusPoints(powerUpActive: true, touchingEagle: false))
  }

  @Test("No bonus points when not touching other bird nor power up", .enabled(if: RUNALL))
  func testNoBonusPointsWhenNotTouchingOtherBirdnorPowerUp() {
    #expect(!bonusPoints(powerUpActive: false, touchingEagle: false))
  }

  @Test("Get score", .enabled(if: RUNALL))
  func testTaskScore() {
    #expect(score(touchingPowerUp: true, touchingSeed: true))
  }

  @Test("Get score when not touching seed", .enabled(if: RUNALL))
  func testGetScoreWhenNotTouchingSeed() {
    #expect(score(touchingPowerUp: false, touchingSeed: true))
  }

  @Test("Get score when not touching power up", .enabled(if: RUNALL))
  func testGetScoreWhenNotTouchingPowerUp() {
    #expect(score(touchingPowerUp: true, touchingSeed: false))
  }

  @Test("No score when both is false", .enabled(if: RUNALL))
  func testNoScoreWhenBothIsFalse() {
    #expect(!score(touchingPowerUp: false, touchingSeed: false))
  }

  @Test("Lose", .enabled(if: RUNALL))
  func testTaskLose() {
    #expect(lose(powerUpActive: false, touchingEagle: true))
  }

  @Test("Don't lose when power up", .enabled(if: RUNALL))
  func testDontLoseWhenPowerUp() {
    #expect(!lose(powerUpActive: true, touchingEagle: true))
  }

  @Test("Don't lose when not touching and power up", .enabled(if: RUNALL))
  func testDontLoseWhenNotTouchingAndPowerUp() {
    #expect(!lose(powerUpActive: false, touchingEagle: false))
  }

  @Test("Don't lose when not touching", .enabled(if: RUNALL))
  func testDontLoseWhenNotTouching() {
    #expect(!lose(powerUpActive: true, touchingEagle: false))
  }

  @Test("Win", .enabled(if: RUNALL))
  func testTaskWin() {
    #expect(win(hasPickedUpAllSeeds: true, powerUpActive: false, touchingEagle: false))
  }

  @Test("Don't win if lost", .enabled(if: RUNALL))
  func testDontWinIfLost() {
    #expect(!win(hasPickedUpAllSeeds: true, powerUpActive: false, touchingEagle: true))
  }

  @Test("Win if picked up all seeds and touching other bird", .enabled(if: RUNALL))
  func testWinIfPickedUpAllSeedsAndTouchingOtherBird() {
    #expect(!win(hasPickedUpAllSeeds: true, powerUpActive: false, touchingEagle: true))
  }
}
