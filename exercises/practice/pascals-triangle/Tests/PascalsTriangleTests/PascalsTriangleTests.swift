import Foundation
import Testing

@testable import PascalsTriangle

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PascalsTriangleTests {

  @Test("zero rows")
  func testZeroRows() {
    #expect(pascalsTriangle(rows: 0) == [])
  }

  @Test("single row", .enabled(if: RUNALL))
  func testSingleRow() {
    #expect(pascalsTriangle(rows: 1) == [[1]])
  }

  @Test("two rows", .enabled(if: RUNALL))
  func testTwoRows() {
    #expect(pascalsTriangle(rows: 2) == [[1], [1, 1]])
  }

  @Test("three rows", .enabled(if: RUNALL))
  func testThreeRows() {
    #expect(pascalsTriangle(rows: 3) == [[1], [1, 1], [1, 2, 1]])
  }

  @Test("four rows", .enabled(if: RUNALL))
  func testFourRows() {
    #expect(pascalsTriangle(rows: 4) == [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]])
  }

  @Test("five rows", .enabled(if: RUNALL))
  func testFiveRows() {
    #expect(
      pascalsTriangle(rows: 5) == [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]])
  }

  @Test("six rows", .enabled(if: RUNALL))
  func testSixRows() {
    #expect(
      pascalsTriangle(rows: 6) == [
        [1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1],
      ])
  }

  @Test("ten rows", .enabled(if: RUNALL))
  func testTenRows() {
    #expect(
      pascalsTriangle(rows: 10) == [
        [1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1],
        [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1],
        [1, 9, 36, 84, 126, 126, 84, 36, 9, 1],
      ])
  }
}
