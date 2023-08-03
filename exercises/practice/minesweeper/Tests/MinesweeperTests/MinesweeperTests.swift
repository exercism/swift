import XCTest

@testable import Minesweeper

class MinesweeperTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testNoRows() {
    let input = [String]()
    let output = [String]()
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testNoColumns() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [""]
    let output = [""]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testNoMines() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["   ", "   ", "   "]
    let output = ["   ", "   ", "   "]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testMinefieldWithOnlyMines() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["***", "***", "***"]
    let output = ["***", "***", "***"]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testMineSurroundedBySpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["   ", " * ", "   "]
    let output = ["111", "1*1", "111"]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testSpaceSurroundedByMines() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["***", "* *", "***"]
    let output = ["***", "*8*", "***"]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testHorizontalLine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" * * "]
    let output = ["1*2*1"]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testHorizontalLineMinesAtEdges() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["*   *"]
    let output = ["*1 1*"]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testVerticalLine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" ", "*", " ", "*", " "]
    let output = ["1", "*", "2", "*", "1"]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testVerticalLineMinesAtEdges() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["*", " ", " ", " ", "*"]
    let output = ["*", "1", " ", "1", "*"]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testCross() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["  *  ", "  *  ", "*****", "  *  ", "  *  "]
    let output = [" 2*2 ", "25*52", "*****", "25*52", " 2*2 "]
    XCTAssertEqual(output, try! Board(input).transform())
  }

  func testLargeMinefield() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" *  * ", "  *   ", "    * ", "   * *", " *  * ", "      "]
    let output = ["1*22*1", "12*322", " 123*2", "112*4*", "1*22*2", "111111"]
    XCTAssertEqual(output, try! Board(input).transform())
  }
}
