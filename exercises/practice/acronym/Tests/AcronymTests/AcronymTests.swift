import XCTest

@testable import Acronym

class AcronymTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testBasic() {
    XCTAssertEqual("PNG", Acronym.abbreviate("Portable Network Graphics"))
  }

  func testLowercaseWords() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("ROR", Acronym.abbreviate("Ruby on Rails"))
  }

  func testPunctuation() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("FIFO", Acronym.abbreviate("First In, First Out"))
  }

  func testAllCapsWord() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("GIMP", Acronym.abbreviate("GNU Image Manipulation Program"))
  }

  func testPunctuationWithoutWhitespace() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("CMOS", Acronym.abbreviate("Complementary metal-oxide semiconductor"))
  }

  func testVeryLongAbbreviation() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      "ROTFLSHTMDCOALM",
      Acronym.abbreviate(
        "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"))
  }

  func testConsecutiveDelimiters() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("SIMUFTA", Acronym.abbreviate("Something - I made up from thin air"))
  }

  func testApostrophes() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("HC", Acronym.abbreviate("Halley's Comet"))
  }

  func testUnderscoreEmphasis() {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("TRNT", Acronym.abbreviate("The Road _Not_ Taken"))
  }
}
