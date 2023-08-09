import XCTest

@testable import WordCount

class WordCountTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testCountOneWord() {
    let words = WordCount(words: "word")
    let expected = ["word": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testCountOneOfEachWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "one of each")
    let expected = ["each": 1, "of": 1, "one": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testMultipleOccurrencesOfAWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "one fish two fish red fish blue fish")
    let expected = ["blue": 1, "fish": 4, "one": 1, "red": 1, "two": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testHandlesCrampedLists() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "one,two,three")
    let expected = ["one": 1, "three": 1, "two": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testHandlesExpandedLists() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "one,\ntwo,\nthree")
    let expected = ["one": 1, "three": 1, "two": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testIgnorePunctuation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "car: carpet as java: javascript!!&@$%^&")
    let expected = ["as": 1, "car": 1, "carpet": 1, "java": 1, "javascript": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testIncludeNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "testing, 1, 2 testing")
    let expected = ["1": 1, "2": 1, "testing": 2]
    XCTAssertEqual(words.count(), expected)
  }

  func testNormalizeCase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "go Go GO Stop stop")
    let expected = ["go": 3, "stop": 2]
    XCTAssertEqual(words.count(), expected)
  }

  func testWithApostrophes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "'First: don't laugh. Then: don't cry. You're getting it.'")
    let expected = [
      "cry": 1, "don't": 2, "first": 1, "getting": 1, "it": 1, "laugh": 1, "then": 1, "you're": 1,
    ]
    XCTAssertEqual(words.count(), expected)
  }

  func testWithQuotations() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "Joe can't tell between 'large' and large.")
    let expected = ["and": 1, "between": 1, "can't": 1, "joe": 1, "large": 2, "tell": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testSubstringsFromTheBeginning() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "Joe can't tell between app, apple and a.")
    let expected = [
      "a": 1, "and": 1, "app": 1, "apple": 1, "between": 1, "can't": 1, "joe": 1, "tell": 1,
    ]
    XCTAssertEqual(words.count(), expected)
  }

  func testMultipleSpacesNotDetectedAsAWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: " multiple   whitespaces")
    let expected = ["multiple": 1, "whitespaces": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testAlternatingWordSeparatorsNotDetectedAsAWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: ",\n,one,\n ,two \n 'three'")
    let expected = ["one": 1, "three": 1, "two": 1]
    XCTAssertEqual(words.count(), expected)
  }

  func testQuotationForWordWithApostrophe() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let words = WordCount(words: "can, can't, 'can't'")
    let expected = ["can": 1, "can't": 2]
    XCTAssertEqual(words.count(), expected)
  }
}
