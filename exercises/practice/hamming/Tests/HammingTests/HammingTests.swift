import XCTest

@testable import Hamming

class HammingTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyStrands() {
    let result = try! Hamming.compute("", against: "")!
    let expected = 0
    XCTAssertEqual(expected, result)
  }

  func testSingleLetterIdenticalStrands() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result = try! Hamming.compute("A", against: "A")!
    let expected = 0
    XCTAssertEqual(expected, result)
  }

  func testSingleLetterDifferentStrands() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result = try! Hamming.compute("G", against: "T")!
    let expected = 1
    XCTAssertEqual(expected, result)
  }

  func testLongIdenticalStrands() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result = try! Hamming.compute("GGACTGAAATCTG", against: "GGACTGAAATCTG")!
    let expected = 0
    XCTAssertEqual(expected, result)
  }

  func testLongDifferentStrands() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result = try! Hamming.compute("GGACGGATTCTG", against: "AGGACGGATTCT")!
    let expected = 9
    XCTAssertEqual(expected, result)
  }

  func testDisallowFirstStrandLonger() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Hamming.compute("AATG", against: "AAA"))
  }

  func testDisallowSecondStrandLonger() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Hamming.compute("ATA", against: "AGTG"))
  }

  func testDisallowEmptyFirstStrand() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Hamming.compute("", against: "G"))
  }

  func testDisallowEmptySecondStrand() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Hamming.compute("G", against: ""))
  }
}
