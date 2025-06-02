import Foundation
import Testing

@testable import WordCount

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct WordCountTests {

  @Test("count one word")
  func testCountOneWord() {
    let words = WordCount(words: "word")
    let expected = ["word": 1]
    #expect(words.count() == expected)
  }

  @Test("count one of each word", .enabled(if: RUNALL))
  func testCountOneOfEachWord() {
    let words = WordCount(words: "one of each")
    let expected = ["each": 1, "of": 1, "one": 1]
    #expect(words.count() == expected)
  }

  @Test("multiple occurrences of a word", .enabled(if: RUNALL))
  func testMultipleOccurrencesOfAWord() {
    let words = WordCount(words: "one fish two fish red fish blue fish")
    let expected = ["blue": 1, "fish": 4, "one": 1, "red": 1, "two": 1]
    #expect(words.count() == expected)
  }

  @Test("handles cramped lists", .enabled(if: RUNALL))
  func testHandlesCrampedLists() {
    let words = WordCount(words: "one,two,three")
    let expected = ["one": 1, "three": 1, "two": 1]
    #expect(words.count() == expected)
  }

  @Test("handles expanded lists", .enabled(if: RUNALL))
  func testHandlesExpandedLists() {
    let words = WordCount(words: "one,\ntwo,\nthree")
    let expected = ["one": 1, "three": 1, "two": 1]
    #expect(words.count() == expected)
  }

  @Test("ignore punctuation", .enabled(if: RUNALL))
  func testIgnorePunctuation() {
    let words = WordCount(words: "car: carpet as java: javascript!!&@$%^&")
    let expected = ["as": 1, "car": 1, "carpet": 1, "java": 1, "javascript": 1]
    #expect(words.count() == expected)
  }

  @Test("include numbers", .enabled(if: RUNALL))
  func testIncludeNumbers() {
    let words = WordCount(words: "testing, 1, 2 testing")
    let expected = ["1": 1, "2": 1, "testing": 2]
    #expect(words.count() == expected)
  }

  @Test("normalize case", .enabled(if: RUNALL))
  func testNormalizeCase() {
    let words = WordCount(words: "go Go GO Stop stop")
    let expected = ["go": 3, "stop": 2]
    #expect(words.count() == expected)
  }

  @Test("with apostrophes", .enabled(if: RUNALL))
  func testWithApostrophes() {
    let words = WordCount(words: "'First: don't laugh. Then: don't cry. You're getting it.'")
    let expected = [
      "cry": 1, "don't": 2, "first": 1, "getting": 1, "it": 1, "laugh": 1, "then": 1, "you're": 1,
    ]
    #expect(words.count() == expected)
  }

  @Test("with quotations", .enabled(if: RUNALL))
  func testWithQuotations() {
    let words = WordCount(words: "Joe can't tell between 'large' and large.")
    let expected = ["and": 1, "between": 1, "can't": 1, "joe": 1, "large": 2, "tell": 1]
    #expect(words.count() == expected)
  }

  @Test("substrings from the beginning", .enabled(if: RUNALL))
  func testSubstringsFromTheBeginning() {
    let words = WordCount(words: "Joe can't tell between app, apple and a.")
    let expected = [
      "a": 1, "and": 1, "app": 1, "apple": 1, "between": 1, "can't": 1, "joe": 1, "tell": 1,
    ]
    #expect(words.count() == expected)
  }

  @Test("multiple spaces not detected as a word", .enabled(if: RUNALL))
  func testMultipleSpacesNotDetectedAsAWord() {
    let words = WordCount(words: " multiple   whitespaces")
    let expected = ["multiple": 1, "whitespaces": 1]
    #expect(words.count() == expected)
  }

  @Test("alternating word separators not detected as a word", .enabled(if: RUNALL))
  func testAlternatingWordSeparatorsNotDetectedAsAWord() {
    let words = WordCount(words: ",\n,one,\n ,two \n 'three'")
    let expected = ["one": 1, "three": 1, "two": 1]
    #expect(words.count() == expected)
  }

  @Test("quotation for word with apostrophe", .enabled(if: RUNALL))
  func testQuotationForWordWithApostrophe() {
    let words = WordCount(words: "can, can't, 'can't'")
    let expected = ["can": 1, "can't": 2]
    #expect(words.count() == expected)
  }
}
