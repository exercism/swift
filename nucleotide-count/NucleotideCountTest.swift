import XCTest

class NucleotideCountTests: XCTestCase
{
    func testEmptyDNAStringHasNoAdenosine() {
        let dna = DNA(strand: "")!
        let result = dna.count("A")
        let expected = 0
        XCTAssertEqual(result, expected)
    }
    
    // An initializer defined with init can be made failable by adding a ? or a ! after the init
    func testEmptyDNAStringHasNoNucleotides() {
        let dna = DNA(strand: "")!
        let results = dna.nucleotideCounts
        let expected:[Nucleobase:Int] = [ .Adenine: 0, .Thymine: 0, .Cytosine: 0 , .Guanine : 0 ]
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
        let results = dna.nucleotideCounts
        let expected:[Nucleobase:Int] = [ .Adenine: 0, .Thymine: 0, .Cytosine: 0 , .Guanine : 8 ]
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
        var result = dna.count("T")
        result = dna.count("T")
        let expected = 2
        XCTAssertEqual(result, expected)
    }
    
    func testValidatesDNA() {
        XCTAssert(DNA(strand: "John") == nil )
    }
    
    func testCountsAllNucleotides() {
        let longStrand = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
        let dna = DNA(strand: longStrand)!
        let results = dna.nucleotideCounts
        let expected:[Nucleobase:Int] = [ .Adenine: 20, .Thymine: 21, .Cytosine: 12 , .Guanine : 17 ]
        XCTAssertEqual(results, expected)
    }
}