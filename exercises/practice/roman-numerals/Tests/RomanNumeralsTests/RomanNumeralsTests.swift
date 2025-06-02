import Foundation
import Testing

@testable import RomanNumerals

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct RomanNumeralsTests {

  @Test("1 is I")
  func test1IsI() {
    #expect(1.toRomanNumeral() == "I")
  }

  @Test("2 is II", .enabled(if: RUNALL))
  func test2IsIi() {
    #expect(2.toRomanNumeral() == "II")
  }

  @Test("3 is III", .enabled(if: RUNALL))
  func test3IsIii() {
    #expect(3.toRomanNumeral() == "III")
  }

  @Test("4 is IV", .enabled(if: RUNALL))
  func test4IsIv() {
    #expect(4.toRomanNumeral() == "IV")
  }

  @Test("5 is V", .enabled(if: RUNALL))
  func test5IsV() {
    #expect(5.toRomanNumeral() == "V")
  }

  @Test("6 is VI", .enabled(if: RUNALL))
  func test6IsVi() {
    #expect(6.toRomanNumeral() == "VI")
  }

  @Test("9 is IX", .enabled(if: RUNALL))
  func test9IsIx() {
    #expect(9.toRomanNumeral() == "IX")
  }

  @Test("16 is XVI", .enabled(if: RUNALL))
  func test16IsXvi() {
    #expect(16.toRomanNumeral() == "XVI")
  }

  @Test("27 is XXVII", .enabled(if: RUNALL))
  func test27IsXxvii() {
    #expect(27.toRomanNumeral() == "XXVII")
  }

  @Test("48 is XLVIII", .enabled(if: RUNALL))
  func test48IsXlviii() {
    #expect(48.toRomanNumeral() == "XLVIII")
  }

  @Test("49 is XLIX", .enabled(if: RUNALL))
  func test49IsXlix() {
    #expect(49.toRomanNumeral() == "XLIX")
  }

  @Test("59 is LIX", .enabled(if: RUNALL))
  func test59IsLix() {
    #expect(59.toRomanNumeral() == "LIX")
  }

  @Test("66 is LXVI", .enabled(if: RUNALL))
  func test66IsLxvi() {
    #expect(66.toRomanNumeral() == "LXVI")
  }

  @Test("93 is XCIII", .enabled(if: RUNALL))
  func test93IsXciii() {
    #expect(93.toRomanNumeral() == "XCIII")
  }

  @Test("141 is CXLI", .enabled(if: RUNALL))
  func test141IsCxli() {
    #expect(141.toRomanNumeral() == "CXLI")
  }

  @Test("163 is CLXIII", .enabled(if: RUNALL))
  func test163IsClxiii() {
    #expect(163.toRomanNumeral() == "CLXIII")
  }

  @Test("166 is CLXVI", .enabled(if: RUNALL))
  func test166IsClxvi() {
    #expect(166.toRomanNumeral() == "CLXVI")
  }

  @Test("402 is CDII", .enabled(if: RUNALL))
  func test402IsCdii() {
    #expect(402.toRomanNumeral() == "CDII")
  }

  @Test("575 is DLXXV", .enabled(if: RUNALL))
  func test575IsDlxxv() {
    #expect(575.toRomanNumeral() == "DLXXV")
  }

  @Test("666 is DCLXVI", .enabled(if: RUNALL))
  func test666IsDclxvi() {
    #expect(666.toRomanNumeral() == "DCLXVI")
  }

  @Test("911 is CMXI", .enabled(if: RUNALL))
  func test911IsCmxi() {
    #expect(911.toRomanNumeral() == "CMXI")
  }

  @Test("1024 is MXXIV", .enabled(if: RUNALL))
  func test1024IsMxxiv() {
    #expect(1024.toRomanNumeral() == "MXXIV")
  }

  @Test("1666 is MDCLXVI", .enabled(if: RUNALL))
  func test1666IsMdclxvi() {
    #expect(1666.toRomanNumeral() == "MDCLXVI")
  }

  @Test("3000 is MMM", .enabled(if: RUNALL))
  func test3000IsMmm() {
    #expect(3000.toRomanNumeral() == "MMM")
  }

  @Test("3001 is MMMI", .enabled(if: RUNALL))
  func test3001IsMmmi() {
    #expect(3001.toRomanNumeral() == "MMMI")
  }

  @Test("3888 is MMMDCCCLXXXVIII", .enabled(if: RUNALL))
  func test3888IsMmmdccclxxxviii() {
    #expect(3888.toRomanNumeral() == "MMMDCCCLXXXVIII")
  }

  @Test("3999 is MMMCMXCIX", .enabled(if: RUNALL))
  func test3999IsMmmcmxcix() {
    #expect(3999.toRomanNumeral() == "MMMCMXCIX")
  }
}
