import Foundation
import Testing

@testable import SumOfMultiples

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SumOfMultiplesTests {

  @Test("no multiples within limit")
  func testNoMultiplesWithinLimit() {
    #expect(toLimit(1, inMultiples: [3, 5]) == 0)
  }

  @Test("one factor has multiples within limit", .enabled(if: RUNALL))
  func testOneFactorHasMultiplesWithinLimit() {
    #expect(toLimit(4, inMultiples: [3, 5]) == 3)
  }

  @Test("more than one multiple within limit", .enabled(if: RUNALL))
  func testMoreThanOneMultipleWithinLimit() {
    #expect(toLimit(7, inMultiples: [3]) == 9)
  }

  @Test("more than one factor with multiples within limit", .enabled(if: RUNALL))
  func testMoreThanOneFactorWithMultiplesWithinLimit() {
    #expect(toLimit(10, inMultiples: [3, 5]) == 23)
  }

  @Test("each multiple is only counted once", .enabled(if: RUNALL))
  func testEachMultipleIsOnlyCountedOnce() {
    #expect(toLimit(100, inMultiples: [3, 5]) == 2318)
  }

  @Test("a much larger limit", .enabled(if: RUNALL))
  func testAMuchLargerLimit() {
    #expect(toLimit(1000, inMultiples: [3, 5]) == 233168)
  }

  @Test("three factors", .enabled(if: RUNALL))
  func testThreeFactors() {
    #expect(toLimit(20, inMultiples: [7, 13, 17]) == 51)
  }

  @Test("factors not relatively prime", .enabled(if: RUNALL))
  func testFactorsNotRelativelyPrime() {
    #expect(toLimit(15, inMultiples: [4, 6]) == 30)
  }

  @Test("some pairs of factors relatively prime and some not", .enabled(if: RUNALL))
  func testSomePairsOfFactorsRelativelyPrimeAndSomeNot() {
    #expect(toLimit(150, inMultiples: [5, 6, 8]) == 4419)
  }

  @Test("one factor is a multiple of another", .enabled(if: RUNALL))
  func testOneFactorIsAMultipleOfAnother() {
    #expect(toLimit(51, inMultiples: [5, 25]) == 275)
  }

  @Test("much larger factors", .enabled(if: RUNALL))
  func testMuchLargerFactors() {
    #expect(toLimit(10000, inMultiples: [43, 47]) == 2_203_160)
  }

  @Test("all numbers are multiples of 1", .enabled(if: RUNALL))
  func testAllNumbersAreMultiplesOf1() {
    #expect(toLimit(100, inMultiples: [1]) == 4950)
  }

  @Test("no factors means an empty sum", .enabled(if: RUNALL))
  func testNoFactorsMeansAnEmptySum() {
    #expect(toLimit(10000, inMultiples: []) == 0)
  }

  @Test("the only multiple of 0 is 0", .enabled(if: RUNALL))
  func testTheOnlyMultipleOf0Is0() {
    #expect(toLimit(1, inMultiples: [0]) == 0)
  }

  @Test("the factor 0 does not affect the sum of multiples of other factors", .enabled(if: RUNALL))
  func testTheFactor0DoesNotAffectTheSumOfMultiplesOfOtherFactors() {
    #expect(toLimit(4, inMultiples: [3, 0]) == 3)
  }

  @Test(
    "solutions using include-exclude must extend to cardinality greater than 3",
    .enabled(if: RUNALL))
  func testSolutionsUsingIncludeExcludeMustExtendToCardinalityGreaterThan3() {
    #expect(toLimit(10000, inMultiples: [2, 3, 5, 7, 11]) == 39_614_537)
  }
}
