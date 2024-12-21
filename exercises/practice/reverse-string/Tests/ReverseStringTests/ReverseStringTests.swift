import Foundation
import Testing

@testable import ReverseString

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ReverseStringTests {

  @Test("an empty string")
  func testAnEmptyString() {
    #expect(reverseString("") == "")
  }

  @Test("a word", .enabled(if: RUNALL))
  func testAWord() {
    #expect(reverseString("robot") == "tobor")
  }

  @Test("a capitalized word", .enabled(if: RUNALL))
  func testACapitalizedWord() {
    #expect(reverseString("Ramen") == "nemaR")
  }

  @Test("a sentence with punctuation", .enabled(if: RUNALL))
  func testASentenceWithPunctuation() {
    #expect(reverseString("I'm hungry!") == "!yrgnuh m'I")
  }

  @Test("a palindrome", .enabled(if: RUNALL))
  func testAPalindrome() {
    #expect(reverseString("racecar") == "racecar")
  }

  @Test("an even-sized word", .enabled(if: RUNALL))
  func testAnEvenSizedWord() {
    #expect(reverseString("drawer") == "reward")
  }
}
