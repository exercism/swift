import XCTest

@testable import PerfectNumbers

class PerfectNumbersTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testSmallestPerfectNumberIsClassifiedCorrectly1() {
    XCTAssertEqual(try! classify(number: 6), .perfect)
  }

  func testMediumPerfectNumberIsClassifiedCorrectly1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 28), .perfect)
  }

  func testLargePerfectNumberIsClassifiedCorrectly1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 33_550_336), .perfect)
  }

  func testSmallestAbundantNumberIsClassifiedCorrectly2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 12), .abundant)
  }

  func testMediumAbundantNumberIsClassifiedCorrectly2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 30), .abundant)
  }

  func testLargeAbundantNumberIsClassifiedCorrectly2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 33_550_335), .abundant)
  }

  func testSmallestPrimeDeficientNumberIsClassifiedCorrectly3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 2), .deficient)
  }

  func testSmallestNonPrimeDeficientNumberIsClassifiedCorrectly3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 4), .deficient)
  }

  func testMediumDeficientNumberIsClassifiedCorrectly3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 32), .deficient)
  }

  func testLargeDeficientNumberIsClassifiedCorrectly3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 33_550_337), .deficient)
  }

  func testEdgeCaseNoFactorsOtherThanItselfIsClassifiedCorrectly3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! classify(number: 1), .deficient)
  }

  func testZeroIsRejectedAsItIsNotAPositiveInteger4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try classify(number: 0)) { error in
      XCTAssertEqual(error as? ClassificationError, .invalidInput)
    }
  }

  func testNegativeIntegerIsRejectedAsItIsNotAPositiveInteger4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try classify(number: -1)) { error in
      XCTAssertEqual(error as? ClassificationError, .invalidInput)
    }
  }
}
