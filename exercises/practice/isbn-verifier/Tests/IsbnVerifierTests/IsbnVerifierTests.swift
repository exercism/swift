import Foundation
import Testing

@testable import IsbnVerifier

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct IsbnVerifierTests {

  @Test("valid isbn")
  func testValidIsbn() { #expect(IsbnVerifier.isValid("3-598-21508-8")) }

  @Test("invalid isbn check digit", .enabled(if: RUNALL))
  func testInvalidIsbnCheckDigit() { #expect(!IsbnVerifier.isValid("3-598-21508-9")) }

  @Test("valid isbn with a check digit of 10", .enabled(if: RUNALL))
  func testValidIsbnWithACheckDigitOf10() { #expect(IsbnVerifier.isValid("3-598-21507-X")) }

  @Test("check digit is a character other than X", .enabled(if: RUNALL))
  func testCheckDigitIsACharacterOtherThanX() { #expect(!IsbnVerifier.isValid("3-598-21507-A")) }

  @Test("invalid check digit in isbn is not treated as zero", .enabled(if: RUNALL))
  func testInvalidCheckDigitInIsbnIsNotTreatedAsZero() {
    #expect(!IsbnVerifier.isValid("4-598-21507-B"))
  }

  @Test("invalid character in isbn is not treated as zero", .enabled(if: RUNALL))
  func testInvalidCharacterInIsbnIsNotTreatedAsZero() {
    #expect(!IsbnVerifier.isValid("3-598-P1581-X"))
  }

  @Test("X is only valid as a check digit", .enabled(if: RUNALL))
  func testXIsOnlyValidAsACheckDigit() { #expect(!IsbnVerifier.isValid("3-598-2X507-9")) }

  @Test("valid isbn without separating dashes", .enabled(if: RUNALL))
  func testValidIsbnWithoutSeparatingDashes() { #expect(IsbnVerifier.isValid("3598215088")) }

  @Test("isbn without separating dashes and X as check digit", .enabled(if: RUNALL))
  func testIsbnWithoutSeparatingDashesAndXAsCheckDigit() {
    #expect(IsbnVerifier.isValid("359821507X"))
  }

  @Test("isbn without check digit and dashes", .enabled(if: RUNALL))
  func testIsbnWithoutCheckDigitAndDashes() { #expect(!IsbnVerifier.isValid("359821507")) }

  @Test("too long isbn and no dashes", .enabled(if: RUNALL))
  func testTooLongIsbnAndNoDashes() { #expect(!IsbnVerifier.isValid("3598215078X")) }

  @Test("too short isbn", .enabled(if: RUNALL))
  func testTooShortIsbn() { #expect(!IsbnVerifier.isValid("00")) }

  @Test("isbn without check digit", .enabled(if: RUNALL))
  func testIsbnWithoutCheckDigit() { #expect(!IsbnVerifier.isValid("3-598-21507")) }

  @Test("check digit of X should not be used for 0", .enabled(if: RUNALL))
  func testCheckDigitOfXShouldNotBeUsedFor0() { #expect(!IsbnVerifier.isValid("3-598-21515-X")) }

  @Test("empty isbn", .enabled(if: RUNALL))
  func testEmptyIsbn() { #expect(!IsbnVerifier.isValid("")) }

  @Test("input is 9 characters", .enabled(if: RUNALL))
  func testInputIs9Characters() { #expect(!IsbnVerifier.isValid("134456729")) }

  @Test("invalid characters are not ignored after checking length", .enabled(if: RUNALL))
  func testInvalidCharactersAreNotIgnoredAfterCheckingLength() {
    #expect(!IsbnVerifier.isValid("3132P34035"))
  }

  @Test("invalid characters are not ignored before checking length", .enabled(if: RUNALL))
  func testInvalidCharactersAreNotIgnoredBeforeCheckingLength() {
    #expect(!IsbnVerifier.isValid("3598P215088"))
  }

  @Test("input is too long but contains a valid isbn", .enabled(if: RUNALL))
  func testInputIsTooLongButContainsAValidIsbn() { #expect(!IsbnVerifier.isValid("98245726788")) }
}
