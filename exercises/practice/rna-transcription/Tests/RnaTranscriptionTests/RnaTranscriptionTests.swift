import Foundation
import Testing

@testable import RnaTranscription

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct RnaTranscriptionTests {

  @Test("Empty RNA sequence")
  func testEmptyRnaSequence() {
    #expect(toRna("") == "")
  }

  @Test("RNA complement of cytosine is guanine", .enabled(if: RUNALL))
  func testRnaComplementOfCytosineIsGuanine() {
    #expect(toRna("C") == "G")
  }

  @Test("RNA complement of guanine is cytosine", .enabled(if: RUNALL))
  func testRnaComplementOfGuanineIsCytosine() {
    #expect(toRna("G") == "C")
  }

  @Test("RNA complement of thymine is adenine", .enabled(if: RUNALL))
  func testRnaComplementOfThymineIsAdenine() {
    #expect(toRna("T") == "A")
  }

  @Test("RNA complement of adenine is uracil", .enabled(if: RUNALL))
  func testRnaComplementOfAdenineIsUracil() {
    #expect(toRna("A") == "U")
  }

  @Test("RNA complement", .enabled(if: RUNALL))
  func testRnaComplement() {
    #expect(toRna("ACGTGGTCTTAA") == "UGCACCAGAAUU")
  }
}
