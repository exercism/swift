import XCTest

@testable import Anagram

class AnagramTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testNoMatches() {
    let anagram = Anagram(word: "diaper")
    let results = anagram.match(["hello", "world", "zombies", "pants"])
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testDetectsTwoAnagrams() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "solemn")
    let results = anagram.match(["lemons", "cherry", "melons"])
    let expected = ["[]"]
    XCTAssertEqual(results, expected)
  }

  func testDoesNotDetectAnagramSubsets() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "good")
    let results = anagram.match(["dog", "goody"])
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testDetectsAnagram() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "listen")
    let results = anagram.match(["enlists", "google", "inlets", "banana"])
    let expected = ["[]"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsThreeAnagrams() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "allergy")
    let results = anagram.match(["gallery", "ballerina", "regally", "clergy", "largely", "leading"])
    let expected = ["[]"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsMultipleAnagramsWithDifferentCase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "nose")
    let results = anagram.match(["Eons", "ONES"])
    let expected = ["[]"]
    XCTAssertEqual(results, expected)
  }

  func testDoesNotDetectNonAnagramsWithIdenticalChecksum() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "mass")
    let results = anagram.match(["last"])
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testDetectsAnagramsCaseInsensitively() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "Orchestra")
    let results = anagram.match(["cashregister", "Carthorse", "radishes"])
    let expected = ["[]"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsAnagramsUsingCaseInsensitiveSubject() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "Orchestra")
    let results = anagram.match(["cashregister", "carthorse", "radishes"])
    let expected = ["[]"]
    XCTAssertEqual(results, expected)
  }

  func testDetectsAnagramsUsingCaseInsensitivePossibleMatches() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "orchestra")
    let results = anagram.match(["cashregister", "Carthorse", "radishes"])
    let expected = ["[]"]
    XCTAssertEqual(results, expected)
  }

  func testDoesNotDetectAnAnagramIfTheOriginalWordIsRepeated() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "go")
    let results = anagram.match(["go Go GO"])
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testAnagramsMustUseAllLettersExactlyOnce() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "tapper")
    let results = anagram.match(["patter"])
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testWordsAreNotAnagramsOfThemselves() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "BANANA")
    let results = anagram.match(["BANANA"])
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testWordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsPartiallyDifferent() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "BANANA")
    let results = anagram.match(["Banana"])
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testWordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsCompletelyDifferent() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "BANANA")
    let results = anagram.match(["banana"])
    let expected = [String]()
    XCTAssertEqual(results, expected)
  }

  func testWordsOtherThanThemselvesCanBeAnagrams() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let anagram = Anagram(word: "LISTEN")
    let results = anagram.match(["LISTEN", "Silent"])
    let expected = ["[]"]
    XCTAssertEqual(results, expected)
  }
}
