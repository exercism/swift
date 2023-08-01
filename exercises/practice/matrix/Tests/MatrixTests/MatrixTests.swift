import XCTest

@testable import Matrix

class MatrixTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testExtractRowFromOneNumberMatrix() {
    let matrix = Matrix("1")
    XCTAssertEqual([1], matrix.rows[1])
  }

  func testCanExtractRow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let matrix = Matrix("1 2\n3 4")
    XCTAssertEqual([3, 4], matrix.rows[2])
  }

  func testExtractRowWhereNumbersHaveDifferentWidths() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let matrix = Matrix("1 2\n10 20")
    XCTAssertEqual([10, 20], matrix.rows[2])
  }

  func testCanExtractRowFromNonSquareMatrixWithNoCorrespondingColumn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let matrix = Matrix("1 2 3\n4 5 6\n7 8 9\n8 7 6")
    XCTAssertEqual([8, 7, 6], matrix.rows[4])
  }

  func testExtractColumnFromOneNumberMatrix() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let matrix = Matrix("1")
    XCTAssertEqual([1], matrix.columns[1])
  }

  func testCanExtractColumn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let matrix = Matrix("1 2 3\n4 5 6\n7 8 9")
    XCTAssertEqual([3, 6, 9], matrix.columns[3])
  }

  func testCanExtractColumnFromNonSquareMatrixWithNoCorrespondingRow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let matrix = Matrix("1 2 3 4\n5 6 7 8\n9 8 7 6")
    XCTAssertEqual([4, 8, 6], matrix.columns[4])
  }

  func testExtractColumnWhereNumbersHaveDifferentWidths() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let matrix = Matrix("89 1903 3\n18 3 1\n9 4 800")
    XCTAssertEqual([1903, 3, 4], matrix.columns[2])
  }
}
