import XCTest

class hammingTests: XCTestCase {
    func testNoDifferenceBetweenEmptyStrands() {
        let result = Hamming.compute("", against: "")
        let expected = 0
        XCTAssertEqual(expected, result)
    }
    
    func testNoDifferenceBetweenIdenticalStrands() {
        let result = Hamming.compute("GGACTGA", against:"GGACTGA")
        let expected = 0
        XCTAssertEqual(expected,result)
    }

    func testCompleteHammingDistanceInSmallStrand() {
        let result = Hamming.compute("ACT", against: "GGA")
        let expected = 3
        XCTAssertEqual(expected,result)
    }

    func testSmallHammingDistanceInMiddleSomewhere() {
        let result = Hamming.compute("GGACG", against:"GGTCG")
        let expected = 1
        XCTAssertEqual(expected,result)
    }
    
    func testLargerDistance() {
        let result = Hamming.compute("ACCAGGG", against:"ACTATGG")
        let expected = 2
        XCTAssertEqual(expected,result)
    }
    
    func testIgnoreExtraLengthOnOtherStrandWhenLonger() {
        let result = Hamming.compute("AAACTAGGGG", against:"AGGCTAGCGGTAGGAC")
        let expected = 3
        XCTAssertEqual(expected,result)
    }
    
    func testIgnoresExtraLengthOnOriginalStrandWhenLonger() {
        let result = Hamming.compute("GACTACGGACAGGGTAGGGAAT", against:"GACATCGCACACC")
        let expected = 5
        XCTAssertEqual(expected,result)
    }
}
