import XCTest

@testable import Anagram

class AnagramTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testNoMatches() {
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testDetectsTwoAnagrams() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["stream", "maters"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsTwoAnagrams() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["lemons", "melons"]
    XCTAssertEqual(results, expected)
  }

  func testDoesNotDetectAnagramSubsets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testDetectsAnagram() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["inlets"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsThreeAnagrams() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["gallery", "regally", "largely"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsMultipleAnagramsWithDifferentCase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["Eons", "ONES"]
    XCTAssertEqual(results, expected)
  }

  func testDoesNotDetectNonAnagramsWithIdenticalChecksum() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testDetectsAnagramsCaseInsensitively() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["Carthorse"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsAnagramsUsingCaseInsensitiveSubject() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["carthorse"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsAnagramsUsingCaseInsensitivePossibleMatches() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["Carthorse"]
    XCTAssertEqual(results, expected)
  }

  func testDoesNotDetectAnAnagramIfTheOriginalWordIsRepeated() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testAnagramsMustUseAllLettersExactlyOnce() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testWordsAreNotAnagramsOfThemselves() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testWordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsPartiallyDifferent() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testWordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsCompletelyDifferent() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testWordsOtherThanThemselvesCanBeAnagrams() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "")
    let results = anagram.match()
    let expected = ["Silent"]
    XCTAssertEqual(results, expected)
  }
}
