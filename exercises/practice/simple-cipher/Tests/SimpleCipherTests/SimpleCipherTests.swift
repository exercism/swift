import Foundation
import Testing

@testable import SimpleCipher

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL"] ?? "false") ?? false

@Suite struct SimpleCipherTests {
  @Test("Can encode")
  func testCipherEncode() {
    let cipher = Cipher()
    let plaintext = "aaaaaaaaaa"
    let expected = String(
      cipher.key[..<cipher.key.index(cipher.key.startIndex, offsetBy: plaintext.count)])
    #expect(expected == cipher.encode(plaintext))
  }

  @Test("Can decode", .enabled(if: RUNALL))
  func testCipherDecode() {
    let cipher = Cipher()
    let plaintext = "aaaaaaaaaa"
    let expected = String(
      cipher.key[..<cipher.key.index(cipher.key.startIndex, offsetBy: plaintext.count)])
    #expect(plaintext == cipher.decode(expected))
  }

  @Test(
    "Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method",
    .enabled(if: RUNALL))
  func testCipherReversible() {
    let cipher = Cipher()
    let plaintext = "abcdefghij"
    #expect(plaintext == cipher.decode(cipher.encode(plaintext)))
  }

  @Test("Key is made only of lowercase letters", .enabled(if: RUNALL))
  func testCipherKey() {
    let cipher = Cipher()
    let pattern = "^[a-z]+$"
    #expect(cipher.key.range(of: pattern, options: .regularExpression) != nil)
  }

  // MARK: TestSubstitution

  @Test("Can encode", .enabled(if: RUNALL))
  func testCipherKeyIsAsSubmitted() {
    let cipher = Cipher(key: "abcdefghij") ?? Cipher()
    let plaintext = "aaaaaaaaaa"
    let expected = "abcdefghij"

    #expect(expected == cipher.encode(plaintext))
  }

  @Test("Can decode", .enabled(if: RUNALL))
  func testCipherKeyIsAsSubmittedDecode() {
    let cipher = Cipher(key: "abcdefghij") ?? Cipher()
    let plaintext = "abcdefghij"
    let expected = "aaaaaaaaaa"

    #expect(expected == cipher.decode(plaintext))
  }

  @Test(
    "Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method",
    .enabled(if: RUNALL))
  func testCipherKeyIsAsSubmittedReversible() {
    let cipher = Cipher(key: "abcdefghij") ?? Cipher()
    let plaintext = "abcdefghij"

    #expect(plaintext == cipher.decode(cipher.encode(plaintext)))
  }

  @Test("Can double shift encode", .enabled(if: RUNALL))
  func testCipherKeyIsAsSubmittedDoubleShiftEncode() {
    let cipher = Cipher(key: "iamapandabear") ?? Cipher()
    let plaintext = "iamapandabear"
    let expected = "qayaeaagaciai"

    #expect(expected == cipher.encode(plaintext))
  }

  @Test("Can wrap on encode", .enabled(if: RUNALL))
  func testCipherKeyIsAsSubmittedWrapEncode() {
    let cipher = Cipher(key: "abcdefghij") ?? Cipher()
    let plaintext = "zzzzzzzzzz"
    let expected = "zabcdefghi"

    #expect(expected == cipher.encode(plaintext))
  }

  @Test("Can wrap on decode", .enabled(if: RUNALL))
  func testCipherKeyIsAsSubmittedWrapDecode() {
    let cipher = Cipher(key: "abcdefghij") ?? Cipher()
    let plaintext = "zabcdefghi"
    let expected = "zzzzzzzzzz"

    #expect(expected == cipher.decode(plaintext))
  }

  @Test("Can encode messages longer than the key", .enabled(if: RUNALL))
  func testCipherKeyIsAsSubmittedLongerKey() {
    let cipher = Cipher(key: "abc") ?? Cipher()
    let plaintext = "iamapandabear"
    let expected = "iboaqcnecbfcr"

    #expect(expected == cipher.encode(plaintext))
  }

  @Test("Can decode messages longer than the key", .enabled(if: RUNALL))
  func testCipherKeyIsAsSubmittedLongerKeyDecode() {
    let cipher = Cipher(key: "abc") ?? Cipher()
    let plaintext = "iboaqcnecbfcr"
    let expected = "iamapandabear"

    #expect(expected == cipher.decode(plaintext))
  }

}
