import XCTest

@testable import NucleotideCount

class NucleotideCountTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyStrand() {
    let dna = try! DNA(strand: "")
    let results = dna.counts()
    let expected = ["A": 0, "C": 0, "G": 0, "T": 0]
    XCTAssertEqual(results, expected)
  }

  func testCanCountOneNucleotideInSingleCharacterInput() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let dna = try! DNA(strand: "G")
    let results = dna.counts()
    let expected = ["A": 0, "C": 0, "G": 1, "T": 0]
    XCTAssertEqual(results, expected)
  }

  func testStrandWithRepeatedNucleotide() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let dna = try! DNA(strand: "GGGGGGG")
    let results = dna.counts()
    let expected = ["A": 0, "C": 0, "G": 7, "T": 0]
    XCTAssertEqual(results, expected)
  }

  func testStrandWithMultipleNucleotides() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let dna = try! DNA(
      strand: "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
    let results = dna.counts()
    let expected = ["A": 20, "C": 12, "G": 17, "T": 21]
    XCTAssertEqual(results, expected)
  }

  func testStrandWithInvalidNucleotides() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try DNA(strand: "AGXXACT")) { error in
      XCTAssertEqual(error as? NucleotideCountErrors, NucleotideCountErrors.invalidNucleotide)
    }
  }
}
