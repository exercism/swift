import Foundation
import Testing

@testable import PerfectNumbers

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PerfectNumbersTests {

  @Test("Smallest perfect number is classified correctly")
  func testSmallestPerfectNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 6) == .perfect)
  }

  @Test("Medium perfect number is classified correctly", .enabled(if: RUNALL))
  func testMediumPerfectNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 28) == .perfect)
  }

  @Test("Large perfect number is classified correctly", .enabled(if: RUNALL))
  func testLargePerfectNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 33_550_336) == .perfect)
  }

  @Test("Smallest abundant number is classified correctly", .enabled(if: RUNALL))
  func testSmallestAbundantNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 12) == .abundant)
  }

  @Test("Medium abundant number is classified correctly", .enabled(if: RUNALL))
  func testMediumAbundantNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 30) == .abundant)
  }

  @Test("Large abundant number is classified correctly", .enabled(if: RUNALL))
  func testLargeAbundantNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 33_550_335) == .abundant)
  }

  @Test("Smallest prime deficient number is classified correctly", .enabled(if: RUNALL))
  func testSmallestPrimeDeficientNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 2) == .deficient)
  }

  @Test("Smallest non-prime deficient number is classified correctly", .enabled(if: RUNALL))
  func testSmallestNonPrimeDeficientNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 4) == .deficient)
  }

  @Test("Medium deficient number is classified correctly", .enabled(if: RUNALL))
  func testMediumDeficientNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 32) == .deficient)
  }

  @Test("Large deficient number is classified correctly", .enabled(if: RUNALL))
  func testLargeDeficientNumberIsClassifiedCorrectly() {
    #expect(try! classify(number: 33_550_337) == .deficient)
  }

  @Test("Edge case (no factors other than itself) is classified correctly", .enabled(if: RUNALL))
  func testEdgeCaseNoFactorsOtherThanItselfIsClassifiedCorrectly() {
    #expect(try! classify(number: 1) == .deficient)
  }

  @Test("Zero is rejected (as it is not a positive integer)", .enabled(if: RUNALL))
  func testZeroIsRejectedAsItIsNotAPositiveInteger() {
    #expect(throws: ClassificationError.invalidInput) {
      try classify(number: 0)
    }
  }

  @Test("Negative integer is rejected (as it is not a positive integer)", .enabled(if: RUNALL))
  func testNegativeIntegerIsRejectedAsItIsNotAPositiveInteger() {
    #expect(throws: ClassificationError.invalidInput) {
      try classify(number: -1)
    }
  }
}
