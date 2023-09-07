import XCTest

@testable import OcrNumbers

class OcrNumbersTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testRecognizes0() {
    let input = [" _ ", "| |", "|_|", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "0")
  }

  func testRecognizes1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["   ", "  |", "  |", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "1")
  }

  func testUnreadableButCorrectlySizedInputsReturn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["   ", "  _", "  |", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "?")
  }

  func testInputWithANumberOfLinesThatIsNotAMultipleOfFourRaisesAnError() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" _ ", "| |", "   "]
    XCTAssertThrowsError(try OcrNumber.convert(rows: input)) {
      XCTAssertEqual($0 as? OcrNumberError, .invalidInput)
    }
  }

  func testInputWithANumberOfColumnsThatIsNotAMultipleOfThreeRaisesAnError() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["    ", "   |", "   |", "    "]
    XCTAssertThrowsError(try OcrNumber.convert(rows: input)) {
      XCTAssertEqual($0 as? OcrNumberError, .invalidInput)
    }
  }

  func testRecognizes110101100() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [
      "       _     _        _  _ ", "  |  || |  || |  |  || || |", "  |  ||_|  ||_|  |  ||_||_|",
      "                           ",
    ]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "110101100")
  }

  func testGarbledNumbersInAStringAreReplacedWith() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [
      "       _     _           _ ", "  |  || |  || |     || || |", "  |  | _|  ||_|  |  ||_||_|",
      "                           ",
    ]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "11?10?1?0")
  }

  func testRecognizes2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" _ ", " _|", "|_ ", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "2")
  }

  func testRecognizes3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" _ ", " _|", " _|", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "3")
  }

  func testRecognizes4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["   ", "|_|", "  |", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "4")
  }

  func testRecognizes5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" _ ", "|_ ", " _|", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "5")
  }

  func testRecognizes6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" _ ", "|_ ", "|_|", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "6")
  }

  func testRecognizes7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" _ ", "  |", "  |", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "7")
  }

  func testRecognizes8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" _ ", "|_|", "|_|", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "8")
  }

  func testRecognizes9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [" _ ", "|_|", " _|", "   "]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "9")
  }

  func testRecognizesStringOfDecimalNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [
      "    _  _     _  _  _  _  _  _ ", "  | _| _||_||_ |_   ||_||_|| |",
      "  ||_  _|  | _||_|  ||_| _||_|", "                              ",
    ]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "1234567890")
  }

  func testNumbersSeparatedByEmptyLinesAreRecognizedLinesAreJoinedByCommas() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [
      "    _  _ ", "  | _| _|", "  ||_  _|", "         ", "    _  _ ", "|_||_ |_ ", "  | _||_|",
      "         ", " _  _  _ ", "  ||_||_|", "  ||_| _|", "         ",
    ]
    XCTAssertEqual(try! OcrNumber.convert(rows: input), "123,456,789")
  }
}
