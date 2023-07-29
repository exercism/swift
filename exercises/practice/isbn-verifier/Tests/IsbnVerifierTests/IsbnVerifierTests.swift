import XCTest

@testable import IsbnVerifier

class IsbnVerifierTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testValidIsbn() {
    XCTAssertTrue(IsbnVerifier.isValid("3-598-21508-8"))
  }

  func testInvalidIsbnCheckDigit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3-598-21508-9"))
  }

  func testValidIsbnWithACheckDigitOf10() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(IsbnVerifier.isValid("3-598-21507-X"))
  }

  func testCheckDigitIsACharacterOtherThanX() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3-598-21507-A"))
  }

  func testInvalidCheckDigitInIsbnIsNotTreatedAsZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("4-598-21507-B"))
  }

  func testInvalidCharacterInIsbnIsNotTreatedAsZero() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3-598-P1581-X"))
  }

  func testXIsOnlyValidAsACheckDigit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3-598-2X507-9"))
  }

  func testValidIsbnWithoutSeparatingDashes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(IsbnVerifier.isValid("3598215088"))
  }

  func testIsbnWithoutSeparatingDashesAndXAsCheckDigit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(IsbnVerifier.isValid("359821507X"))
  }

  func testIsbnWithoutCheckDigitAndDashes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("359821507"))
  }

  func testTooLongIsbnAndNoDashes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3598215078X"))
  }

  func testTooShortIsbn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("00"))
  }

  func testIsbnWithoutCheckDigit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3-598-21507"))
  }

  func testCheckDigitOfXShouldNotBeUsedFor0() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3-598-21515-X"))
  }

  func testEmptyIsbn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid(""))
  }

  func testInputIs9Characters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("134456729"))
  }

  func testInvalidCharactersAreNotIgnoredAfterCheckingLength() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3132P34035"))
  }

  func testInvalidCharactersAreNotIgnoredBeforeCheckingLength() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("3598P215088"))
  }

  func testInputIsTooLongButContainsAValidIsbn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(IsbnVerifier.isValid("98245726788"))
  }
}
