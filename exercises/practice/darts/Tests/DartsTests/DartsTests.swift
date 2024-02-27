import XCTest

@testable import Darts

class DartsTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testMissedTarget() {
    XCTAssertEqual(dartScore(x: -9, y: 9), 0)
  }

  func testOnTheOuterCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: 0, y: 10), 1)
  }

  func testOnTheMiddleCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: -5, y: 0), 5)
  }

  func testOnTheInnerCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: 0, y: -1), 10)
  }

  func testExactlyOnCenter() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: 0, y: 0), 10)
  }

  func testNearTheCenter() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: -0.1, y: -0.1), 10)
  }

  func testJustWithinTheInnerCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: 0.7, y: 0.7), 10)
  }

  func testJustOutsideTheInnerCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: 0.8, y: -0.8), 5)
  }

  func testJustWithinTheMiddleCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: -3.5, y: 3.5), 5)
  }

  func testJustOutsideTheMiddleCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: -3.6, y: -3.6), 1)
  }

  func testJustWithinTheOuterCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: -7, y: 7), 1)
  }

  func testJustOutsideTheOuterCircle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: 7.1, y: -7.1), 0)
  }

  func testAsymmetricPositionBetweenTheInnerAndMiddleCircles() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(dartScore(x: 0.5, y: -4), 5)
  }
}
