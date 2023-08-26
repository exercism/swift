import XCTest

@testable import PascalsTriangle

class PascalsTriangleTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testZeroRows() {
    XCTAssertEqual(pascalsTriangle(rows: 0), [])
  }

  func testSingleRow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(pascalsTriangle(rows: 1), [[1]])
  }

  func testTwoRows() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(pascalsTriangle(rows: 2), [[1], [1, 1]])
  }

  func testThreeRows() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(pascalsTriangle(rows: 3), [[1], [1, 1], [1, 2, 1]])
  }

  func testFourRows() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(pascalsTriangle(rows: 4), [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]])
  }

  func testFiveRows() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      pascalsTriangle(rows: 5), [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]])
  }

  func testSixRows() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      pascalsTriangle(rows: 6),
      [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]])
  }

  func testTenRows() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      pascalsTriangle(rows: 10),
      [
        [1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1],
        [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1],
        [1, 9, 36, 84, 126, 126, 84, 36, 9, 1],
      ])
  }
}
