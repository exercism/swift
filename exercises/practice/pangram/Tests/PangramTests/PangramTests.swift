import Foundation
import Testing

@testable import Pangram

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PangramTests {

  @Test("empty sentence")
  func testEmptySentence() {
    #expect(!isPangram(""))
  }

  @Test("perfect lower case", .enabled(if: RUNALL))
  func testPerfectLowerCase() {
    #expect(isPangram("abcdefghijklmnopqrstuvwxyz"))
  }

  @Test("only lower case", .enabled(if: RUNALL))
  func testOnlyLowerCase() {
    #expect(isPangram("the quick brown fox jumps over the lazy dog"))
  }

  @Test("missing the letter 'x'", .enabled(if: RUNALL))
  func testMissingTheLetterX() {
    #expect(!isPangram("a quick movement of the enemy will jeopardize five gunboats"))
  }

  @Test("missing the letter 'h'", .enabled(if: RUNALL))
  func testMissingTheLetterH() {
    #expect(!isPangram("five boxing wizards jump quickly at it"))
  }

  @Test("with underscores", .enabled(if: RUNALL))
  func testWithUnderscores() {
    #expect(isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"))
  }

  @Test("with numbers", .enabled(if: RUNALL))
  func testWithNumbers() {
    #expect(isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"))
  }

  @Test("missing letters replaced by numbers", .enabled(if: RUNALL))
  func testMissingLettersReplacedByNumbers() {
    #expect(!isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))
  }

  @Test("mixed case and punctuation", .enabled(if: RUNALL))
  func testMixedCaseAndPunctuation() {
    #expect(isPangram("\"Five quacking Zephyrs jolt my wax bed.\""))
  }

  @Test("a-m and A-M are 26 different characters but not a pangram", .enabled(if: RUNALL))
  func testAMAndAMAre26DifferentCharactersButNotAPangram() {
    #expect(!isPangram("abcdefghijklm ABCDEFGHIJKLM"))
  }
}
