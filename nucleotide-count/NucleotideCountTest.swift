import XCTest

class NucleotideCountTest: XCTestCase
{
    func testEmptyDNAStringHasNoAdenosine() {
        let dna = DNA.withStrand("")!
        let result = dna.count("A")
        let expected = 0
        XCTAssertEqualObjects(result, expected)
    }
    
    func testEmptyDNAStringHasNoNucleotides() {
        let dna = DNA.withStrand("")!
        let results = dna.nucleotideCounts
        let expected = [ "A": 0, "T" : 0, "C" : 0, "G" : 0 ]
        XCTAssertEqualObjects(results, expected)
    }
    
    func testRepetitiveCytidineGetsCounted() {
        let dna = DNA.withStrand("CCCCC")!
        let result = dna.count("C")!
        let expected = 5
        XCTAssertEqual(result, expected)
    }
    
    func testRepetitiveSequenceHasOnlyGuanosine() {
        let dna = DNA.withStrand("GGGGGGGG")!
        let results = dna.nucleotideCounts
        let expected = [ "A": 0, "T" : 0, "C" : 0, "G" : 8 ]
        XCTAssertEqualObjects(results, expected)
    }
    
    func testCountsByThymidine() {
        let dna = DNA.withStrand("GGGGGTAACCCGG")!
        let result = dna.count("T")!
        let expected = 1
        XCTAssertEqualObjects(result, expected)
    }
    
    func testCountsANucleotideOnlyOnce() {
        let dna = DNA.withStrand("CGATTGGG")!
        let result = dna.count("T")!
        let expected = 2
        XCTAssertEqualObjects(result, expected)
    }
    
    func testDNAHasNoUracil() {
        let dna = DNA.withStrand("GATTACA")!
        let result = dna.count("U")
        XCTAssertNil(result)
    }
    
    func testValidatesDNANotRNA() {
        let dna = DNA.withStrand("ACGU")
        XCTAssertNil(dna)
    }
    
    func testValidatesDNA() {
        let dna = DNA.withStrand("John")
        XCTAssertNil(dna)
    }
    
    func testCountsAllNucleotides() {
        var longStrand = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
        let dna = DNA.withStrand(longStrand)!
        let results = dna.nucleotideCounts
        let expected = [ "A": 20, "T" : 21, "C" : 12, "G" : 17 ]
        XCTAssertEqualObjects(results, expected)
    }
}