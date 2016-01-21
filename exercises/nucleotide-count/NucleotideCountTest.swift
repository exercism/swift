import XCTest

// Apple Swift version 2.1

class NucleotideCountTests: XCTestCase
{
    func testEmptyDNAStringHasNoAdenosine() {
        let dna = DNA(strand: "")!
        let result = dna.count("A")
        let expected = 0
        XCTAssertEqual(result, expected)
    }
    
    func testEmptyDNAStringHasNoNucleotides() {
        let dna = DNA(strand: "")!
        let results = dna.counts()
        let expected = ["T": 0, "A": 0, "C": 0, "G": 0]
        XCTAssertEqual(results, expected)
    }
    
    func testRepetitiveCytidineGetsCounted() {
        let dna = DNA(strand: "CCCCC")!
        let result = dna.count("C")
        let expected = 5
        XCTAssertEqual(result, expected)
    }
    
    func testRepetitiveSequenceHasOnlyGuanosine() {
        let dna = DNA(strand: "GGGGGGGG")!
        let results = dna.counts()
        let expected = [ "A": 0, "T": 0, "C": 0 , "G": 8 ]
        XCTAssertEqual(results, expected)
    }
    
    func testCountsByThymidine() {
        let dna = DNA(strand: "GGGGGTAACCCGG")!
        let result = dna.count("T")
        let expected = 1
        XCTAssertEqual(result, expected)
    }
    
    func testCountsANucleotideOnlyOnce() {
        let dna = DNA(strand: "CGATTGGG")!
        let result = dna.count("T")
        let expected = 2
        XCTAssertEqual(result, expected)
    }
    
    func testValidatesDNA() {
        XCTAssert(DNA(strand: "John") == nil )
    }
    
    func testCountsAllNucleotides() {
        let longStrand = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
        let dna = DNA(strand: longStrand)!
        let results = dna.counts()
        let expected = [ "A": 20, "T": 21,"C": 12 , "G" : 17 ]
        XCTAssertEqual(results, expected)
    }
}