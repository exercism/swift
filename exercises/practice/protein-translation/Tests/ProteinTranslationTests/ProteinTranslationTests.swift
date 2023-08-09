import XCTest

@testable import ProteinTranslation

class ProteinTranslationTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyRnaSequenceResultsInNoProteins() {
    XCTAssertEqual([], try! translationOfRNA(rna: ""))
  }

  func testMethionineRnaSequence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Methionine"], try! translationOfRNA(rna: "AUG"))
  }

  func testPhenylalanineRnaSequence1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Phenylalanine"], try! translationOfRNA(rna: "UUU"))
  }

  func testPhenylalanineRnaSequence2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Phenylalanine"], try! translationOfRNA(rna: "UUC"))
  }

  func testLeucineRnaSequence1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Leucine"], try! translationOfRNA(rna: "UUA"))
  }

  func testLeucineRnaSequence2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Leucine"], try! translationOfRNA(rna: "UUG"))
  }

  func testSerineRnaSequence1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Serine"], try! translationOfRNA(rna: "UCU"))
  }

  func testSerineRnaSequence2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Serine"], try! translationOfRNA(rna: "UCC"))
  }

  func testSerineRnaSequence3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Serine"], try! translationOfRNA(rna: "UCA"))
  }

  func testSerineRnaSequence4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Serine"], try! translationOfRNA(rna: "UCG"))
  }

  func testTyrosineRnaSequence1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Tyrosine"], try! translationOfRNA(rna: "UAU"))
  }

  func testTyrosineRnaSequence2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Tyrosine"], try! translationOfRNA(rna: "UAC"))
  }

  func testCysteineRnaSequence1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Cysteine"], try! translationOfRNA(rna: "UGU"))
  }

  func testCysteineRnaSequence2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Cysteine"], try! translationOfRNA(rna: "UGC"))
  }

  func testTryptophanRnaSequence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Tryptophan"], try! translationOfRNA(rna: "UGG"))
  }

  func testStopCodonRnaSequence1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual([], try! translationOfRNA(rna: "UAA"))
  }

  func testStopCodonRnaSequence2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual([], try! translationOfRNA(rna: "UAG"))
  }

  func testStopCodonRnaSequence3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual([], try! translationOfRNA(rna: "UGA"))
  }

  func testSequenceOfTwoProteinCodonsTranslatesIntoProteins() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Phenylalanine", "Phenylalanine"], try! translationOfRNA(rna: "UUUUUU"))
  }

  func testSequenceOfTwoDifferentProteinCodonsTranslatesIntoProteins() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Leucine", "Leucine"], try! translationOfRNA(rna: "UUAUUG"))
  }

  func testTranslateRnaStrandIntoCorrectProteinList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      ["Methionine", "Phenylalanine", "Tryptophan"], try! translationOfRNA(rna: "AUGUUUUGG"))
  }

  func testTranslationStopsIfStopCodonAtBeginningOfSequence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual([], try! translationOfRNA(rna: "UAGUGG"))
  }

  func testTranslationStopsIfStopCodonAtEndOfTwoCodonSequence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Tryptophan"], try! translationOfRNA(rna: "UGGUAG"))
  }

  func testTranslationStopsIfStopCodonAtEndOfThreeCodonSequence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Methionine", "Phenylalanine"], try! translationOfRNA(rna: "AUGUUUUAA"))
  }

  func testTranslationStopsIfStopCodonInMiddleOfThreeCodonSequence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Tryptophan"], try! translationOfRNA(rna: "UGGUAGUGG"))
  }

  func testTranslationStopsIfStopCodonInMiddleOfSixCodonSequence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      ["Tryptophan", "Cysteine", "Tyrosine"], try! translationOfRNA(rna: "UGGUGUUAUUAAUGGUUU"))
  }

  func testNonExistingCodonCantTranslate() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try translationOfRNA(rna: "AAA")) { error in
      XCTAssertEqual(error as? TranslationError, TranslationError.invalidCodon)
    }
  }

  func testUnknownAminoAcidsNotPartOfACodonCantTranslate() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try translationOfRNA(rna: "XYZ")) { error in
      XCTAssertEqual(error as? TranslationError, TranslationError.invalidCodon)
    }
  }

  func testIncompleteRnaSequenceCantTranslate() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try translationOfRNA(rna: "AUGU")) { error in
      XCTAssertEqual(error as? TranslationError, TranslationError.invalidCodon)
    }
  }

  func testIncompleteRnaSequenceCanTranslateIfValidUntilAStopCodon() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(["Phenylalanine", "Phenylalanine"], try! translationOfRNA(rna: "UUCUUCUAAUGGU"))
  }
}
