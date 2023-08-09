import XCTest

@testable import RnaTranscription

class RnaTranscriptionTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyRnaSequence() {
    XCTAssertEqual(toRna(""), "")
  }

  func testRnaComplementOfCytosineIsGuanine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toRna("C"), "G")
  }

  func testRnaComplementOfGuanineIsCytosine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toRna("G"), "C")
  }

  func testRnaComplementOfThymineIsAdenine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toRna("T"), "A")
  }

  func testRnaComplementOfAdenineIsUracil() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toRna("A"), "U")
  }

  func testRnaComplement() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toRna("ACGTGGTCTTAA"), "UGCACCAGAAUU")
  }
}
