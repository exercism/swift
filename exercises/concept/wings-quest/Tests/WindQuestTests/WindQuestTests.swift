import XCTest

@testable import WindQuest

let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

class TaskBonusPoints: XCTestCase {
  func testGetsBonusPoints() {
    XCTAssertTrue(
      bonusPoints(powerUpActive: true, touchingAnotherBird: true)
    )
  }

  func testNoBonusPointsWhenNotPowerUpActive() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      bonusPoints(powerUpActive: false, touchingAnotherBird: true)
    )
  }

  func testNoBonusPointsWhenNotTouchingOtherBird() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      bonusPoints(powerUpActive: true, touchingAnotherBird: false)
    )
  }

  func testNoBonusPointsWhenNotTouchingOtherBirdnorPowerUp() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      bonusPoints(powerUpActive: false, touchingAnotherBird: false)
    )
  }
}

class TaskScore: XCTestCase {
  func testGetScore() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(
      score(touchingPowerUp: true, touchingSeed: true)
    )
  }

  func testGetScoreWhenNotTouchingSeed() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(
      score(touchingPowerUp: false, touchingSeed: true)
    )
  }

  func testGetScoreWhenNotTouchingPowerUp() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(
      score(touchingPowerUp: true, touchingSeed: false)
    )
  }

  func testNoScoreWhenBothIsFalse() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      score(touchingPowerUp: false, touchingSeed: false)
    )
  }
}

class TaskLose: XCTestCase {
  func testLose() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(
      lose(powerUpActive: false, touchingAnotherBird: true)
    )
  }

  func testDontLoseWhenPowerUp() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      lose(powerUpActive: true, touchingAnotherBird: true)
    )
  }

  func testDontLoseWhenNotTouchingAndPowerUp() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      lose(powerUpActive: false, touchingAnotherBird: false)
    )
  }

  func testDontLoseWhenNotTouching() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      score(touchingPowerUp: true, touchingSeed: false)
    )
  }
}

class TaskWin: XCTestCase {
  func testWin() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(
      win(HasPickedUpAllSeeds: true, powerUpActive: false, touchingAnotherBird: false)
    )
  }

  func testDontWinIfLost() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      win(HasPickedUpAllSeeds: true, powerUpActive: false, touchingAnotherBird: true)
    )
  }

  func testWinIfPickedUpAllSeedsAndTouchingOtherBird() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      win(HasPickedUpAllSeeds: true, powerUpActive: false, touchingAnotherBird: true)
    )
  }
}

