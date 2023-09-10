import XCTest

@testable import CryptoSquare

class CryptoSquareTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyPlaintextResultsInAnEmptyCiphertext() {
    XCTAssertEqual(cryptoSquare(text: ""), "")
  }

  func testNormalizationResultsInEmptyPlaintext() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(cryptoSquare(text: "... --- ..."), "")
  }

  func testLowercase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(cryptoSquare(text: "A"), "a")
  }

  func testRemoveSpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(cryptoSquare(text: "  b "), "b")
  }

  func testRemovePunctuation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(cryptoSquare(text: "@1,%!"), "1")
  }

  func test9CharacterPlaintextResultsIn3ChunksOf3Characters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(cryptoSquare(text: "This is fun!"), "tsf hiu isn")
  }

  func test8CharacterPlaintextResultsIn3ChunksTheLastOneWithATrailingSpace() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(cryptoSquare(text: "Chill out."), "clu hlt io ")
  }

  func test54CharacterPlaintextResultsIn7ChunksTheLastTwoWithTrailingSpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      cryptoSquare(text: "If man was meant to stay on the ground, god would have given us roots."),
      "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ")
  }
}
