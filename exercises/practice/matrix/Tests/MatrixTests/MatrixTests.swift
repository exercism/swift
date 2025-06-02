import Foundation
import Testing

@testable import Matrix

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct MatrixTests {

  @Test("extract row from one number matrix")
  func testExtractRowFromOneNumberMatrix() {
    let matrix = Matrix("1")
    #expect([1] == matrix.rows[0])
  }

  @Test("can extract row", .enabled(if: RUNALL))
  func testCanExtractRow() {
    let matrix = Matrix("1 2\n3 4")
    #expect([3, 4] == matrix.rows[1])
  }

  @Test("extract row where numbers have different widths", .enabled(if: RUNALL))
  func testExtractRowWhereNumbersHaveDifferentWidths() {
    let matrix = Matrix("1 2\n10 20")
    #expect([10, 20] == matrix.rows[1])
  }

  @Test("can extract row from non-square matrix with no corresponding column", .enabled(if: RUNALL))
  func testCanExtractRowFromNonSquareMatrixWithNoCorrespondingColumn() {
    let matrix = Matrix("1 2 3\n4 5 6\n7 8 9\n8 7 6")
    #expect([8, 7, 6] == matrix.rows[3])
  }

  @Test("extract column from one number matrix", .enabled(if: RUNALL))
  func testExtractColumnFromOneNumberMatrix() {
    let matrix = Matrix("1")
    #expect([1] == matrix.columns[0])
  }

  @Test("can extract column", .enabled(if: RUNALL))
  func testCanExtractColumn() {
    let matrix = Matrix("1 2 3\n4 5 6\n7 8 9")
    #expect([3, 6, 9] == matrix.columns[2])
  }

  @Test("can extract column from non-square matrix with no corresponding row", .enabled(if: RUNALL))
  func testCanExtractColumnFromNonSquareMatrixWithNoCorrespondingRow() {
    let matrix = Matrix("1 2 3 4\n5 6 7 8\n9 8 7 6")
    #expect([4, 8, 6] == matrix.columns[3])
  }

  @Test("extract column where numbers have different widths", .enabled(if: RUNALL))
  func testExtractColumnWhereNumbersHaveDifferentWidths() {
    let matrix = Matrix("89 1903 3\n18 3 1\n9 4 800")
    #expect([1903, 3, 4] == matrix.columns[1])
  }
}
