import Foundation
import Testing

@testable import Isogram

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct IsogramTests {

  @Test("empty string")
  func testEmptyString() {
    #expect(isIsogram(""))
  }

  @Test("isogram with only lower case characters", .enabled(if: RUNALL))
  func testIsogramWithOnlyLowerCaseCharacters() {
    #expect(isIsogram("isogram"))
  }

  @Test("word with one duplicated character", .enabled(if: RUNALL))
  func testWordWithOneDuplicatedCharacter() {
    #expect(!isIsogram("eleven"))
  }

  @Test("word with one duplicated character from the end of the alphabet", .enabled(if: RUNALL))
  func testWordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet() {
    #expect(!isIsogram("zzyzx"))
  }

  @Test("longest reported english isogram", .enabled(if: RUNALL))
  func testLongestReportedEnglishIsogram() {
    #expect(isIsogram("subdermatoglyphic"))
  }

  @Test("word with duplicated character in mixed case", .enabled(if: RUNALL))
  func testWordWithDuplicatedCharacterInMixedCase() {
    #expect(!isIsogram("Alphabet"))
  }

  @Test("word with duplicated character in mixed case, lowercase first", .enabled(if: RUNALL))
  func testWordWithDuplicatedCharacterInMixedCaseLowercaseFirst() {
    #expect(!isIsogram("alphAbet"))
  }

  @Test("hypothetical isogrammic word with hyphen", .enabled(if: RUNALL))
  func testHypotheticalIsogrammicWordWithHyphen() {
    #expect(isIsogram("thumbscrew-japingly"))
  }

  @Test("hypothetical word with duplicated character following hyphen", .enabled(if: RUNALL))
  func testHypotheticalWordWithDuplicatedCharacterFollowingHyphen() {
    #expect(!isIsogram("thumbscrew-jappingly"))
  }

  @Test("isogram with duplicated hyphen", .enabled(if: RUNALL))
  func testIsogramWithDuplicatedHyphen() {
    #expect(isIsogram("six-year-old"))
  }

  @Test("made-up name that is an isogram", .enabled(if: RUNALL))
  func testMadeUpNameThatIsAnIsogram() {
    #expect(isIsogram("Emily Jung Schwartzkopf"))
  }

  @Test("duplicated character in the middle", .enabled(if: RUNALL))
  func testDuplicatedCharacterInTheMiddle() {
    #expect(!isIsogram("accentor"))
  }

  @Test("same first and last characters", .enabled(if: RUNALL))
  func testSameFirstAndLastCharacters() {
    #expect(!isIsogram("angola"))
  }

  @Test("word with duplicated character and with two hyphens", .enabled(if: RUNALL))
  func testWordWithDuplicatedCharacterAndWithTwoHyphens() {
    #expect(!isIsogram("up-to-date"))
  }
}
