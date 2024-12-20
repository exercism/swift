import Foundation
import Testing

@testable import NucleotideCount

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct NucleotideCountTests {

  @Test("empty strand")
  func testEmptyStrand() {
    let dna = try! DNA(strand: "")
    let results = dna.counts()
    let expected = ["A": 0, "C": 0, "G": 0, "T": 0]
    #expect(results == expected)
  }

  @Test("can count one nucleotide in single-character input", .enabled(if: RUNALL))
  func testCanCountOneNucleotideInSingleCharacterInput() {
    let dna = try! DNA(strand: "G")
    let results = dna.counts()
    let expected = ["A": 0, "C": 0, "G": 1, "T": 0]
    #expect(results == expected)
  }

  @Test("strand with repeated nucleotide", .enabled(if: RUNALL))
  func testStrandWithRepeatedNucleotide() {
    let dna = try! DNA(strand: "GGGGGGG")
    let results = dna.counts()
    let expected = ["A": 0, "C": 0, "G": 7, "T": 0]
    #expect(results == expected)
  }

  @Test("strand with multiple nucleotides", .enabled(if: RUNALL))
  func testStrandWithMultipleNucleotides() {
    let dna = try! DNA(
      strand: "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
    let results = dna.counts()
    let expected = ["A": 20, "C": 12, "G": 17, "T": 21]
    #expect(results == expected)
  }

  @Test("strand with invalid nucleotides", .enabled(if: RUNALL))
  func testStrandWithInvalidNucleotides() {
    #expect(throws: NucleotideCountErrors.invalidNucleotide) {
      try DNA(strand: "AGXXACT")
    }
  }
}
