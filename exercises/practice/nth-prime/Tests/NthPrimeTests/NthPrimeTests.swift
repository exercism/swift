import XCTest

@testable import NthPrime

class NthPrimeTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testFirstPrime() {
    XCTAssertEqual(try! nthPrime(1), 2)
  }

  func testSecondPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! nthPrime(2), 3)
  }

  func testSixthPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! nthPrime(6), 13)
  }

  func testBigPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! nthPrime(10001), 104743)
  }

  func testThereIsNoZerothPrime() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try nthPrime(0)) { error in
      XCTAssertEqual(error as? PrimeError, PrimeError.noZerothPrime)
    }
  }
}
