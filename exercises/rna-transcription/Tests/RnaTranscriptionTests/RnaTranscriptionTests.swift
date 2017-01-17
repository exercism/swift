import XCTest
@testable import RnaTranscription

class RnaTranscriptionTests: XCTestCase {
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

    static var allTests: [(String, (RnaTranscriptionTests) -> () throws -> Void)] {
        return [
            ("testRnaComplementOfCytosineIsGuanine", testRnaComplementOfCytosineIsGuanine),
            ("testRnaComplementOfGuanineIsCytosine", testRnaComplementOfGuanineIsCytosine),
            ("testRnaComplementOfThymineIsAdenine", testRnaComplementOfThymineIsAdenine),
            ("testRnaComplementOfAdenineIsUracil", testRnaComplementOfAdenineIsUracil),
            ("testRnaComplement", testRnaComplement),
        ]
    }
}
