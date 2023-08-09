import XCTest

@testable import Transpose

class TransposeTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyString() {
    XCTAssertEqual(Transpose.transpose([]), [])
  }

  func testTwoCharactersInARow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Transpose.transpose(["A1"]), ["A", "1"])
  }

  func testTwoCharactersInAColumn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Transpose.transpose(["A", "1"]), ["A1"])
  }

  func testSimple() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Transpose.transpose(["ABC", "123"]), ["A1", "B2", "C3"])
  }

  func testSingleLine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Transpose.transpose(["Single line."]),
      ["S", "i", "n", "g", "l", "e", " ", "l", "i", "n", "e", "."])
  }

  func testFirstLineLongerThanSecondLine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Transpose.transpose(["The fourth line.", "The fifth line."]),
      [
        "TT", "hh", "ee", "  ", "ff", "oi", "uf", "rt", "th", "h ", " l", "li", "in", "ne", "e.",
        ".",
      ])
  }

  func testSecondLineLongerThanFirstLine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Transpose.transpose(["The first line.", "The second line."]),
      [
        "TT", "hh", "ee", "  ", "fs", "ie", "rc", "so", "tn", " d", "l ", "il", "ni", "en", ".e",
        " .",
      ])
  }

  func testMixedLineLength() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Transpose.transpose(["The longest line.", "A long line.", "A longer line.", "A line."]),
      [
        "TAAA", "h   ", "elll", " ooi", "lnnn", "ogge", "n e.", "glr", "ei ", "snl", "tei", " .n",
        "l e", "i .", "n", "e", ".",
      ])
  }

  func testSquare() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Transpose.transpose(["HEART", "EMBER", "ABUSE", "RESIN", "TREND"]),
      ["HEART", "EMBER", "ABUSE", "RESIN", "TREND"])
  }

  func testRectangle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Transpose.transpose(["FRACTURE", "OUTLINED", "BLOOMING", "SEPTETTE"]),
      ["FOBS", "RULE", "ATOP", "CLOT", "TIME", "UNIT", "RENT", "EDGE"])
  }

  func testTriangle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Transpose.transpose(["T", "EE", "AAA", "SSSS", "EEEEE", "RRRRRR"]),
      ["TEASER", " EASER", "  ASER", "   SER", "    ER", "     R"])
  }

  func testJaggedTriangle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Transpose.transpose(["11", "2", "3333", "444", "555555", "66666"]),
      ["123456", "1 3456", "  3456", "  3 56", "    56", "    5"])
  }
}
