import Foundation
import Testing

@testable import Minesweeper

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct MinesweeperTests {

  @Test("no rows")
  func testNoRows() {
    let input = [String]()
    let output = [String]()
    #expect(Board(input).transform() == output)
  }

  @Test("no columns", .enabled(if: RUNALL))
  func testNoColumns() {
    let input = [""]
    let output = [""]
    #expect(Board(input).transform() == output)
  }

  @Test("no mines", .enabled(if: RUNALL))
  func testNoMines() {
    let input = ["   ", "   ", "   "]
    let output = ["   ", "   ", "   "]
    #expect(Board(input).transform() == output)
  }

  @Test("minefield with only mines", .enabled(if: RUNALL))
  func testMinefieldWithOnlyMines() {
    let input = ["***", "***", "***"]
    let output = ["***", "***", "***"]
    #expect(Board(input).transform() == output)
  }

  @Test("mine surrounded by spaces", .enabled(if: RUNALL))
  func testMineSurroundedBySpaces() {
    let input = ["   ", " * ", "   "]
    let output = ["111", "1*1", "111"]
    #expect(Board(input).transform() == output)
  }

  @Test("space surrounded by mines", .enabled(if: RUNALL))
  func testSpaceSurroundedByMines() {
    let input = ["***", "* *", "***"]
    let output = ["***", "*8*", "***"]
    #expect(Board(input).transform() == output)
  }

  @Test("horizontal line", .enabled(if: RUNALL))
  func testHorizontalLine() {
    let input = [" * * "]
    let output = ["1*2*1"]
    #expect(Board(input).transform() == output)
  }

  @Test("horizontal line, mines at edges", .enabled(if: RUNALL))
  func testHorizontalLineMinesAtEdges() {
    let input = ["*   *"]
    let output = ["*1 1*"]
    #expect(Board(input).transform() == output)
  }

  @Test("vertical line", .enabled(if: RUNALL))
  func testVerticalLine() {
    let input = [" ", "*", " ", "*", " "]
    let output = ["1", "*", "2", "*", "1"]
    #expect(Board(input).transform() == output)
  }

  @Test("vertical line, mines at edges", .enabled(if: RUNALL))
  func testVerticalLineMinesAtEdges() {
    let input = ["*", " ", " ", " ", "*"]
    let output = ["*", "1", " ", "1", "*"]
    #expect(Board(input).transform() == output)
  }

  @Test("cross", .enabled(if: RUNALL))
  func testCross() {
    let input = ["  *  ", "  *  ", "*****", "  *  ", "  *  "]
    let output = [" 2*2 ", "25*52", "*****", "25*52", " 2*2 "]
    #expect(Board(input).transform() == output)
  }

  @Test("large minefield", .enabled(if: RUNALL))
  func testLargeMinefield() {
    let input = [" *  * ", "  *   ", "    * ", "   * *", " *  * ", "      "]
    let output = ["1*22*1", "12*322", " 123*2", "112*4*", "1*22*2", "111111"]
    #expect(Board(input).transform() == output)
  }
}
