import Foundation
import Testing

@testable import Transpose

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct TransposeTests {

  @Test("empty string")
  func testEmptyString() {
    #expect(Transpose.transpose([]) == [])
  }

  @Test("two characters in a row", .enabled(if: RUNALL))
  func testTwoCharactersInARow() {
    #expect(Transpose.transpose(["A1"]) == ["A", "1"])
  }

  @Test("two characters in a column", .enabled(if: RUNALL))
  func testTwoCharactersInAColumn() {
    #expect(Transpose.transpose(["A", "1"]) == ["A1"])
  }

  @Test("simple", .enabled(if: RUNALL))
  func testSimple() {
    #expect(Transpose.transpose(["ABC", "123"]) == ["A1", "B2", "C3"])
  }

  @Test("single line", .enabled(if: RUNALL))
  func testSingleLine() {
    #expect(
      Transpose.transpose(["Single line."]) == [
        "S", "i", "n", "g", "l", "e", " ", "l", "i", "n", "e", ".",
      ])
  }

  @Test("first line longer than second line", .enabled(if: RUNALL))
  func testFirstLineLongerThanSecondLine() {
    #expect(
      Transpose.transpose(["The fourth line.", "The fifth line."]) == [
        "TT", "hh", "ee", "  ", "ff", "oi", "uf", "rt", "th", "h ", " l", "li", "in", "ne", "e.",
        ".",
      ])
  }

  @Test("second line longer than first line", .enabled(if: RUNALL))
  func testSecondLineLongerThanFirstLine() {
    #expect(
      Transpose.transpose(["The first line.", "The second line."]) == [
        "TT", "hh", "ee", "  ", "fs", "ie", "rc", "so", "tn", " d", "l ", "il", "ni", "en", ".e",
        " .",
      ])
  }

  @Test("mixed line length", .enabled(if: RUNALL))
  func testMixedLineLength() {
    #expect(
      Transpose.transpose(["The longest line.", "A long line.", "A longer line.", "A line."]) == [
        "TAAA", "h   ", "elll", " ooi", "lnnn", "ogge", "n e.", "glr", "ei ", "snl", "tei", " .n",
        "l e", "i .", "n", "e", ".",
      ])
  }

  @Test("square", .enabled(if: RUNALL))
  func testSquare() {
    #expect(
      Transpose.transpose(["HEART", "EMBER", "ABUSE", "RESIN", "TREND"]) == [
        "HEART", "EMBER", "ABUSE", "RESIN", "TREND",
      ])
  }

  @Test("rectangle", .enabled(if: RUNALL))
  func testRectangle() {
    #expect(
      Transpose.transpose(["FRACTURE", "OUTLINED", "BLOOMING", "SEPTETTE"]) == [
        "FOBS", "RULE", "ATOP", "CLOT", "TIME", "UNIT", "RENT", "EDGE",
      ])
  }

  @Test("triangle", .enabled(if: RUNALL))
  func testTriangle() {
    #expect(
      Transpose.transpose(["T", "EE", "AAA", "SSSS", "EEEEE", "RRRRRR"]) == [
        "TEASER", " EASER", "  ASER", "   SER", "    ER", "     R",
      ])
  }

  @Test("jagged triangle", .enabled(if: RUNALL))
  func testJaggedTriangle() {
    #expect(
      Transpose.transpose(["11", "2", "3333", "444", "555555", "66666"]) == [
        "123456", "1 3456", "  3456", "  3 56", "    56", "    5",
      ])
  }
}
