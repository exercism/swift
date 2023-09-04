import XCTest

@testable import PerfectNumbers

class PerfectNumbersTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testSmallestPerfectNumberIsClassifiedCorrectly() {
    XCTAssertEqual(try! classify(number: 6), .perfect)
  }

  func testMediumPerfectNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 28), .perfect)
  }

  func testLargePerfectNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 33_550_336), .perfect)
  }

  func testSmallestAbundantNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 12), .abundant)
  }

  func testMediumAbundantNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 30), .abundant)
  }

  func testLargeAbundantNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 33_550_335), .abundant)
  }

  func testSmallestPrimeDeficientNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 2), .deficient)
  }

  func testSmallestNonPrimeDeficientNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 4), .deficient)
  }

  func testMediumDeficientNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 32), .deficient)
  }

  func testLargeDeficientNumberIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 33_550_337), .deficient)
  }

  func testEdgeCaseNoFactorsOtherThanItselfIsClassifiedCorrectly() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 1), .deficient)
  }

  func testZeroIsRejectedAsItIsNotAPositiveInteger() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try classify(number: 0)) { error in
      XCTAssertEqual(error as? ClassificationError, .invalidInput)
    }
  }

  func testNegativeIntegerIsRejectedAsItIsNotAPositiveInteger() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try classify(number: -1)) { error in
      XCTAssertEqual(error as? ClassificationError, .invalidInput)
    }
  }
}
