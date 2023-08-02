import XCTest

@testable import Isogram

class IsogramTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyString() {
    XCTAssertTrue(Isogram.isIsogram(""))
  }

  func testIsogramWithOnlyLowerCaseCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(Isogram.isIsogram("isogram"))
  }

  func testWordWithOneDuplicatedCharacter() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(Isogram.isIsogram("eleven"))
  }

  func testWordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(Isogram.isIsogram("zzyzx"))
  }

  func testLongestReportedEnglishIsogram() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(Isogram.isIsogram("subdermatoglyphic"))
  }

  func testWordWithDuplicatedCharacterInMixedCase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(Isogram.isIsogram("Alphabet"))
  }

  func testWordWithDuplicatedCharacterInMixedCaseLowercaseFirst() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(Isogram.isIsogram("alphAbet"))
  }

  func testHypotheticalIsogrammicWordWithHyphen() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(Isogram.isIsogram("thumbscrew-japingly"))
  }

  func testHypotheticalWordWithDuplicatedCharacterFollowingHyphen() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(Isogram.isIsogram("thumbscrew-jappingly"))
  }

  func testIsogramWithDuplicatedHyphen() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(Isogram.isIsogram("six-year-old"))
  }

  func testMadeUpNameThatIsAnIsogram() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(Isogram.isIsogram("Emily Jung Schwartzkopf"))
  }

  func testDuplicatedCharacterInTheMiddle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(Isogram.isIsogram("accentor"))
  }

  func testSameFirstAndLastCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(Isogram.isIsogram("angola"))
  }

  func testWordWithDuplicatedCharacterAndWithTwoHyphens() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(Isogram.isIsogram("up-to-date"))
  }
}
