import XCTest

@testable import Pangram

class PangramTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptySentence() {
    XCTAssertFalse(isPangram(""))
  }

  func testPerfectLowerCase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isPangram("abcdefghijklmnopqrstuvwxyz"))
  }

  func testOnlyLowerCase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isPangram("the quick brown fox jumps over the lazy dog"))
  }

  func testMissingTheLetterX() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isPangram("a quick movement of the enemy will jeopardize five gunboats"))
  }

  func testMissingTheLetterH() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isPangram("five boxing wizards jump quickly at it"))
  }

  func testWithUnderscores() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"))
  }

  func testWithNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"))
  }

  func testMissingLettersReplacedByNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))
  }

  func testMixedCaseAndPunctuation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isPangram("\"Five quacking Zephyrs jolt my wax bed.\""))
  }

  func testAMAndAMAre26DifferentCharactersButNotAPangram() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isPangram("abcdefghijklm ABCDEFGHIJKLM"))
  }
}
