import XCTest
@testable import RnaTranscription

class RnaTranscriptionTests: XCTestCase {
    func testRnaComplementOfCytosineIsGuanine() {
        XCTAssertEqual("G", try Nucleotide("C").complementOfDNA())
    }

    func testRnaComplementOfGuanineIsCytosine() {
        XCTAssertEqual("C", try Nucleotide("G").complementOfDNA())
    }

    func testRnaComplementOfThymineIsAdenine() {
        XCTAssertEqual("A", try Nucleotide("T").complementOfDNA())
    }

    func testRnaComplementOfAdenineIsUracil() {
        XCTAssertEqual("U", try Nucleotide("A").complementOfDNA())
    }

    func testRnaComplement() {
        XCTAssertEqual("UGCACCAGAAUU", try Nucleotide("ACGTGGTCTTAA").complementOfDNA())
    }
    
    func testInvalidRnaComplementOfUracil() {
        XCTAssertThrowsError(try Nucleotide("U").complementOfDNA())
        
//        XCTAssertThrowsError(try Nucleotide("U").complementOfDNA() { (error) -> Void in
//                XCTAssertEqual(error as? TranscriptionError, TranscriptionError.InvalidNucleotide)
//            })
    }
    
    func testInvalidRnaComplementOfXXX() {
        XCTAssertThrowsError(try Nucleotide("XXX").complementOfDNA())
    }
    
    func testInvalidRnaComplementOfACGTXXXCTTAA() {
        XCTAssertThrowsError(try Nucleotide("ACGTXXXCTTAA").complementOfDNA())
    }
    
    static var allTests: [(String, (RnaTranscriptionTests) -> () throws -> Void)] {
        return [
            ("testRnaComplementOfCytosineIsGuanine", testRnaComplementOfCytosineIsGuanine),
            ("testRnaComplementOfGuanineIsCytosine", testRnaComplementOfGuanineIsCytosine),
            ("testRnaComplementOfThymineIsAdenine", testRnaComplementOfThymineIsAdenine),
            ("testRnaComplementOfAdenineIsUracil", testRnaComplementOfAdenineIsUracil),
            ("testRnaComplement", testRnaComplement),
            ("testInvalidRnaComplementOfUracil", testInvalidRnaComplementOfUracil),
            ("testInvalidRnaComplementOfXXX", testInvalidRnaComplementOfXXX),
            ("testInvalidRnaComplementOfACGTXXXCTTAA", testInvalidRnaComplementOfACGTXXXCTTAA)
        ]
    }
}
