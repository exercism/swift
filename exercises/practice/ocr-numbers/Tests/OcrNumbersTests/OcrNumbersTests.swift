import Foundation
import Testing

@testable import OcrNumbers

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct OcrNumbersTests {

  @Test("Recognizes 0")
  func testRecognizes0() {
    let input = [" _ ", "| |", "|_|", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "0")
  }

  @Test("Recognizes 1", .enabled(if: RUNALL))
  func testRecognizes1() {
    let input = ["   ", "  |", "  |", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "1")
  }

  @Test("Unreadable but correctly sized inputs return ?", .enabled(if: RUNALL))
  func testUnreadableButCorrectlySizedInputsReturn() {
    let input = ["   ", "  _", "  |", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "?")
  }

  @Test(
    "Input with a number of lines that is not a multiple of four raises an error",
    .enabled(if: RUNALL))
  func testInputWithANumberOfLinesThatIsNotAMultipleOfFourRaisesAnError() {
    let input = [" _ ", "| |", "   "]
    #expect(throws: OcrNumberError.invalidInput) {
      try OcrNumber.convert(rows: input)
    }
  }

  @Test(
    "Input with a number of columns that is not a multiple of three raises an error",
    .enabled(if: RUNALL))
  func testInputWithANumberOfColumnsThatIsNotAMultipleOfThreeRaisesAnError() {
    let input = ["    ", "   |", "   |", "    "]
    #expect(throws: OcrNumberError.invalidInput) {
      try OcrNumber.convert(rows: input)
    }
  }

  @Test("Recognizes 110101100", .enabled(if: RUNALL))
  func testRecognizes110101100() {
    let input = [
      "       _     _        _  _ ", "  |  || |  || |  |  || || |", "  |  ||_|  ||_|  |  ||_||_|",
      "                           ",
    ]
    #expect(try! OcrNumber.convert(rows: input) == "110101100")
  }

  @Test("Garbled numbers in a string are replaced with ?", .enabled(if: RUNALL))
  func testGarbledNumbersInAStringAreReplacedWith() {
    let input = [
      "       _     _           _ ", "  |  || |  || |     || || |", "  |  | _|  ||_|  |  ||_||_|",
      "                           ",
    ]
    #expect(try! OcrNumber.convert(rows: input) == "11?10?1?0")
  }

  @Test("Recognizes 2", .enabled(if: RUNALL))
  func testRecognizes2() {
    let input = [" _ ", " _|", "|_ ", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "2")
  }

  @Test("Recognizes 3", .enabled(if: RUNALL))
  func testRecognizes3() {
    let input = [" _ ", " _|", " _|", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "3")
  }

  @Test("Recognizes 4", .enabled(if: RUNALL))
  func testRecognizes4() {
    let input = ["   ", "|_|", "  |", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "4")
  }

  @Test("Recognizes 5", .enabled(if: RUNALL))
  func testRecognizes5() {
    let input = [" _ ", "|_ ", " _|", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "5")
  }

  @Test("Recognizes 6", .enabled(if: RUNALL))
  func testRecognizes6() {
    let input = [" _ ", "|_ ", "|_|", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "6")
  }

  @Test("Recognizes 7", .enabled(if: RUNALL))
  func testRecognizes7() {
    let input = [" _ ", "  |", "  |", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "7")
  }

  @Test("Recognizes 8", .enabled(if: RUNALL))
  func testRecognizes8() {
    let input = [" _ ", "|_|", "|_|", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "8")
  }

  @Test("Recognizes 9", .enabled(if: RUNALL))
  func testRecognizes9() {
    let input = [" _ ", "|_|", " _|", "   "]
    #expect(try! OcrNumber.convert(rows: input) == "9")
  }

  @Test("Recognizes string of decimal numbers", .enabled(if: RUNALL))
  func testRecognizesStringOfDecimalNumbers() {
    let input = [
      "    _  _     _  _  _  _  _  _ ", "  | _| _||_||_ |_   ||_||_|| |",
      "  ||_  _|  | _||_|  ||_| _||_|", "                              ",
    ]
    #expect(try! OcrNumber.convert(rows: input) == "1234567890")
  }

  @Test(
    "Numbers separated by empty lines are recognized. Lines are joined by commas.",
    .enabled(if: RUNALL))
  func testNumbersSeparatedByEmptyLinesAreRecognizedLinesAreJoinedByCommas() {
    let input = [
      "    _  _ ", "  | _| _|", "  ||_  _|", "         ", "    _  _ ", "|_||_ |_ ", "  | _||_|",
      "         ", " _  _  _ ", "  ||_||_|", "  ||_| _|", "         ",
    ]
    #expect(try! OcrNumber.convert(rows: input) == "123,456,789")
  }
}
