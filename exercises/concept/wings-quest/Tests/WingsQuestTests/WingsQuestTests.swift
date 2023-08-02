import XCTest

@testable import WingsQuest

let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

class TaskBonusPoints: XCTestCase {
  func testGetsBonusPoints() {
    XCTAssertTrue(
      bonusPoints(powerUpActive: true, touchingEagle: true)
    )
  }

  func testNoBonusPointsWhenNotPowerUpActive() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      bonusPoints(powerUpActive: false, touchingEagle: true)
    )
  }

  func testNoBonusPointsWhenNotTouchingOtherBird() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      bonusPoints(powerUpActive: true, touchingEagle: false)
    )
  }

  func testNoBonusPointsWhenNotTouchingOtherBirdnorPowerUp() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      bonusPoints(powerUpActive: false, touchingEagle: false)
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
      lose(powerUpActive: false, touchingEagle: true)
    )
  }

  func testDontLoseWhenPowerUp() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      lose(powerUpActive: true, touchingEagle: true)
    )
  }

  func testDontLoseWhenNotTouchingAndPowerUp() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      lose(powerUpActive: false, touchingEagle: false)
    )
  }

  func testDontLoseWhenNotTouching() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      lose(powerUpActive: true, touchingEagle: false)
    )
  }
}

class TaskWin: XCTestCase {
  func testWin() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(
      win(HasPickedUpAllSeeds: true, powerUpActive: false, touchingEagle: false)
    )
  }

  func testDontWinIfLost() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      win(HasPickedUpAllSeeds: true, powerUpActive: false, touchingEagle: true)
    )
  }

  func testWinIfPickedUpAllSeedsAndTouchingOtherBird() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(
      win(HasPickedUpAllSeeds: true, powerUpActive: false, touchingEagle: true)
    )
  }
}
