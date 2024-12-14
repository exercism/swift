import XCTest

@testable import ReverseString

class ReverseStringTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testAnEmptyString() {
    XCTAssertEqual(reverseString(""), "")
  }

  func testAWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(reverseString("robot"), "tobor")
  }

  func testACapitalizedWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(reverseString("Ramen"), "nemaR")
  }

  func testASentenceWithPunctuation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(reverseString("I'm hungry!"), "!yrgnuh m'I")
  }

  func testAPalindrome() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(reverseString("racecar"), "racecar")
  }

  func testAnEvenSizedWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(reverseString("drawer"), "reward")
  }
}
