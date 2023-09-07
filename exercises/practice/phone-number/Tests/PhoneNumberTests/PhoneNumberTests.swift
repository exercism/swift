import XCTest

@testable import PhoneNumber

class PhoneNumberTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testCleansTheNumber() {
    XCTAssertEqual(try! PhoneNumber("(223) 456-7890").clean(), "2234567890")
  }

  func testCleansNumbersWithDots() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! PhoneNumber("223.456.7890").clean(), "2234567890")
  }

  func testCleansNumbersWithMultipleSpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! PhoneNumber("223 456   7890   ").clean(), "2234567890")
  }

  func testInvalidWhen9Digits() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("123456789").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidWhen11DigitsDoesNotStartWithA1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("22234567890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testValidWhen11DigitsAndStartingWith1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! PhoneNumber("12234567890").clean(), "2234567890")
  }

  func testValidWhen11DigitsAndStartingWith1EvenWithPunctuation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! PhoneNumber("+1 (223) 456-7890").clean(), "2234567890")
  }

  func testInvalidWhenMoreThan11Digits() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("321234567890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidWithLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("523-abc-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidWithPunctuations() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("523-@:!-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidIfAreaCodeStartsWith0() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("(023) 456-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidIfAreaCodeStartsWith1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("(123) 456-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidIfExchangeCodeStartsWith0() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("(223) 056-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidIfExchangeCodeStartsWith1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("(223) 156-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidIfAreaCodeStartsWith0OnValid11DigitNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("1 (023) 456-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidIfAreaCodeStartsWith1OnValid11DigitNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("1 (123) 456-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidIfExchangeCodeStartsWith0OnValid11DigitNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("1 (223) 056-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }

  func testInvalidIfExchangeCodeStartsWith1OnValid11DigitNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try PhoneNumber("1 (223) 156-7890").clean()) {
      XCTAssertEqual($0 as? PhoneNumberError, .invalidPhoneNumber)
    }
  }
}
