import Testing
import Foundation

@testable import Chessboard

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "true"]) ?? false

@Suite struct ChessboardTests {
  func generateBoard() -> [String] {
    var board = [String]()
    let files2 = ["A", "B", "C", "D", "E", "F", "G", "H"]
    for rank in 1...8 {
      for file in files2 {
        board.append("\(rank)\(file)")
      }
    }
    return board
  }

  @Test("that there is a 8 correct ranks") 
  func testRanks() {
    let expected = 1...8
    #expect(ranks == expected)
  }

  @Test("that there is a 8 correct files", .enabled(if: RUNALL))
  func testFiles() {
    let expected = "A"..."H"
    #expect(files == expected)
  }

  @Test("that it returns true when given a valid square", .enabled(if: RUNALL))
  func testValidSquare() {
    let rank = 1
    let file = "A"
    #expect(isValidSquare(rank: rank, file: file))
  }

  @Test("that it returns true for another valid square", .enabled(if: RUNALL))
  func testAnotherValidSquare() {
    let rank = 8
    let file = "H"
    #expect(isValidSquare(rank: rank, file: file))
  }

  @Test("that it returns false when rank is out of range", .enabled(if: RUNALL))
  func testRankOutOfRange() {
    let rank = 9
    let file = "B"
    #expect(!isValidSquare(rank: rank, file: file))
  }

  @Test("that it returns false when file is out of range", .enabled(if: RUNALL))
  func testFileOutOfRange() {
    let rank = 1
    let file = "I"
    #expect(!isValidSquare(rank: rank, file: file))
  }

  @Test("that it returns false when rank is less than one", .enabled(if: RUNALL))
  func testRankLessThanOne() {
    let rank = 0
    let file = "A"
    #expect(!isValidSquare(rank: rank, file: file))
  }

  @Test("that is returns correct first row", .enabled(if: RUNALL))
  func testFirstRow() {
    let board = generateBoard()
    let expected = ["1A", "1B", "1C", "1D", "1E", "1F", "1G", "1H"]
    #expect(getRow(board, rank: 1) == expected)
  }

  @Test("that is returns correct last row", .enabled(if: RUNALL))
  func testLastRow() {
    let board = generateBoard()
    let expected = ["8A", "8B", "8C", "8D", "8E", "8F", "8G", "8H"]
    #expect(getRow(board, rank: 8) == expected)
  }

  @Test("that is returns correct middle row", .enabled(if: RUNALL))
  func testMiddleRow() {
    let board = generateBoard()
    let expected = ["4A", "4B", "4C", "4D", "4E", "4F", "4G", "4H"]
    #expect(getRow(board, rank: 4) == expected)
  }
}
