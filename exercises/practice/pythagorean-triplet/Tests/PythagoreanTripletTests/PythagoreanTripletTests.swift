import XCTest

@testable import PythagoreanTriplet

class PythagoreanTripletTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testTripletsWhoseSumIs12() {
    XCTAssertEqual(tripletsWithSum(12), [[3, 4, 5]])
  }

  func testTripletsWhoseSumIs108() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(tripletsWithSum(108), [[27, 36, 45]])
  }

  func testTripletsWhoseSumIs1000() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(tripletsWithSum(1000), [[200, 375, 425]])
  }

  func testNoMatchingTripletsFor1001() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(tripletsWithSum(1001), [])
  }

  func testReturnsAllMatchingTriplets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(tripletsWithSum(90), [[9, 40, 41], [15, 36, 39]])
  }

  func testSeveralMatchingTriplets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      tripletsWithSum(840),
      [
        [40, 399, 401], [56, 390, 394], [105, 360, 375], [120, 350, 370], [140, 336, 364],
        [168, 315, 357], [210, 280, 350], [240, 252, 348],
      ])
  }

  func testTripletsForLargeNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      tripletsWithSum(30000),
      [
        [1200, 14375, 14425], [1875, 14000, 14125], [5000, 12000, 13000], [6000, 11250, 12750],
        [7500, 10000, 12500],
      ])
  }
}
