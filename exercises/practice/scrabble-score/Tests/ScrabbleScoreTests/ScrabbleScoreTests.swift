import Foundation
import Testing

@testable import ScrabbleScore

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ScrabbleScoreTests {

  @Test("lowercase letter")
  func testLowercaseLetter() {
    #expect(score("a") == 1)
  }

  @Test("uppercase letter", .enabled(if: RUNALL))
  func testUppercaseLetter() {
    #expect(score("A") == 1)
  }

  @Test("valuable letter", .enabled(if: RUNALL))
  func testValuableLetter() {
    #expect(score("f") == 4)
  }

  @Test("short word", .enabled(if: RUNALL))
  func testShortWord() {
    #expect(score("at") == 2)
  }

  @Test("short, valuable word", .enabled(if: RUNALL))
  func testShortValuableWord() {
    #expect(score("zoo") == 12)
  }

  @Test("medium word", .enabled(if: RUNALL))
  func testMediumWord() {
    #expect(score("street") == 6)
  }

  @Test("medium, valuable word", .enabled(if: RUNALL))
  func testMediumValuableWord() {
    #expect(score("quirky") == 22)
  }

  @Test("long, mixed-case word", .enabled(if: RUNALL))
  func testLongMixedCaseWord() {
    #expect(score("OxyphenButazone") == 41)
  }

  @Test("english-like word", .enabled(if: RUNALL))
  func testEnglishLikeWord() {
    #expect(score("pinata") == 8)
  }

  @Test("empty input", .enabled(if: RUNALL))
  func testEmptyInput() {
    #expect(score("") == 0)
  }

  @Test("entire alphabet available", .enabled(if: RUNALL))
  func testEntireAlphabetAvailable() {
    #expect(score("abcdefghijklmnopqrstuvwxyz") == 87)
  }
}
