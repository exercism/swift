import Foundation
import Testing

@testable import Hamming

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct HammingTests {

  @Test("empty strands")
  func testEmptyStrands() {
    let result = try! Hamming.compute("", against: "")!
    let expected = 0
    #expect(expected == result)
  }

  @Test("single letter identical strands", .enabled(if: RUNALL))
  func testSingleLetterIdenticalStrands() {
    let result = try! Hamming.compute("A", against: "A")!
    let expected = 0
    #expect(expected == result)
  }

  @Test("single letter different strands", .enabled(if: RUNALL))
  func testSingleLetterDifferentStrands() {
    let result = try! Hamming.compute("G", against: "T")!
    let expected = 1
    #expect(expected == result)
  }

  @Test("long identical strands", .enabled(if: RUNALL))
  func testLongIdenticalStrands() {
    let result = try! Hamming.compute("GGACTGAAATCTG", against: "GGACTGAAATCTG")!
    let expected = 0
    #expect(expected == result)
  }

  @Test("long different strands", .enabled(if: RUNALL))
  func testLongDifferentStrands() {
    let result = try! Hamming.compute("GGACGGATTCTG", against: "AGGACGGATTCT")!
    let expected = 9
    #expect(expected == result)
  }

  @Test("disallow first strand longer", .enabled(if: RUNALL))
  func testDisallowFirstStrandLonger() {
    #expect(throws: (any Error).self) { try Hamming.compute("AATG", against: "AAA") }
  }

  @Test("disallow second strand longer", .enabled(if: RUNALL))
  func testDisallowSecondStrandLonger() {
    #expect(throws: (any Error).self) { try Hamming.compute("ATA", against: "AGTG") }
  }

  @Test("disallow empty first strand", .enabled(if: RUNALL))
  func testDisallowEmptyFirstStrand() {
    #expect(throws: (any Error).self) { try Hamming.compute("", against: "G") }
  }

  @Test("disallow empty second strand", .enabled(if: RUNALL))
  func testDisallowEmptySecondStrand() {
    #expect(throws: (any Error).self) { try Hamming.compute("G", against: "") }
  }
}
