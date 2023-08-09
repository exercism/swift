import XCTest

@testable import SumOfMultiples

class SumOfMultiplesTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testNoMultiplesWithinLimit() {
    XCTAssertEqual(toLimit(1, inMultiples: [3, 5]), 0)
  }

  func testOneFactorHasMultiplesWithinLimit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(4, inMultiples: [3, 5]), 3)
  }

  func testMoreThanOneMultipleWithinLimit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(7, inMultiples: [3]), 9)
  }

  func testMoreThanOneFactorWithMultiplesWithinLimit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(10, inMultiples: [3, 5]), 23)
  }

  func testEachMultipleIsOnlyCountedOnce() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(100, inMultiples: [3, 5]), 2318)
  }

  func testAMuchLargerLimit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(1000, inMultiples: [3, 5]), 233168)
  }

  func testThreeFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(20, inMultiples: [7, 13, 17]), 51)
  }

  func testFactorsNotRelativelyPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(15, inMultiples: [4, 6]), 30)
  }

  func testSomePairsOfFactorsRelativelyPrimeAndSomeNot() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(150, inMultiples: [5, 6, 8]), 4419)
  }

  func testOneFactorIsAMultipleOfAnother() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(51, inMultiples: [5, 25]), 275)
  }

  func testMuchLargerFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(10000, inMultiples: [43, 47]), 2_203_160)
  }

  func testAllNumbersAreMultiplesOf1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(100, inMultiples: [1]), 4950)
  }

  func testNoFactorsMeansAnEmptySum() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(10000, inMultiples: []), 0)
  }

  func testTheOnlyMultipleOf0Is0() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(1, inMultiples: [0]), 0)
  }

  func testTheFactor0DoesNotAffectTheSumOfMultiplesOfOtherFactors() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(4, inMultiples: [3, 0]), 3)
  }

  func testSolutionsUsingIncludeExcludeMustExtendToCardinalityGreaterThan3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(toLimit(10000, inMultiples: [2, 3, 5, 7, 11]), 39_614_537)
  }
}
