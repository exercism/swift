import XCTest
@testable import NucleotideCount

class NucleotideCountTests: XCTestCase {
    func testEmptyDNAStringHasNoAdenosine() {
        guard let dna = DNA(strand: "") else {
            XCTAssert(false, "Empty strands are valid strands and should not return nil")
            return
        }
        let result = dna.count("A")
        let expected = 0
        XCTAssertEqual(result, expected)
    }

    func testEmptyDNAStringHasNoNucleotides() {
        guard let dna = DNA(strand: "") else {
            XCTAssert(false, "Empty strands are valid strands and should not return nil")
            return
        }
        let results = dna.counts()
        let expected = ["T": 0, "A": 0, "C": 0, "G": 0]
        XCTAssertEqual(results, expected)
    }

    func testSingleNoNucleotideStrand() {
        guard let dna = DNA(strand: "T") else {
            XCTAssert(false, "Valid strands should not return nil")
            return
        }
        let results = dna.counts()
        let expected = ["T": 1, "A": 0, "C": 0, "G": 0]
        XCTAssertEqual(results, expected)
    }

    func testRepetitiveCytidineGetsCounted() {
        guard let dna = DNA(strand: "CCCCC") else {
            XCTAssert(false, "Valid strands should not return nil")
            return
        }
        let result = dna.count("C")
        let expected = 5
        XCTAssertEqual(result, expected)
    }

    func testRepetitiveSequenceHasOnlyGuanosine() {
        guard let dna = DNA(strand: "GGGGGGGG") else {
            XCTAssert(false, "Valid strands should not return nil")
            return
        }
        let results = dna.counts()
        let expected = [ "A": 0, "T": 0, "C": 0, "G": 8 ]
        XCTAssertEqual(results, expected)
    }

    func testCountsByThymidine() {
        guard let dna = DNA(strand: "GGGGGTAACCCGG") else {
            XCTAssert(false, "Valid strands should not return nil")
            return
        }
        let result = dna.count("T")
        let expected = 1
        XCTAssertEqual(result, expected)
    }

    func testCountsANucleotideOnlyOnce() {
        guard let dna = DNA(strand: "CGATTGGG") else {
            XCTAssert(false, "Valid strands should not return nil")
            return
        }
        let result = dna.count("T")
        let expected = 2
        XCTAssertEqual(result, expected)
    }

    func testValidatesDNA() {
        XCTAssertNil(DNA(strand: "John"))
    }

    func testValidatesDNAWithValidPortion() {
        XCTAssertNil(DNA(strand: "CATTAX"), "All characters in a strand need to be valid nucleotides.")
    }

    func testCountsAllNucleotides() {
        let longStrand = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
        guard let dna = DNA(strand: longStrand) else {
            XCTAssert(false, "Valid strands should not return nil")
            return
        }
        let results = dna.counts()
        let expected = [ "A": 20, "T": 21, "C": 12, "G": 17 ]
        XCTAssertEqual(results, expected)
    }

    static var allTests: [(String, (NucleotideCountTests) -> () throws -> Void)] {
        return [
            ("testEmptyDNAStringHasNoAdenosine", testEmptyDNAStringHasNoAdenosine),
            ("testEmptyDNAStringHasNoNucleotides", testEmptyDNAStringHasNoNucleotides),
            ("testSingleNoNucleotideStrand", testSingleNoNucleotideStrand),
            ("testRepetitiveCytidineGetsCounted", testRepetitiveCytidineGetsCounted),
            ("testRepetitiveSequenceHasOnlyGuanosine", testRepetitiveSequenceHasOnlyGuanosine),
            ("testCountsByThymidine", testCountsByThymidine),
            ("testCountsANucleotideOnlyOnce", testCountsANucleotideOnlyOnce),
            ("testValidatesDNA", testValidatesDNA),
            ("testCountsAllNucleotides", testCountsAllNucleotides),
            ("testValidatesDNAWithValidPortion", testValidatesDNAWithValidPortion),
        ]
    }
}
