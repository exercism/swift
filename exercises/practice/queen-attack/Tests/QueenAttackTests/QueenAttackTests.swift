import XCTest

@testable import QueenAttack

class QueenAttackTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testQueenWithAValidPosition() {
    let queen = try! Queen(row: 2, column: 2)
    XCTAssertEqual(queen.row, 2)
    XCTAssertEqual(queen.column, 2)
  }

  func testQueenMustHavePositiveRow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Queen(row: -2, column: 2)) { error in
      XCTAssertEqual(error as? QueenError, .inValidRow)
    }
  }

  func testQueenMustHaveRowOnBoard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Queen(row: 8, column: 4)) { error in
      XCTAssertEqual(error as? QueenError, .inValidRow)
    }
  }

  func testQueenMustHavePositiveColumn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Queen(row: 2, column: -2)) { error in
      XCTAssertEqual(error as? QueenError, .inValidColumn)
    }
  }

  func testQueenMustHaveColumnOnBoard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Queen(row: 4, column: 8)) { error in
      XCTAssertEqual(error as? QueenError, .inValidColumn)
    }
  }

  func testCannotAttack() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let queen = try! Queen(row: 2, column: 4)
    let otherQueen = try! Queen(row: 6, column: 6)
    XCTAssertFalse(queen.canAttack(other: otherQueen))
  }

  func testCanAttackOnSameRow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let queen = try! Queen(row: 2, column: 4)
    let otherQueen = try! Queen(row: 2, column: 6)
    XCTAssertTrue(queen.canAttack(other: otherQueen))
  }

  func testCanAttackOnSameColumn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let queen = try! Queen(row: 4, column: 5)
    let otherQueen = try! Queen(row: 2, column: 5)
    XCTAssertTrue(queen.canAttack(other: otherQueen))
  }

  func testCanAttackOnFirstDiagonal() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let queen = try! Queen(row: 2, column: 2)
    let otherQueen = try! Queen(row: 0, column: 4)
    XCTAssertTrue(queen.canAttack(other: otherQueen))
  }

  func testCanAttackOnSecondDiagonal() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let queen = try! Queen(row: 2, column: 2)
    let otherQueen = try! Queen(row: 3, column: 1)
    XCTAssertTrue(queen.canAttack(other: otherQueen))
  }

  func testCanAttackOnThirdDiagonal() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let queen = try! Queen(row: 2, column: 2)
    let otherQueen = try! Queen(row: 1, column: 1)
    XCTAssertTrue(queen.canAttack(other: otherQueen))
  }

  func testCanAttackOnFourthDiagonal() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let queen = try! Queen(row: 1, column: 7)
    let otherQueen = try! Queen(row: 0, column: 6)
    XCTAssertTrue(queen.canAttack(other: otherQueen))
  }

  func
    testCannotAttackIfFallingDiagonalsAreOnlyTheSameWhenReflectedAcrossTheLongestFallingDiagonal()
    throws
  {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let queen = try! Queen(row: 4, column: 1)
    let otherQueen = try! Queen(row: 2, column: 5)
    XCTAssertFalse(queen.canAttack(other: otherQueen))
  }
}
