import XCTest

@testable import PrimeFactors

class PrimeFactorsTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testNoFactors() {
    XCTAssertEqual(primeFactors(1), [])
  }

  func testPrimeNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(2), [2])
  }

  func testAnotherPrimeNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(3), [3])
  }

  func testSquareOfAPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(9), [3, 3])
  }

  func testProductOfFirstPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(4), [2, 2])
  }

  func testCubeOfAPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(8), [2, 2, 2])
  }

  func testProductOfSecondPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(27), [3, 3, 3])
  }

  func testProductOfThirdPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(625), [5, 5, 5, 5])
  }

  func testProductOfFirstAndSecondPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(6), [2, 3])
  }

  func testProductOfPrimesAndNonPrimes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(12), [2, 2, 3])
  }

  func testProductOfPrimes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(901255), [5, 17, 23, 461])
  }

  func testFactorsIncludeALargePrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(primeFactors(93_819_012_551), [11, 9539, 894119])
  }
}
