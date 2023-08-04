import XCTest

@testable import Isogram

class IsogramTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyString() {
    XCTAssertTrue(isIsogram(""))
  }

  func testIsogramWithOnlyLowerCaseCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isIsogram("isogram"))
  }

  func testWordWithOneDuplicatedCharacter() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isIsogram("eleven"))
  }

  func testWordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isIsogram("zzyzx"))
  }

  func testLongestReportedEnglishIsogram() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isIsogram("subdermatoglyphic"))
  }

  func testWordWithDuplicatedCharacterInMixedCase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isIsogram("Alphabet"))
  }

  func testWordWithDuplicatedCharacterInMixedCaseLowercaseFirst() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isIsogram("alphAbet"))
  }

  func testHypotheticalIsogrammicWordWithHyphen() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isIsogram("thumbscrew-japingly"))
  }

  func testHypotheticalWordWithDuplicatedCharacterFollowingHyphen() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isIsogram("thumbscrew-jappingly"))
  }

  func testIsogramWithDuplicatedHyphen() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isIsogram("six-year-old"))
  }

  func testMadeUpNameThatIsAnIsogram() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isIsogram("Emily Jung Schwartzkopf"))
  }

  func testDuplicatedCharacterInTheMiddle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isIsogram("accentor"))
  }

  func testSameFirstAndLastCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isIsogram("angola"))
  }

  func testWordWithDuplicatedCharacterAndWithTwoHyphens() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isIsogram("up-to-date"))
  }
}
