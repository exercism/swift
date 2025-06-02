import Foundation
import Testing

@testable import RunLengthEncoding

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct RunLengthEncodingTests {

  @Test("empty string")
  func testEncodeEmptyString() {
    #expect(RunLengthEncoding.encode("") == "")
  }

  @Test("single characters only are encoded without count", .enabled(if: RUNALL))
  func testEncodeSingleCharactersOnlyAreEncodedWithoutCount() {
    #expect(RunLengthEncoding.encode("XYZ") == "XYZ")
  }

  @Test("string with no single characters", .enabled(if: RUNALL))
  func testEncodeStringWithNoSingleCharacters() {
    #expect(RunLengthEncoding.encode("AABBBCCCC") == "2A3B4C")
  }

  @Test("single characters mixed with repeated characters", .enabled(if: RUNALL))
  func testEncodeSingleCharactersMixedWithRepeatedCharacters() {
    #expect(
      RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
        == "12WB12W3B24WB")
  }

  @Test("multiple whitespace mixed in string", .enabled(if: RUNALL))
  func testEncodeMultipleWhitespaceMixedInString() {
    #expect(RunLengthEncoding.encode("  hsqq qww  ") == "2 hs2q q2w2 ")
  }

  @Test("lowercase characters", .enabled(if: RUNALL))
  func testEncodeLowercaseCharacters() {
    #expect(RunLengthEncoding.encode("aabbbcccc") == "2a3b4c")
  }

  @Test("empty string", .enabled(if: RUNALL))
  func testDecodeEmptyString() {
    #expect(RunLengthEncoding.decode("") == "")
  }

  @Test("single characters only", .enabled(if: RUNALL))
  func testDecodeSingleCharactersOnly() {
    #expect(RunLengthEncoding.decode("XYZ") == "XYZ")
  }

  @Test("string with no single characters", .enabled(if: RUNALL))
  func testDecodeStringWithNoSingleCharacters() {
    #expect(RunLengthEncoding.decode("2A3B4C") == "AABBBCCCC")
  }

  @Test("single characters with repeated characters", .enabled(if: RUNALL))
  func testDecodeSingleCharactersWithRepeatedCharacters() {
    #expect(
      RunLengthEncoding.decode("12WB12W3B24WB")
        == "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
  }

  @Test("multiple whitespace mixed in string", .enabled(if: RUNALL))
  func testDecodeMultipleWhitespaceMixedInString() {
    #expect(RunLengthEncoding.decode("2 hs2q q2w2 ") == "  hsqq qww  ")
  }

  @Test("lowercase string", .enabled(if: RUNALL))
  func testDecodeLowercaseString() {
    #expect(RunLengthEncoding.decode("2a3b4c") == "aabbbcccc")
  }

  @Test("encode followed by decode gives original string", .enabled(if: RUNALL))
  func testConsistencyEncodeFollowedByDecodeGivesOriginalString() {
    let encoded = RunLengthEncoding.encode("zzz ZZ  zZ")
    let decoded = RunLengthEncoding.decode(encoded)
    #expect(decoded == "zzz ZZ  zZ")
  }
}
