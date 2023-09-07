import XCTest

@testable import PalindromeProducts

class PalindromeProductsTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testFindTheSmallestPalindromeFromSingleDigitFactors() {
    let smallest = try! PalindromeProducts.smallest(from: 1, to: 9)
    XCTAssertEqual(smallest.value, 1)
    XCTAssertEqual(smallest.factors, Set(arrayLiteral: [1, 1]))
  }

  func testFindTheLargestPalindromeFromSingleDigitFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let largest = try! PalindromeProducts.largest(from: 1, to: 9)
    XCTAssertEqual(largest.value, 9)
    XCTAssertEqual(largest.factors, Set(arrayLiteral: [1, 9], [3, 3]))
  }

  func testFindTheSmallestPalindromeFromDoubleDigitFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let smallest = try! PalindromeProducts.smallest(from: 10, to: 99)
    XCTAssertEqual(smallest.value, 121)
    XCTAssertEqual(smallest.factors, Set(arrayLiteral: [11, 11]))
  }

  func testFindTheLargestPalindromeFromDoubleDigitFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let largest = try! PalindromeProducts.largest(from: 10, to: 99)
    XCTAssertEqual(largest.value, 9009)
    XCTAssertEqual(largest.factors, Set(arrayLiteral: [91, 99]))
  }

  func testFindTheSmallestPalindromeFromTripleDigitFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let smallest = try! PalindromeProducts.smallest(from: 100, to: 999)
    XCTAssertEqual(smallest.value, 10201)
    XCTAssertEqual(smallest.factors, Set(arrayLiteral: [101, 101]))
  }

  func testFindTheLargestPalindromeFromTripleDigitFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let largest = try! PalindromeProducts.largest(from: 100, to: 999)
    XCTAssertEqual(largest.value, 906609)
    XCTAssertEqual(largest.factors, Set(arrayLiteral: [913, 993]))
  }

  func testFindTheSmallestPalindromeFromFourDigitFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let smallest = try! PalindromeProducts.smallest(from: 1000, to: 9999)
    XCTAssertEqual(smallest.value, 1_002_001)
    XCTAssertEqual(smallest.factors, Set(arrayLiteral: [1001, 1001]))
  }

  func testFindTheLargestPalindromeFromFourDigitFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let largest = try! PalindromeProducts.largest(from: 1000, to: 9999)
    XCTAssertEqual(largest.value, 99_000_099)
    XCTAssertEqual(largest.factors, Set(arrayLiteral: [9901, 9999]))
  }

  func testEmptyResultForSmallestIfNoPalindromeInTheRange() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let smallest = try! PalindromeProducts.smallest(from: 1002, to: 1003)
    XCTAssertNil(smallest.value)
    XCTAssertEqual(smallest.factors, Set())

  }

  func testEmptyResultForLargestIfNoPalindromeInTheRange() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let largest = try! PalindromeProducts.largest(from: 15, to: 15)
    XCTAssertNil(largest.value)
    XCTAssertEqual(largest.factors, Set())
  }

  func testErrorResultForSmallestIfMinIsMoreThanMax() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PalindromeProducts.smallest(from: 10000, to: 1)) { error in
      XCTAssertEqual(error as? PalindromeError, PalindromeError.invalidRange)
    }
  }

  func testErrorResultForLargestIfMinIsMoreThanMax() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PalindromeProducts.largest(from: 2, to: 1)) { error in
      XCTAssertEqual(error as? PalindromeError, PalindromeError.invalidRange)
    }
  }

  func testSmallestProductDoesNotUseTheSmallestFactor() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let smallest = try! PalindromeProducts.smallest(from: 3215, to: 4000)
    XCTAssertEqual(smallest.value, 10_988_901)
    XCTAssertEqual(smallest.factors, Set(arrayLiteral: [3297, 3333]))
  }
}
