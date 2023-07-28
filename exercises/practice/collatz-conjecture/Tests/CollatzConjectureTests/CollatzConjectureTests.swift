import XCTest

@testable import CollatzConjecture

class CollatzConjectureTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testZeroStepsForOne() {
    XCTAssertEqual(0, try! CollatzConjecture.steps(1))
  }

  func testDivideIfEven() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(4, try! CollatzConjecture.steps(16))
  }

  func testEvenAndOddSteps() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(9, try! CollatzConjecture.steps(12))
  }

  func testLargeNumberOfEvenAndOddSteps() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(152, try! CollatzConjecture.steps(1_000_000))
  }

  func testZeroIsAnError() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try CollatzConjecture.steps(0))
  }

  func testNegativeValueIsAnError() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try CollatzConjecture.steps(-15))
  }
}
