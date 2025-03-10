import Foundation
import Testing

@testable import PalindromeProducts

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PalindromeProductsTests {

  @Test("find the smallest palindrome from single digit factors")
  func testFindTheSmallestPalindromeFromSingleDigitFactors() {
    let smallest = try! PalindromeProducts.smallest(from: 1, to: 9)
    #expect(smallest.value == 1)
    #expect(smallest.factors == Set(arrayLiteral: [1, 1]))
  }

  @Test("find the largest palindrome from single digit factors", .enabled(if: RUNALL))
  func testFindTheLargestPalindromeFromSingleDigitFactors() {
    let largest = try! PalindromeProducts.largest(from: 1, to: 9)
    #expect(largest.value == 9)
    #expect(largest.factors == Set(arrayLiteral: [1, 9], [3, 3]))
  }

  @Test("find the smallest palindrome from double digit factors", .enabled(if: RUNALL))
  func testFindTheSmallestPalindromeFromDoubleDigitFactors() {
    let smallest = try! PalindromeProducts.smallest(from: 10, to: 99)
    #expect(smallest.value == 121)
    #expect(smallest.factors == Set(arrayLiteral: [11, 11]))
  }

  @Test("find the largest palindrome from double digit factors", .enabled(if: RUNALL))
  func testFindTheLargestPalindromeFromDoubleDigitFactors() {
    let largest = try! PalindromeProducts.largest(from: 10, to: 99)
    #expect(largest.value == 9009)
    #expect(largest.factors == Set(arrayLiteral: [91, 99]))
  }

  @Test("find the smallest palindrome from triple digit factors", .enabled(if: RUNALL))
  func testFindTheSmallestPalindromeFromTripleDigitFactors() {
    let smallest = try! PalindromeProducts.smallest(from: 100, to: 999)
    #expect(smallest.value == 10201)
    #expect(smallest.factors == Set(arrayLiteral: [101, 101]))
  }

  @Test("find the largest palindrome from triple digit factors", .enabled(if: RUNALL))
  func testFindTheLargestPalindromeFromTripleDigitFactors() {
    let largest = try! PalindromeProducts.largest(from: 100, to: 999)
    #expect(largest.value == 906609)
    #expect(largest.factors == Set(arrayLiteral: [913, 993]))
  }

  @Test("find the smallest palindrome from four digit factors", .enabled(if: RUNALL))
  func testFindTheSmallestPalindromeFromFourDigitFactors() {
    let smallest = try! PalindromeProducts.smallest(from: 1000, to: 9999)
    #expect(smallest.value == 1_002_001)
    #expect(smallest.factors == Set(arrayLiteral: [1001, 1001]))
  }

  @Test("find the largest palindrome from four digit factors", .enabled(if: RUNALL))
  func testFindTheLargestPalindromeFromFourDigitFactors() {
    let largest = try! PalindromeProducts.largest(from: 1000, to: 9999)
    #expect(largest.value == 99_000_099)
    #expect(largest.factors == Set(arrayLiteral: [9901, 9999]))
  }

  @Test("empty result for smallest if no palindrome in the range", .enabled(if: RUNALL))
  func testEmptyResultForSmallestIfNoPalindromeInTheRange() {
    let smallest = try! PalindromeProducts.smallest(from: 1002, to: 1003)
    #expect(smallest.value == nil)
    #expect(smallest.factors == Set())

  }

  @Test("empty result for largest if no palindrome in the range", .enabled(if: RUNALL))
  func testEmptyResultForLargestIfNoPalindromeInTheRange() {
    let largest = try! PalindromeProducts.largest(from: 15, to: 15)
    #expect(largest.value == nil)
    #expect(largest.factors == Set())
  }

  @Test("error result for smallest if min is more than max", .enabled(if: RUNALL))
  func testErrorResultForSmallestIfMinIsMoreThanMax() {
    #expect(throws: PalindromeError.invalidRange) {
      try PalindromeProducts.smallest(from: 10000, to: 1)
    }
  }

  @Test("error result for largest if min is more than max", .enabled(if: RUNALL))
  func testErrorResultForLargestIfMinIsMoreThanMax() {
    #expect(throws: PalindromeError.invalidRange) {
      try PalindromeProducts.largest(from: 2, to: 1)
    }
  }

  @Test("smallest product does not use the smallest factor", .enabled(if: RUNALL))
  func testSmallestProductDoesNotUseTheSmallestFactor() {
    let smallest = try! PalindromeProducts.smallest(from: 3215, to: 4000)
    #expect(smallest.value == 10_988_901)
    #expect(smallest.factors == Set(arrayLiteral: [3297, 3333]))
  }
}
