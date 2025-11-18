import Foundation
import Testing

@testable import AffineCipher

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct AffineCipherTests {

  @Test("encode yes")
  func testEncodeYes() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().encode("yes", keyA: 5, keyB: 7)
      #expect(actual == "xbt")
    }
  }

  @Test("encode no", .enabled(if: RUNALL))
  func testEncodeNo() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().encode("no", keyA: 15, keyB: 18)
      #expect(actual == "fu")
    }
  }

  @Test("encode OMG", .enabled(if: RUNALL))
  func testEncodeOmg() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().encode("OMG", keyA: 21, keyB: 3)
      #expect(actual == "lvz")
    }
  }

  @Test("encode O M G", .enabled(if: RUNALL))
  func testEncodeOMG() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().encode("O M G", keyA: 25, keyB: 47)
      #expect(actual == "hjp")
    }
  }

  @Test("encode mindblowingly", .enabled(if: RUNALL))
  func testEncodeMindblowingly() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().encode("mindblowingly", keyA: 11, keyB: 15)
      #expect(actual == "rzcwa gnxzc dgt")
    }
  }

  @Test("encode numbers", .enabled(if: RUNALL))
  func testEncodeNumbers() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().encode("Testing,1 2 3, testing.", keyA: 3, keyB: 4)
      #expect(actual == "jqgjc rw123 jqgjc rw")
    }
  }

  @Test("encode deep thought", .enabled(if: RUNALL))
  func testEncodeDeepThought() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().encode("Truth is fiction.", keyA: 5, keyB: 17)
      #expect(actual == "iynia fdqfb ifje")
    }
  }

  @Test("encode all the letters", .enabled(if: RUNALL))
  func testEncodeAllTheLetters() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().encode(
        "The quick brown fox jumps over the lazy dog.", keyA: 17, keyB: 33)
      #expect(actual == "swxtj npvyk lruol iejdc blaxk swxmh qzglf")
    }
  }

  @Test("encode with a not coprime to m", .enabled(if: RUNALL))
  func testEncodeWithANotCoprimeToM() {
    #expect(throws: AffineCipherError.keysNotCoprime) {
      let _ = try AffineCipher().encode("This is a test.", keyA: 6, keyB: 17)
    }
  }

  @Test("decode exercism", .enabled(if: RUNALL))
  func testDecodeExercism() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().decode("tytgn fjr", keyA: 3, keyB: 7)
      #expect(actual == "exercism")
    }
  }

  @Test("decode a sentence", .enabled(if: RUNALL))
  func testDecodeASentence() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().decode(
        "qdwju nqcro muwhn odqun oppmd aunwd o", keyA: 19, keyB: 16)
      #expect(actual == "anobstacleisoftenasteppingstone")
    }
  }

  @Test("decode numbers", .enabled(if: RUNALL))
  func testDecodeNumbers() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().decode("odpoz ub123 odpoz ub", keyA: 25, keyB: 7)
      #expect(actual == "testing123testing")
    }
  }

  @Test("decode all the letters", .enabled(if: RUNALL))
  func testDecodeAllTheLetters() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().decode(
        "swxtj npvyk lruol iejdc blaxk swxmh qzglf", keyA: 17, keyB: 33)
      #expect(actual == "thequickbrownfoxjumpsoverthelazydog")
    }
  }

  @Test("decode with no spaces in input", .enabled(if: RUNALL))
  func testDecodeWithNoSpacesInInput() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().decode(
        "swxtjnpvyklruoliejdcblaxkswxmhqzglf", keyA: 17, keyB: 33)
      #expect(actual == "thequickbrownfoxjumpsoverthelazydog")
    }
  }

  @Test("decode with too many spaces", .enabled(if: RUNALL))
  func testDecodeWithTooManySpaces() {
    #expect(throws: Never.self) {
      let actual = try AffineCipher().decode("vszzm    cly   yd cg    qdp", keyA: 15, keyB: 16)
      #expect(actual == "jollygreengiant")
    }
  }

  @Test("decode with a not coprime to m", .enabled(if: RUNALL))
  func testDecodeWithANotCoprimeToM() {
    #expect(throws: AffineCipherError.keysNotCoprime) {
      let _ = try AffineCipher().decode("Test", keyA: 13, keyB: 5)
    }
  }

}
