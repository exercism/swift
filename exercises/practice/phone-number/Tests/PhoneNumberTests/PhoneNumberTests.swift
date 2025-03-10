import Foundation
import Testing

@testable import PhoneNumber

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PhoneNumberTests {

  @Test("cleans the number")
  func testCleansTheNumber() {
    #expect(try! PhoneNumber("(223) 456-7890").clean() == "2234567890")
  }

  @Test("cleans numbers with dots", .enabled(if: RUNALL))
  func testCleansNumbersWithDots() {
    #expect(try! PhoneNumber("223.456.7890").clean() == "2234567890")
  }

  @Test("cleans numbers with multiple spaces", .enabled(if: RUNALL))
  func testCleansNumbersWithMultipleSpaces() {
    #expect(try! PhoneNumber("223 456   7890   ").clean() == "2234567890")
  }

  @Test("invalid when 9 digits", .enabled(if: RUNALL))
  func testInvalidWhen9Digits() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("123456789").clean()
    }
  }

  @Test("invalid when 11 digits does not start with a 1", .enabled(if: RUNALL))
  func testInvalidWhen11DigitsDoesNotStartWithA1() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("22234567890").clean()
    }
  }

  @Test("valid when 11 digits and starting with 1", .enabled(if: RUNALL))
  func testValidWhen11DigitsAndStartingWith1() {
    #expect(try! PhoneNumber("12234567890").clean() == "2234567890")
  }

  @Test("valid when 11 digits and starting with 1 even with punctuation", .enabled(if: RUNALL))
  func testValidWhen11DigitsAndStartingWith1EvenWithPunctuation() {
    #expect(try! PhoneNumber("+1 (223) 456-7890").clean() == "2234567890")
  }

  @Test("invalid when more than 11 digits", .enabled(if: RUNALL))
  func testInvalidWhenMoreThan11Digits() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("321234567890").clean()
    }
  }

  @Test("invalid with letters", .enabled(if: RUNALL))
  func testInvalidWithLetters() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("523-abc-7890").clean()
    }
  }

  @Test("invalid with punctuations", .enabled(if: RUNALL))
  func testInvalidWithPunctuations() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("523-@:!-7890").clean()
    }
  }

  @Test("invalid if area code starts with 0", .enabled(if: RUNALL))
  func testInvalidIfAreaCodeStartsWith0() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("(023) 456-7890").clean()
    }
  }

  @Test("invalid if area code starts with 1", .enabled(if: RUNALL))
  func testInvalidIfAreaCodeStartsWith1() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("(123) 456-7890").clean()
    }
  }

  @Test("invalid if exchange code starts with 0", .enabled(if: RUNALL))
  func testInvalidIfExchangeCodeStartsWith0() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("(223) 056-7890").clean()
    }
  }

  @Test("invalid if exchange code starts with 1", .enabled(if: RUNALL))
  func testInvalidIfExchangeCodeStartsWith1() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("(223) 156-7890").clean()
    }
  }

  @Test("invalid if area code starts with 0 on valid 11-digit number", .enabled(if: RUNALL))
  func testInvalidIfAreaCodeStartsWith0OnValid11DigitNumber() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("1 (023) 456-7890").clean()
    }
  }

  @Test("invalid if area code starts with 1 on valid 11-digit number", .enabled(if: RUNALL))
  func testInvalidIfAreaCodeStartsWith1OnValid11DigitNumber() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("1 (123) 456-7890").clean()
    }
  }

  @Test("invalid if exchange code starts with 0 on valid 11-digit number", .enabled(if: RUNALL))
  func testInvalidIfExchangeCodeStartsWith0OnValid11DigitNumber() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("1 (223) 056-7890").clean()
    }
  }

  @Test("invalid if exchange code starts with 1 on valid 11-digit number", .enabled(if: RUNALL))
  func testInvalidIfExchangeCodeStartsWith1OnValid11DigitNumber() {
    #expect(throws: PhoneNumberError.invalidPhoneNumber) {
      try PhoneNumber("1 (223) 156-7890").clean()
    }
  }
}
