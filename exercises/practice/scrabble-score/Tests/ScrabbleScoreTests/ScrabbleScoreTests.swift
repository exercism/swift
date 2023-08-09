import XCTest

@testable import ScrabbleScore

class ScrabbleScoreTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testLowercaseLetter() {
    XCTAssertEqual(score("a"), 1)
  }

  func testUppercaseLetter() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("A"), 1)
  }

  func testValuableLetter() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("f"), 4)
  }

  func testShortWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("at"), 2)
  }

  func testShortValuableWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("zoo"), 12)
  }

  func testMediumWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("street"), 6)
  }

  func testMediumValuableWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("quirky"), 22)
  }

  func testLongMixedCaseWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("OxyphenButazone"), 41)
  }

  func testEnglishLikeWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("pinata"), 8)
  }

  func testEmptyInput() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score(""), 0)
  }

  func testEntireAlphabetAvailable() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(score("abcdefghijklmnopqrstuvwxyz"), 87)
  }
}
