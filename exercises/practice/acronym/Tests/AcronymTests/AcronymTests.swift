import Foundation
import Testing

@testable import Acronym

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct AcronymTests {

  @Test("basic")
  func testBasic() {
    #expect("PNG" == Acronym.abbreviate("Portable Network Graphics"))
  }

  @Test("lowercase words", .enabled(if: RUNALL))
  func testLowercaseWords() {
    #expect("ROR" == Acronym.abbreviate("Ruby on Rails"))
  }

  @Test("punctuation", .enabled(if: RUNALL))
  func testPunctuation() {
    #expect("FIFO" == Acronym.abbreviate("First In, First Out"))
  }

  @Test("all caps word", .enabled(if: RUNALL))
  func testAllCapsWord() {
    #expect("GIMP" == Acronym.abbreviate("GNU Image Manipulation Program"))
  }

  @Test("punctuation without whitespace", .enabled(if: RUNALL))
  func testPunctuationWithoutWhitespace() {
    #expect("CMOS" == Acronym.abbreviate("Complementary metal-oxide semiconductor"))
  }

  @Test("very long abbreviation", .enabled(if: RUNALL))
  func testVeryLongAbbreviation() {
    #expect(
      "ROTFLSHTMDCOALM"
        == Acronym.abbreviate(
          "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"))
  }

  @Test("consecutive delimiters", .enabled(if: RUNALL))
  func testConsecutiveDelimiters() {
    #expect("SIMUFTA" == Acronym.abbreviate("Something - I made up from thin air"))
  }

  @Test("apostrophes", .enabled(if: RUNALL))
  func testApostrophes() {
    #expect("HC" == Acronym.abbreviate("Halley's Comet"))
  }

  @Test("underscore emphasis", .enabled(if: RUNALL))
  func testUnderscoreEmphasis() {
    #expect("TRNT" == Acronym.abbreviate("The Road _Not_ Taken"))
  }
}
