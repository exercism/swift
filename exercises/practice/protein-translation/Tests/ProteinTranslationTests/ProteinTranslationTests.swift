import Foundation
import Testing

@testable import ProteinTranslation

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ProteinTranslationTests {

  @Test("Empty RNA sequence results in no proteins")
  func testEmptyRnaSequenceResultsInNoProteins() { #expect(try! translationOfRNA(rna: "") == []) }

  @Test("Methionine RNA sequence", .enabled(if: RUNALL))
  func testMethionineRnaSequence() { #expect(try! translationOfRNA(rna: "AUG") == ["Methionine"]) }

  @Test("Phenylalanine RNA sequence 1", .enabled(if: RUNALL))
  func testPhenylalanineRnaSequence1() {
    #expect(try! translationOfRNA(rna: "UUU") == ["Phenylalanine"])
  }

  @Test("Phenylalanine RNA sequence 2", .enabled(if: RUNALL))
  func testPhenylalanineRnaSequence2() {
    #expect(try! translationOfRNA(rna: "UUC") == ["Phenylalanine"])
  }

  @Test("Leucine RNA sequence 1", .enabled(if: RUNALL))
  func testLeucineRnaSequence1() { #expect(try! translationOfRNA(rna: "UUA") == ["Leucine"]) }

  @Test("Leucine RNA sequence 2", .enabled(if: RUNALL))
  func testLeucineRnaSequence2() { #expect(try! translationOfRNA(rna: "UUG") == ["Leucine"]) }

  @Test("Serine RNA sequence 1", .enabled(if: RUNALL))
  func testSerineRnaSequence1() { #expect(try! translationOfRNA(rna: "UCU") == ["Serine"]) }

  @Test("Serine RNA sequence 2", .enabled(if: RUNALL))
  func testSerineRnaSequence2() { #expect(try! translationOfRNA(rna: "UCC") == ["Serine"]) }

  @Test("Serine RNA sequence 3", .enabled(if: RUNALL))
  func testSerineRnaSequence3() { #expect(try! translationOfRNA(rna: "UCA") == ["Serine"]) }

  @Test("Serine RNA sequence 4", .enabled(if: RUNALL))
  func testSerineRnaSequence4() { #expect(try! translationOfRNA(rna: "UCG") == ["Serine"]) }

  @Test("Tyrosine RNA sequence 1", .enabled(if: RUNALL))
  func testTyrosineRnaSequence1() { #expect(try! translationOfRNA(rna: "UAU") == ["Tyrosine"]) }

  @Test("Tyrosine RNA sequence 2", .enabled(if: RUNALL))
  func testTyrosineRnaSequence2() { #expect(try! translationOfRNA(rna: "UAC") == ["Tyrosine"]) }

  @Test("Cysteine RNA sequence 1", .enabled(if: RUNALL))
  func testCysteineRnaSequence1() { #expect(try! translationOfRNA(rna: "UGU") == ["Cysteine"]) }

  @Test("Cysteine RNA sequence 2", .enabled(if: RUNALL))
  func testCysteineRnaSequence2() { #expect(try! translationOfRNA(rna: "UGC") == ["Cysteine"]) }

  @Test("Tryptophan RNA sequence", .enabled(if: RUNALL))
  func testTryptophanRnaSequence() { #expect(try! translationOfRNA(rna: "UGG") == ["Tryptophan"]) }

  @Test("STOP codon RNA sequence 1", .enabled(if: RUNALL))
  func testStopCodonRnaSequence1() { #expect(try! translationOfRNA(rna: "UAA") == []) }

  @Test("STOP codon RNA sequence 2", .enabled(if: RUNALL))
  func testStopCodonRnaSequence2() { #expect(try! translationOfRNA(rna: "UAG") == []) }

  @Test("STOP codon RNA sequence 3", .enabled(if: RUNALL))
  func testStopCodonRnaSequence3() { #expect(try! translationOfRNA(rna: "UGA") == []) }

  @Test("Sequence of two protein codons translates into proteins", .enabled(if: RUNALL))
  func testSequenceOfTwoProteinCodonsTranslatesIntoProteins() {
    #expect(try! translationOfRNA(rna: "UUUUUU") == ["Phenylalanine", "Phenylalanine"])
  }

  @Test("Sequence of two different protein codons translates into proteins", .enabled(if: RUNALL))
  func testSequenceOfTwoDifferentProteinCodonsTranslatesIntoProteins() {
    #expect(try! translationOfRNA(rna: "UUAUUG") == ["Leucine", "Leucine"])
  }

  @Test("Translate RNA strand into correct protein list", .enabled(if: RUNALL))
  func testTranslateRnaStrandIntoCorrectProteinList() {
    #expect(
      try! translationOfRNA(rna: "AUGUUUUGG") == ["Methionine", "Phenylalanine", "Tryptophan"])
  }

  @Test("Translation stops if STOP codon at beginning of sequence", .enabled(if: RUNALL))
  func testTranslationStopsIfStopCodonAtBeginningOfSequence() {
    #expect(try! translationOfRNA(rna: "UAGUGG") == [])
  }

  @Test("Translation stops if STOP codon at end of two-codon sequence", .enabled(if: RUNALL))
  func testTranslationStopsIfStopCodonAtEndOfTwoCodonSequence() {
    #expect(try! translationOfRNA(rna: "UGGUAG") == ["Tryptophan"])
  }

  @Test("Translation stops if STOP codon at end of three-codon sequence", .enabled(if: RUNALL))
  func testTranslationStopsIfStopCodonAtEndOfThreeCodonSequence() {
    #expect(try! translationOfRNA(rna: "AUGUUUUAA") == ["Methionine", "Phenylalanine"])
  }

  @Test("Translation stops if STOP codon in middle of three-codon sequence", .enabled(if: RUNALL))
  func testTranslationStopsIfStopCodonInMiddleOfThreeCodonSequence() {
    #expect(try! translationOfRNA(rna: "UGGUAGUGG") == ["Tryptophan"])
  }

  @Test("Translation stops if STOP codon in middle of six-codon sequence", .enabled(if: RUNALL))
  func testTranslationStopsIfStopCodonInMiddleOfSixCodonSequence() {
    #expect(
      try! translationOfRNA(rna: "UGGUGUUAUUAAUGGUUU") == ["Tryptophan", "Cysteine", "Tyrosine"])
  }

  @Test("Sequence of two non-STOP codons does not translate to a STOP codon", .enabled(if: RUNALL))
  func testSequenceOfTwoNonStopCodonsDoesNotTranslateToAStopCodon() {
    #expect(try! translationOfRNA(rna: "AUGAUG") == ["Methionine", "Methionine"])
  }

  @Test("Non-existing codon can't translate", .enabled(if: RUNALL))
  func testNonExistingCodonCantTranslate() {
    #expect(throws: TranslationError.invalidCodon) {
      try translationOfRNA(rna: "AAA")
    }
  }

  @Test("Unknown amino acids, not part of a codon, can't translate", .enabled(if: RUNALL))
  func testUnknownAminoAcidsNotPartOfACodonCantTranslate() {
    #expect(throws: TranslationError.invalidCodon) {
      try translationOfRNA(rna: "XYZ")
    }
  }

  @Test("Incomplete RNA sequence can't translate", .enabled(if: RUNALL))
  func testIncompleteRnaSequenceCantTranslate() {
    #expect(throws: TranslationError.invalidCodon) {
      try translationOfRNA(rna: "AUGU")
    }
  }

  @Test("Incomplete RNA sequence can translate if valid until a STOP codon", .enabled(if: RUNALL))
  func testIncompleteRnaSequenceCanTranslateIfValidUntilAStopCodon() {
    #expect(try! translationOfRNA(rna: "UUCUUCUAAUGGU") == ["Phenylalanine", "Phenylalanine"])
  }
}
