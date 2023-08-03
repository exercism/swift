import XCTest

@testable import Luhn

class LuhnTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testSingleDigitStringsCanNotBeValid() {
    XCTAssertFalse(isValidLuhn("1"))
  }

  func testASingleZeroIsInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("0"))
  }

  func testASimpleValidSinThatRemainsValidIfReversed() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("059"))
  }

  func testASimpleValidSinThatBecomesInvalidIfReversed() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("59"))
  }

  func testAValidCanadianSin() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("055 444 285"))
  }

  func testInvalidCanadianSin() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("055 444 286"))
  }

  func testInvalidCreditCard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("8273 1232 7352 0569"))
  }

  func testInvalidLongNumberWithAnEvenRemainder() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("1 2345 6789 1234 5678 9012"))
  }

  func testInvalidLongNumberWithARemainderDivisibleBy5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("1 2345 6789 1234 5678 9013"))
  }

  func testValidNumberWithAnEvenNumberOfDigits() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("095 245 88"))
  }

  func testValidNumberWithAnOddNumberOfSpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("234 567 891 234"))
  }

  func testValidStringsWithANonDigitAddedAtTheEndBecomeInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("059a"))
  }

  func testValidStringsWithPunctuationIncludedBecomeInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("055-444-285"))
  }

  func testValidStringsWithSymbolsIncludedBecomeInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("055# 444$ 285"))
  }

  func testSingleZeroWithSpaceIsInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn(" 0"))
  }

  func testMoreThanASingleZeroIsValid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("0000 0"))
  }

  func testInputDigit9IsCorrectlyConvertedToOutputDigit9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("091"))
  }

  func testVeryLongInputIsValid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("9999999999 9999999999 9999999999 9999999999"))
  }

  func testValidLuhnWithAnOddNumberOfDigitsAndNonZeroFirstDigit() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isValidLuhn("109"))
  }

  func testUsingAsciiValueForNonDoubledNonDigitIsntAllowed() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("055b 444 285"))
  }

  func testUsingAsciiValueForDoubledNonDigitIsntAllowed() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn(":9"))
  }

  func testNonNumericNonSpaceCharInTheMiddleWithASumThatsDivisibleBy10IsntAllowed() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isValidLuhn("59%59"))
  }
}
