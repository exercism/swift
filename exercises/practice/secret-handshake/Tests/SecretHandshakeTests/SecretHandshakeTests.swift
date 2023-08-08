import XCTest

@testable import SecretHandshake

class SecretHandshakeTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testWinkFor1() {
    XCTAssertEqual(commands(number: 1), ["wink"])
  }

  func testDoubleBlinkFor10() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 2), ["double blink"])
  }

  func testCloseYourEyesFor100() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 4), ["close your eyes"])
  }

  func testJumpFor1000() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 8), ["jump"])
  }

  func testCombineTwoActions() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 3), ["wink", "double blink"])
  }

  func testReverseTwoActions() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 19), ["double blink", "wink"])
  }

  func testReversingOneActionGivesTheSameAction() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 24), ["jump"])
  }

  func testReversingNoActionsStillGivesNoActions() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 16), [])
  }

  func testAllPossibleActions() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 15), ["wink", "double blink", "close your eyes", "jump"])
  }

  func testReverseAllPossibleActions() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 31), ["jump", "close your eyes", "double blink", "wink"])
  }

  func testDoNothingForZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(commands(number: 0), [])
  }
}
