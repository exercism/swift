import Foundation
import Testing

@testable import Anagram

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct AnagramTests {

  @Test("no matches")
  func testNoMatches() {
    let anagram = Anagram(word: "diaper")
    let results = anagram.match(["hello", "world", "zombies", "pants"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test("detects two anagrams", .enabled(if: RUNALL))
  func testDetectsTwoAnagrams() {
    let anagram = Anagram(word: "solemn")
    let results = anagram.match(["lemons", "cherry", "melons"])
    let expected = ["lemons", "melons"]
    #expect(results == expected)
  }

  @Test("does not detect anagram subsets", .enabled(if: RUNALL))
  func testDoesNotDetectAnagramSubsets() {
    let anagram = Anagram(word: "good")
    let results = anagram.match(["dog", "goody"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test("detects anagram", .enabled(if: RUNALL))
  func testDetectsAnagram() {
    let anagram = Anagram(word: "listen")
    let results = anagram.match(["enlists", "google", "inlets", "banana"])
    let expected = ["inlets"]
    #expect(results == expected)
  }

  @Test("detects three anagrams", .enabled(if: RUNALL))
  func testDetectsThreeAnagrams() {
    let anagram = Anagram(word: "allergy")
    let results = anagram.match(["gallery", "ballerina", "regally", "clergy", "largely", "leading"])
    let expected = ["gallery", "regally", "largely"]
    #expect(results == expected)
  }

  @Test("detects multiple anagrams with different case", .enabled(if: RUNALL))
  func testDetectsMultipleAnagramsWithDifferentCase() {
    let anagram = Anagram(word: "nose")
    let results = anagram.match(["Eons", "ONES"])
    let expected = ["Eons", "ONES"]
    #expect(results == expected)
  }

  @Test("does not detect non-anagrams with identical checksum", .enabled(if: RUNALL))
  func testDoesNotDetectNonAnagramsWithIdenticalChecksum() {
    let anagram = Anagram(word: "mass")
    let results = anagram.match(["last"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test("detects anagrams case-insensitively", .enabled(if: RUNALL))
  func testDetectsAnagramsCaseInsensitively() {
    let anagram = Anagram(word: "Orchestra")
    let results = anagram.match(["cashregister", "Carthorse", "radishes"])
    let expected = ["Carthorse"]
    #expect(results == expected)
  }

  @Test("detects anagrams using case-insensitive subject", .enabled(if: RUNALL))
  func testDetectsAnagramsUsingCaseInsensitiveSubject() {
    let anagram = Anagram(word: "Orchestra")
    let results = anagram.match(["cashregister", "carthorse", "radishes"])
    let expected = ["carthorse"]
    #expect(results == expected)
  }

  @Test("detects anagrams using case-insensitive possible matches", .enabled(if: RUNALL))
  func testDetectsAnagramsUsingCaseInsensitivePossibleMatches() {
    let anagram = Anagram(word: "orchestra")
    let results = anagram.match(["cashregister", "Carthorse", "radishes"])
    let expected = ["Carthorse"]
    #expect(results == expected)
  }

  @Test("does not detect an anagram if the original word is repeated", .enabled(if: RUNALL))
  func testDoesNotDetectAnAnagramIfTheOriginalWordIsRepeated() {
    let anagram = Anagram(word: "go")
    let results = anagram.match(["goGoGO"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test("anagrams must use all letters exactly once", .enabled(if: RUNALL))
  func testAnagramsMustUseAllLettersExactlyOnce() {
    let anagram = Anagram(word: "tapper")
    let results = anagram.match(["patter"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test("words are not anagrams of themselves (case-insensitive)", .enabled(if: RUNALL))
  func testWordsAreNotAnagramsOfThemselvesCaseInsensitive() {
    let anagram = Anagram(word: "BANANA")
    let results = anagram.match(["BANANA", "Banana", "banana"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test("words are not anagrams of themselves", .enabled(if: RUNALL))
  func testWordsAreNotAnagramsOfThemselves() {
    let anagram = Anagram(word: "BANANA")
    let results = anagram.match(["BANANA"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test(
    "words are not anagrams of themselves even if letter case is partially different",
    .enabled(if: RUNALL))
  func testWordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsPartiallyDifferent() {
    let anagram = Anagram(word: "BANANA")
    let results = anagram.match(["Banana"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test(
    "words are not anagrams of themselves even if letter case is completely different",
    .enabled(if: RUNALL))
  func testWordsAreNotAnagramsOfThemselvesEvenIfLetterCaseIsCompletelyDifferent() {
    let anagram = Anagram(word: "BANANA")
    let results = anagram.match(["banana"])
    let expected = [String]()
    #expect(results == expected)
  }

  @Test("words other than themselves can be anagrams", .enabled(if: RUNALL))
  func testWordsOtherThanThemselvesCanBeAnagrams() {
    let anagram = Anagram(word: "LISTEN")
    let results = anagram.match(["LISTEN", "Silent"])
    let expected = ["Silent"]
    #expect(results == expected)
  }
}
