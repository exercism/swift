import Foundation
import Testing

@testable import QueenAttack

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct QueenAttackTests {

  @Test("queen with a valid position")
  func testQueenWithAValidPosition() throws {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 2, column: 2)
      #expect(queen.row == 2)
      #expect(queen.column == 2)
    }
  }

  @Test("queen must have positive row", .enabled(if: RUNALL))
  func testQueenMustHavePositiveRow() throws {
    #expect(throws: QueenError.inValidRow) {
      try Queen(row: -2, column: 2)
    }
  }

  @Test("queen must have row on board", .enabled(if: RUNALL))
  func testQueenMustHaveRowOnBoard() throws {
    #expect(throws: QueenError.inValidRow) {
      try Queen(row: 8, column: 4)
    }
  }

  @Test("queen must have positive column", .enabled(if: RUNALL))
  func testQueenMustHavePositiveColumn() throws {
    #expect(throws: QueenError.inValidColumn) {
      try Queen(row: 2, column: -2)
    }
  }

  @Test("queen must have column on board", .enabled(if: RUNALL))
  func testQueenMustHaveColumnOnBoard() throws {
    #expect(throws: QueenError.inValidColumn) {
      try Queen(row: 4, column: 8)
    }
  }

  @Test("cannot attack", .enabled(if: RUNALL))
  func testCannotAttack() throws {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 2, column: 4)
      let otherQueen = try Queen(row: 6, column: 6)
      #expect(!queen.canAttack(other: otherQueen))
    }
  }

  @Test("can attack on same row", .enabled(if: RUNALL))
  func testCanAttackOnSameRow() throws {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 2, column: 4)
      let otherQueen = try Queen(row: 2, column: 6)
      #expect(queen.canAttack(other: otherQueen))
    }
  }

  @Test("can attack on same column", .enabled(if: RUNALL))
  func testCanAttackOnSameColumn() throws {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 4, column: 5)
      let otherQueen = try Queen(row: 2, column: 5)
      #expect(queen.canAttack(other: otherQueen))
    }
  }

  @Test("can attack on first diagonal", .enabled(if: RUNALL))
  func testCanAttackOnFirstDiagonal() throws {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 2, column: 2)
      let otherQueen = try Queen(row: 0, column: 4)
      #expect(queen.canAttack(other: otherQueen))
    }
  }

  @Test("can attack on second diagonal", .enabled(if: RUNALL))
  func testCanAttackOnSecondDiagonal() throws {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 2, column: 2)
      let otherQueen = try Queen(row: 3, column: 1)
      #expect(queen.canAttack(other: otherQueen))
    }
  }

  @Test("can attack on third diagonal", .enabled(if: RUNALL))
  func testCanAttackOnThirdDiagonal() throws {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 2, column: 2)
      let otherQueen = try Queen(row: 1, column: 1)
      #expect(queen.canAttack(other: otherQueen))
    }
  }

  @Test("can attack on fourth diagonal", .enabled(if: RUNALL))
  func testCanAttackOnFourthDiagonal() throws {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 1, column: 7)
      let otherQueen = try Queen(row: 0, column: 6)
      #expect(queen.canAttack(other: otherQueen))
    }
  }

  @Test(
    "cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal",
    .enabled(if: RUNALL))
  func
    testCannotAttackIfFallingDiagonalsAreOnlyTheSameWhenReflectedAcrossTheLongestFallingDiagonal()
    throws
  {
    #expect(throws: Never.self) {
      let queen = try Queen(row: 4, column: 1)
      let otherQueen = try Queen(row: 2, column: 5)
      #expect(!queen.canAttack(other: otherQueen))
    }
  }
}
