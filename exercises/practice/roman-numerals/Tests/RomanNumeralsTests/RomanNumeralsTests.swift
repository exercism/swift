import XCTest

@testable import RomanNumerals

class RomanNumeralsTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func test1IsI() {
    XCTAssertEqual(1.toRomanNumeral(), "I")
  }

  func test2IsIi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(2.toRomanNumeral(), "II")
  }

  func test3IsIii() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(3.toRomanNumeral(), "III")
  }

  func test4IsIv() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(4.toRomanNumeral(), "IV")
  }

  func test5IsV() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(5.toRomanNumeral(), "V")
  }

  func test6IsVi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(6.toRomanNumeral(), "VI")
  }

  func test9IsIx() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(9.toRomanNumeral(), "IX")
  }

  func test16IsXvi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(16.toRomanNumeral(), "XVI")
  }

  func test27IsXxvii() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(27.toRomanNumeral(), "XXVII")
  }

  func test48IsXlviii() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(48.toRomanNumeral(), "XLVIII")
  }

  func test49IsXlix() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(49.toRomanNumeral(), "XLIX")
  }

  func test59IsLix() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(59.toRomanNumeral(), "LIX")
  }

  func test66IsLxvi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(66.toRomanNumeral(), "LXVI")
  }

  func test93IsXciii() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(93.toRomanNumeral(), "XCIII")
  }

  func test141IsCxli() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(141.toRomanNumeral(), "CXLI")
  }

  func test163IsClxiii() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(163.toRomanNumeral(), "CLXIII")
  }

  func test166IsClxvi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(166.toRomanNumeral(), "CLXVI")
  }

  func test402IsCdii() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(402.toRomanNumeral(), "CDII")
  }

  func test575IsDlxxv() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(575.toRomanNumeral(), "DLXXV")
  }

  func test666IsDclxvi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(666.toRomanNumeral(), "DCLXVI")
  }

  func test911IsCmxi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(911.toRomanNumeral(), "CMXI")
  }

  func test1024IsMxxiv() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(1024.toRomanNumeral(), "MXXIV")
  }

  func test1666IsMdclxvi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(1666.toRomanNumeral(), "MDCLXVI")
  }

  func test3000IsMmm() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(3000.toRomanNumeral(), "MMM")
  }

  func test3001IsMmmi() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(3001.toRomanNumeral(), "MMMI")
  }

  func test3999IsMmmcmxcix() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(3999.toRomanNumeral(), "MMMCMXCIX")
  }
}
