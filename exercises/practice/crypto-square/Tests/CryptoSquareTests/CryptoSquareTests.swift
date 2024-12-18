import Foundation
import Testing

@testable import CryptoSquare

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct CryptoSquareTests {

  @Test("empty plaintext results in an empty ciphertext")
  func testEmptyPlaintextResultsInAnEmptyCiphertext() {
    #expect(cryptoSquare(text: "") == "")
  }

  @Test("normalization results in empty plaintext", .enabled(if: RUNALL))
  func testNormalizationResultsInEmptyPlaintext() {
    #expect(cryptoSquare(text: "... --- ...") == "")
  }

  @Test("Lowercase", .enabled(if: RUNALL))
  func testLowercase() {
    #expect(cryptoSquare(text: "A") == "a")
  }

  @Test("Remove spaces", .enabled(if: RUNALL))
  func testRemoveSpaces() {
    #expect(cryptoSquare(text: "  b ") == "b")
  }

  @Test("Remove punctuation", .enabled(if: RUNALL))
  func testRemovePunctuation() {
    #expect(cryptoSquare(text: "@1,%!") == "1")
  }

  @Test("9 character plaintext results in 3 chunks of 3 characters", .enabled(if: RUNALL))
  func test9CharacterPlaintextResultsIn3ChunksOf3Characters() {
    #expect(cryptoSquare(text: "This is fun!") == "tsf hiu isn")
  }

  @Test(
    "8 character plaintext results in 3 chunks, the last one with a trailing space",
    .enabled(if: RUNALL))
  func test8CharacterPlaintextResultsIn3ChunksTheLastOneWithATrailingSpace() {
    #expect(cryptoSquare(text: "Chill out.") == "clu hlt io ")
  }

  @Test(
    "54 character plaintext results in 7 chunks, the last two with trailing spaces",
    .enabled(if: RUNALL))
  func test54CharacterPlaintextResultsIn7ChunksTheLastTwoWithTrailingSpaces() {
    #expect(
      cryptoSquare(text: "If man was meant to stay on the ground, god would have given us roots.")
        == "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ")
  }
}
