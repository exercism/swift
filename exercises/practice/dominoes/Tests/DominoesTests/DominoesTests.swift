import XCTest

@testable import Dominoes

class DominoesTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyInputEmptyOutput() {
    let input = [(Int, Int)]()
    XCTAssertTrue(Dominoes(input).chained)
  }

  func testSingletonInputSingletonOutput() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 1)]
    XCTAssertTrue(Dominoes(input).chained)
  }

  func testSingletonThatCantBeChained() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2)]
    XCTAssertFalse(Dominoes(input).chained)
  }

  func testThreeElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (3, 1), (2, 3)]
    XCTAssertTrue(Dominoes(input).chained)
  }

  func testCanReverseDominoes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (1, 3), (2, 3)]
    XCTAssertTrue(Dominoes(input).chained)
  }

  func testCantBeChained() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (4, 1), (2, 3)]
    XCTAssertFalse(Dominoes(input).chained)
  }

  func testDisconnectedSimple() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 1), (2, 2)]
    XCTAssertFalse(Dominoes(input).chained)
  }

  func testDisconnectedDoubleLoop() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (2, 1), (3, 4), (4, 3)]
    XCTAssertFalse(Dominoes(input).chained)
  }

  func testDisconnectedSingleIsolated() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (2, 3), (3, 1), (4, 4)]
    XCTAssertFalse(Dominoes(input).chained)
  }

  func testNeedBacktrack() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (2, 3), (3, 1), (2, 4), (2, 4)]
    XCTAssertTrue(Dominoes(input).chained)
  }

  func testSeparateLoops() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (2, 3), (3, 1), (1, 1), (2, 2), (3, 3)]
    XCTAssertTrue(Dominoes(input).chained)
  }

  func testNineElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (5, 3), (3, 1), (1, 2), (2, 4), (1, 6), (2, 3), (3, 4), (5, 6)]
    XCTAssertTrue(Dominoes(input).chained)
  }

  func testSeparateThreeDominoLoops() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [(1, 2), (2, 3), (3, 1), (4, 5), (5, 6), (6, 4)]
    XCTAssertFalse(Dominoes(input).chained)
  }
}
