import Foundation
import XCTest

class RnaTranscriptionTest: XCTestCase {
    
func testRnaComplementOfCytosineIsGuanine() {
    XCTAssertEqual("G", Nucleotide("C").complementOfDNA)
    }

func testRnaComplementOfGuanineIsCytosine() {
    XCTAssertEqual("C", Nucleotide("G").complementOfDNA)
    }

func testRnaComplementOfThymineIsAdenine() {
    XCTAssertEqual("A", Nucleotide("T").complementOfDNA)
    }

func testRnaComplementOfAdenineIsUracil() {
    XCTAssertEqual("U", Nucleotide("A").complementOfDNA)
    }

func testRnaComplement() {
    XCTAssertEqual("UGCACCAGAAUU", Nucleotide("ACGTGGTCTTAA").complementOfDNA)
    }

func testDnaComplementOfCytosineIsGuanine() {
    XCTAssertEqual("G", Nucleotide("C").complementOfRNA)
    }

func testDnaComplementOfGuanineIsCytosine() {
    XCTAssertEqual("C", Nucleotide("G").complementOfRNA)
    }

func testDnaComplementOfUracilIsAdenine() {
    XCTAssertEqual("A", Nucleotide("U").complementOfRNA)
    }

func testDnaComplementOfAdenineIsThymine() {
    XCTAssertEqual("T", Nucleotide("A").complementOfRNA)
    }

func testDnaComplement() {
    XCTAssertEqual("ACTTGGGCTGTAC", Nucleotide("UGAACCCGACAUG").complementOfRNA)
    }

}
