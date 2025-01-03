import Foundation
import Testing

@testable import AtbashCipher

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct AtbashCipherTests {

  @Test("encode yes")
  func testEncodeYes() {
    #expect("bvh" == AtbashCipher.encode("yes"))
  }

  @Test("encode no", .enabled(if: RUNALL))
  func testEncodeNo() {
    #expect("ml" == AtbashCipher.encode("no"))
  }

  @Test("encode OMG", .enabled(if: RUNALL))
  func testEncodeOmg() {
    #expect("lnt" == AtbashCipher.encode("OMG"))
  }

  @Test("encode spaces", .enabled(if: RUNALL))
  func testEncodeSpaces() {
    #expect("lnt" == AtbashCipher.encode("O M G"))
  }

  @Test("encode mindblowingly", .enabled(if: RUNALL))
  func testEncodeMindblowingly() {
    #expect("nrmwy oldrm tob" == AtbashCipher.encode("mindblowingly"))
  }

  @Test("encode numbers", .enabled(if: RUNALL))
  func testEncodeNumbers() {
    #expect("gvhgr mt123 gvhgr mt" == AtbashCipher.encode("Testing,1 2 3, testing."))
  }

  @Test("encode deep thought", .enabled(if: RUNALL))
  func testEncodeDeepThought() {
    #expect("gifgs rhurx grlm" == AtbashCipher.encode("Truth is fiction."))
  }

  @Test("encode all the letters", .enabled(if: RUNALL))
  func testEncodeAllTheLetters() {
    #expect(
      "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
        == AtbashCipher.encode("The quick brown fox jumps over the lazy dog."))
  }

  @Test("decode exercism")
  func testDecodeExercism() {
    #expect("exercism" == AtbashCipher.decode("vcvix rhn"))
  }

  @Test("decode a sentence", .enabled(if: RUNALL))
  func testDecodeASentence() {
    #expect(
      "anobstacleisoftenasteppingstone"
        == AtbashCipher.decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v"))
  }

  @Test("decode numbers", .enabled(if: RUNALL))
  func testDecodeNumbers() {
    #expect("testing123testing" == AtbashCipher.decode("gvhgr mt123 gvhgr mt"))
  }

  @Test("decode all the letters", .enabled(if: RUNALL))
  func testDecodeAllTheLetters() {
    #expect(
      "thequickbrownfoxjumpsoverthelazydog"
        == AtbashCipher.decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"))
  }

  @Test("decode with too many spaces", .enabled(if: RUNALL))
  func testDecodeWithTooManySpaces() {
    #expect("exercism" == AtbashCipher.decode("vc vix    r hn"))
  }

  @Test("decode with no spaces", .enabled(if: RUNALL))
  func testDecodeWithNoSpaces() {
    #expect(
      "anobstacleisoftenasteppingstone" == AtbashCipher.decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv"))
  }
}
