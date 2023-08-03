import XCTest

@testable import MatchingBrackets

class MatchingBracketsTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testPairedSquareBrackets() {
    XCTAssertTrue(MatchingBrackets.paired(text: "[]"))
  }

  func testEmptyString() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(MatchingBrackets.paired(text: ""))
  }

  func testUnpairedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "[["))
  }

  func testWrongOrderedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "}{"))
  }

  func testWrongClosingBracket() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "{]"))
  }

  func testPairedWithWhitespace() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(MatchingBrackets.paired(text: "{ }"))
  }

  func testPartiallyPairedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "{[])"))
  }

  func testSimpleNestedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(MatchingBrackets.paired(text: "{[]}"))
  }

  func testSeveralPairedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(MatchingBrackets.paired(text: "{}[]"))
  }

  func testPairedAndNestedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(MatchingBrackets.paired(text: "([{}({}[])])"))
  }

  func testUnopenedClosingBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "{[)][]}"))
  }

  func testUnpairedAndNestedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "([{])"))
  }

  func testPairedAndWrongNestedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "[({]})"))
  }

  func testPairedAndWrongNestedBracketsButInnermostAreCorrect() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "[({}])"))
  }

  func testPairedAndIncompleteBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "{}["))
  }

  func testTooManyClosingBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "[]]"))
  }

  func testEarlyUnexpectedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: ")()"))
  }

  func testEarlyMismatchedBrackets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(MatchingBrackets.paired(text: "{)()"))
  }

  func testMathExpression() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(MatchingBrackets.paired(text: "(((185 + 223.85) * 15) - 543)/2"))
  }

  func testComplexLatexExpression() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(
      MatchingBrackets.paired(
        text:
          "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
      ))
  }
}
