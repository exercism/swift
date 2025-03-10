import Foundation
import Testing

@testable import LargestSeriesProduct

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct LargestSeriesProductTests {

  @Test("finds the largest product if span equals length")
  func testFindsTheLargestProductIfSpanEqualsLength() {
    #expect(try! NumberSeries("29").largestProduct(2) == 18)
  }

  @Test("can find the largest product of 2 with numbers in order", .enabled(if: RUNALL))
  func testCanFindTheLargestProductOf2WithNumbersInOrder() {
    #expect(try! NumberSeries("0123456789").largestProduct(2) == 72)
  }

  @Test("can find the largest product of 2", .enabled(if: RUNALL))
  func testCanFindTheLargestProductOf2() {
    #expect(try! NumberSeries("576802143").largestProduct(2) == 48)
  }

  @Test("can find the largest product of 3 with numbers in order", .enabled(if: RUNALL))
  func testCanFindTheLargestProductOf3WithNumbersInOrder() {
    #expect(try! NumberSeries("0123456789").largestProduct(3) == 504)
  }

  @Test("can find the largest product of 3", .enabled(if: RUNALL))
  func testCanFindTheLargestProductOf3() {
    #expect(try! NumberSeries("1027839564").largestProduct(3) == 270)
  }

  @Test("can find the largest product of 5 with numbers in order", .enabled(if: RUNALL))
  func testCanFindTheLargestProductOf5WithNumbersInOrder() {
    #expect(try! NumberSeries("0123456789").largestProduct(5) == 15120)
  }

  @Test("can get the largest product of a big number", .enabled(if: RUNALL))
  func testCanGetTheLargestProductOfABigNumber() {
    #expect(
      try! NumberSeries("73167176531330624919225119674426574742355349194934").largestProduct(6)
        == 23520)
  }

  @Test("reports zero if the only digits are zero", .enabled(if: RUNALL))
  func testReportsZeroIfTheOnlyDigitsAreZero() {
    #expect(try! NumberSeries("0000").largestProduct(2) == 0)
  }

  @Test("reports zero if all spans include zero", .enabled(if: RUNALL))
  func testReportsZeroIfAllSpansIncludeZero() {
    #expect(try! NumberSeries("99099").largestProduct(3) == 0)
  }

  @Test("rejects span longer than string length", .enabled(if: RUNALL))
  func testRejectsSpanLongerThanStringLength() {
    #expect(
      throws:
        NumberSeriesError.spanLongerThanInput
    ) { try NumberSeries("123").largestProduct(4) }
  }

  @Test("rejects empty string and nonzero span", .enabled(if: RUNALL))
  func testRejectsEmptyStringAndNonzeroSpan() {
    #expect(
      throws:
        NumberSeriesError.spanLongerThanInput
    ) { try NumberSeries("").largestProduct(1) }
  }

  @Test("rejects invalid character in digits", .enabled(if: RUNALL))
  func testRejectsInvalidCharacterInDigits() {
    #expect(
      throws:
        NumberSeriesError.invalidCharacter
    ) { try NumberSeries("1234a5").largestProduct(2) }
  }

  @Test("rejects negative span", .enabled(if: RUNALL))
  func testRejectsNegativeSpan() {
    #expect(
      throws:
        NumberSeriesError.spanIsZeroOrNegative
    ) { try NumberSeries("12345").largestProduct(-1) }
  }
}
