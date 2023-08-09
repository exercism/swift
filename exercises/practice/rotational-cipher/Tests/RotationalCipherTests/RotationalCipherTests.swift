import XCTest

@testable import RotationalCipher

class RotationalCipherTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testRotateABy0SameOutputAsInput() {
    XCTAssertEqual(rotateCipher("a", shift: 0), "a")
  }

  func testRotateABy1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(rotateCipher("a", shift: 1), "b")
  }

  func testRotateABy26SameOutputAsInput() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(rotateCipher("a", shift: 26), "a")
  }

  func testRotateMBy13() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(rotateCipher("m", shift: 13), "z")
  }

  func testRotateNBy13WithWrapAroundAlphabet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(rotateCipher("n", shift: 13), "a")
  }

  func testRotateCapitalLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(rotateCipher("OMG", shift: 5), "TRL")
  }

  func testRotateSpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(rotateCipher("O M G", shift: 5), "T R L")
  }

  func testRotateNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(rotateCipher("Testing 1 2 3 testing", shift: 4), "Xiwxmrk 1 2 3 xiwxmrk")
  }

  func testRotatePunctuation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(rotateCipher("Let's eat, Grandma!", shift: 21), "Gzo'n zvo, Bmviyhv!")
  }

  func testRotateAllLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      rotateCipher("The quick brown fox jumps over the lazy dog.", shift: 13),
      "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
  }
}
