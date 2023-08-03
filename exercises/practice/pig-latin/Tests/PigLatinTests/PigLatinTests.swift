import XCTest

@testable import PigLatin

class PigLatinTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testWordBeginningWithA() {
    XCTAssertEqual(PigLatin.translate("apple"), "appleay")
  }

  func testWordBeginningWithE() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("ear"), "earay")
  }

  func testWordBeginningWithI() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("igloo"), "iglooay")
  }

  func testWordBeginningWithO() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("object"), "objectay")
  }

  func testWordBeginningWithU() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("under"), "underay")
  }

  func testWordBeginningWithAVowelAndFollowedByAQu() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("equal"), "equalay")
  }

  func testWordBeginningWithP() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("pig"), "igpay")
  }

  func testWordBeginningWithK() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("koala"), "oalakay")
  }

  func testWordBeginningWithX() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("xenon"), "enonxay")
  }

  func testWordBeginningWithQWithoutAFollowingU() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("qat"), "atqay")
  }

  func testWordBeginningWithCh() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("chair"), "airchay")
  }

  func testWordBeginningWithQu() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("queen"), "eenquay")
  }

  func testWordBeginningWithQuAndAPrecedingConsonant() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("square"), "aresquay")
  }

  func testWordBeginningWithTh() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("therapy"), "erapythay")
  }

  func testWordBeginningWithThr() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("thrush"), "ushthray")
  }

  func testWordBeginningWithSch() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("school"), "oolschay")
  }

  func testWordBeginningWithYt() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("yttria"), "yttriaay")
  }

  func testWordBeginningWithXr() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("xray"), "xrayay")
  }

  func testYIsTreatedLikeAConsonantAtTheBeginningOfAWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("yellow"), "ellowyay")
  }

  func testYIsTreatedLikeAVowelAtTheEndOfAConsonantCluster() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("rhythm"), "ythmrhay")
  }

  func testYAsSecondLetterInTwoLetterWord() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("my"), "ymay")
  }

  func testAWholePhrase() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(PigLatin.translate("quick fast run"), "ickquay astfay unray")
  }
}
