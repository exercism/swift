import Foundation
import Testing

@testable import FlowerField

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct FlowerFieldTests {

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

  @Test("no flowers", .enabled(if: RUNALL))
  func testNoFlowers() {
    let input = ["   ", "   ", "   "]
    let output = ["   ", "   ", "   "]
    #expect(Board(input).transform() == output)
  }

  @Test("garden full of flowers", .enabled(if: RUNALL))
  func testGardenFullOfFlowers() {
    let input = ["***", "***", "***"]
    let output = ["***", "***", "***"]
    #expect(Board(input).transform() == output)
  }

  @Test("flower surrounded by spaces", .enabled(if: RUNALL))
  func testFlowerSurroundedBySpaces() {
    let input = ["   ", " * ", "   "]
    let output = ["111", "1*1", "111"]
    #expect(Board(input).transform() == output)
  }

  @Test("space surrounded by flowers", .enabled(if: RUNALL))
  func testSpaceSurroundedByFlowers() {
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

  @Test("horizontal line, flowers at edges", .enabled(if: RUNALL))
  func testHorizontalLineFlowersAtEdges() {
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

  @Test("vertical line, flowers at edges", .enabled(if: RUNALL))
  func testVerticalLineFlowersAtEdges() {
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

  @Test("large garden", .enabled(if: RUNALL))
  func testLargeGarden() {
    let input = [" *  * ", "  *   ", "    * ", "   * *", " *  * ", "      "]
    let output = ["1*22*1", "12*322", " 123*2", "112*4*", "1*22*2", "111111"]
    #expect(Board(input).transform() == output)
  }
}
