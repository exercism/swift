import Foundation
import Testing

@testable import Luhn

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct LuhnTests {

  @Test("single digit strings can not be valid")
  func testSingleDigitStringsCanNotBeValid() {
    #expect(!isValidLuhn("1"))
  }

  @Test("a single zero is invalid", .enabled(if: RUNALL))
  func testASingleZeroIsInvalid() {
    #expect(!isValidLuhn("0"))
  }

  @Test("a simple valid SIN that remains valid if reversed", .enabled(if: RUNALL))
  func testASimpleValidSinThatRemainsValidIfReversed() {
    #expect(isValidLuhn("059"))
  }

  @Test("a simple valid SIN that becomes invalid if reversed", .enabled(if: RUNALL))
  func testASimpleValidSinThatBecomesInvalidIfReversed() {
    #expect(isValidLuhn("59"))
  }

  @Test("a valid Canadian SIN", .enabled(if: RUNALL))
  func testAValidCanadianSin() {
    #expect(isValidLuhn("055 444 285"))
  }

  @Test("invalid Canadian SIN", .enabled(if: RUNALL))
  func testInvalidCanadianSin() {
    #expect(!isValidLuhn("055 444 286"))
  }

  @Test("invalid credit card", .enabled(if: RUNALL))
  func testInvalidCreditCard() {
    #expect(!isValidLuhn("8273 1232 7352 0569"))
  }

  @Test("invalid long number with an even remainder", .enabled(if: RUNALL))
  func testInvalidLongNumberWithAnEvenRemainder() {
    #expect(!isValidLuhn("1 2345 6789 1234 5678 9012"))
  }

  @Test("invalid long number with a remainder divisible by 5", .enabled(if: RUNALL))
  func testInvalidLongNumberWithARemainderDivisibleBy5() {
    #expect(!isValidLuhn("1 2345 6789 1234 5678 9013"))
  }

  @Test("valid number with an even number of digits", .enabled(if: RUNALL))
  func testValidNumberWithAnEvenNumberOfDigits() {
    #expect(isValidLuhn("095 245 88"))
  }

  @Test("valid number with an odd number of spaces", .enabled(if: RUNALL))
  func testValidNumberWithAnOddNumberOfSpaces() {
    #expect(isValidLuhn("234 567 891 234"))
  }

  @Test("valid strings with a non-digit added at the end become invalid", .enabled(if: RUNALL))
  func testValidStringsWithANonDigitAddedAtTheEndBecomeInvalid() {
    #expect(!isValidLuhn("059a"))
  }

  @Test("valid strings with punctuation included become invalid", .enabled(if: RUNALL))
  func testValidStringsWithPunctuationIncludedBecomeInvalid() {
    #expect(!isValidLuhn("055-444-285"))
  }

  @Test("valid strings with symbols included become invalid", .enabled(if: RUNALL))
  func testValidStringsWithSymbolsIncludedBecomeInvalid() {
    #expect(!isValidLuhn("055# 444$ 285"))
  }

  @Test("single zero with space is invalid", .enabled(if: RUNALL))
  func testSingleZeroWithSpaceIsInvalid() {
    #expect(!isValidLuhn(" 0"))
  }

  @Test("more than a single zero is valid", .enabled(if: RUNALL))
  func testMoreThanASingleZeroIsValid() {
    #expect(isValidLuhn("0000 0"))
  }

  @Test("input digit 9 is correctly converted to output digit 9", .enabled(if: RUNALL))
  func testInputDigit9IsCorrectlyConvertedToOutputDigit9() {
    #expect(isValidLuhn("091"))
  }

  @Test("very long input is valid", .enabled(if: RUNALL))
  func testVeryLongInputIsValid() {
    #expect(isValidLuhn("9999999999 9999999999 9999999999 9999999999"))
  }

  @Test("valid luhn with an odd number of digits and non zero first digit", .enabled(if: RUNALL))
  func testValidLuhnWithAnOddNumberOfDigitsAndNonZeroFirstDigit() {
    #expect(isValidLuhn("109"))
  }

  @Test("using ascii value for non-doubled non-digit isn't allowed", .enabled(if: RUNALL))
  func testUsingAsciiValueForNonDoubledNonDigitIsntAllowed() {
    #expect(!isValidLuhn("055b 444 285"))
  }

  @Test("using ascii value for doubled non-digit isn't allowed", .enabled(if: RUNALL))
  func testUsingAsciiValueForDoubledNonDigitIsntAllowed() {
    #expect(!isValidLuhn(":9"))
  }

  @Test(
    "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed",
    .enabled(if: RUNALL))
  func testNonNumericNonSpaceCharInTheMiddleWithASumThatsDivisibleBy10IsntAllowed() {
    #expect(!isValidLuhn("59%59"))
  }
}
