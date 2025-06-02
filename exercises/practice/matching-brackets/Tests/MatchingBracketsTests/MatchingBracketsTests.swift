import Foundation
import Testing

@testable import MatchingBrackets

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct MatchingBracketsTests {

  @Test("paired square brackets")
  func testPairedSquareBrackets() {
    #expect(MatchingBrackets.paired(text: "[]"))
  }

  @Test("empty string", .enabled(if: RUNALL))
  func testEmptyString() {
    #expect(MatchingBrackets.paired(text: ""))
  }

  @Test("unpaired brackets", .enabled(if: RUNALL))
  func testUnpairedBrackets() {
    #expect(!MatchingBrackets.paired(text: "[["))
  }

  @Test("wrong ordered brackets", .enabled(if: RUNALL))
  func testWrongOrderedBrackets() {
    #expect(!MatchingBrackets.paired(text: "}{"))
  }

  @Test("wrong closing bracket", .enabled(if: RUNALL))
  func testWrongClosingBracket() {
    #expect(!MatchingBrackets.paired(text: "{]"))
  }

  @Test("paired with whitespace", .enabled(if: RUNALL))
  func testPairedWithWhitespace() {
    #expect(MatchingBrackets.paired(text: "{ }"))
  }

  @Test("partially paired brackets", .enabled(if: RUNALL))
  func testPartiallyPairedBrackets() {
    #expect(!MatchingBrackets.paired(text: "{[])"))
  }

  @Test("simple nested brackets", .enabled(if: RUNALL))
  func testSimpleNestedBrackets() {
    #expect(MatchingBrackets.paired(text: "{[]}"))
  }

  @Test("several paired brackets", .enabled(if: RUNALL))
  func testSeveralPairedBrackets() {
    #expect(MatchingBrackets.paired(text: "{}[]"))
  }

  @Test("paired and nested brackets", .enabled(if: RUNALL))
  func testPairedAndNestedBrackets() {
    #expect(MatchingBrackets.paired(text: "([{}({}[])])"))
  }

  @Test("unopened closing brackets", .enabled(if: RUNALL))
  func testUnopenedClosingBrackets() {
    #expect(!MatchingBrackets.paired(text: "{[)][]}"))
  }

  @Test("unpaired and nested brackets", .enabled(if: RUNALL))
  func testUnpairedAndNestedBrackets() {
    #expect(!MatchingBrackets.paired(text: "([{])"))
  }

  @Test("paired and wrong nested brackets", .enabled(if: RUNALL))
  func testPairedAndWrongNestedBrackets() {
    #expect(!MatchingBrackets.paired(text: "[({]})"))
  }

  @Test("paired and wrong nested brackets but innermost are correct", .enabled(if: RUNALL))
  func testPairedAndWrongNestedBracketsButInnermostAreCorrect() {
    #expect(!MatchingBrackets.paired(text: "[({}])"))
  }

  @Test("paired and incomplete brackets", .enabled(if: RUNALL))
  func testPairedAndIncompleteBrackets() {
    #expect(!MatchingBrackets.paired(text: "{}["))
  }

  @Test("too many closing brackets", .enabled(if: RUNALL))
  func testTooManyClosingBrackets() {
    #expect(!MatchingBrackets.paired(text: "[]]"))
  }

  @Test("early unexpected brackets", .enabled(if: RUNALL))
  func testEarlyUnexpectedBrackets() {
    #expect(!MatchingBrackets.paired(text: ")()"))
  }

  @Test("early mismatched brackets", .enabled(if: RUNALL))
  func testEarlyMismatchedBrackets() {
    #expect(!MatchingBrackets.paired(text: "{)()"))
  }

  @Test("math expression", .enabled(if: RUNALL))
  func testMathExpression() {
    #expect(MatchingBrackets.paired(text: "(((185 + 223.85) * 15) - 543)/2"))
  }

  @Test("complex latex expression", .enabled(if: RUNALL))
  func testComplexLatexExpression() {
    #expect(
      MatchingBrackets.paired(
        text:
          "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
      ))
  }
}
