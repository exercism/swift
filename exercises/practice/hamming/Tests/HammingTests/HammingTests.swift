import XCTest
@testable import Hamming

class HammingTests: XCTestCase {
    func testNoDifferenceBetweenEmptyStrands() {
        let result = Hamming.compute("", against: "")!
        let expected = 0
        XCTAssertEqual(expected, result)
    }

    func testNoDifferenceBetweenIdenticalStrands() {
        let result = Hamming.compute("GGACTGA", against:"GGACTGA")!
        let expected = 0
        XCTAssertEqual(expected, result)
    }

    func testCompleteHammingDistanceInSmallStrand() {
        let result = Hamming.compute("ACT", against: "GGA")!
        let expected = 3
        XCTAssertEqual(expected, result)
    }

    func testSmallHammingDistanceInMiddleSomewhere() {
        let result = Hamming.compute("GGACG", against:"GGTCG")!
        let expected = 1
        XCTAssertEqual(expected, result)
    }

    func testLargerDistance() {
        let result = Hamming.compute("ACCAGGG", against:"ACTATGG")!
        let expected = 2
        XCTAssertEqual(expected, result)
    }

    func testReturnsNilWhenOtherStrandLonger() {
        let result = Hamming.compute("AAACTAGGGG", against:"AGGCTAGCGGTAGGAC")
        XCTAssertNil(result, "Different length strands return nil")
    }

    func testReturnsNilWhenOriginalStrandLonger() {
        let result = Hamming.compute("GACTACGGACAGGGTAGGGAAT", against:"GACATCGCACACC")
        XCTAssertNil(result, "Different length strands return nil")
    }

    static var allTests: [(String, (HammingTests) -> () throws -> Void)] {
        return [
            ("testNoDifferenceBetweenEmptyStrands", testNoDifferenceBetweenEmptyStrands),
            ("testNoDifferenceBetweenIdenticalStrands", testNoDifferenceBetweenIdenticalStrands),
            ("testCompleteHammingDistanceInSmallStrand", testCompleteHammingDistanceInSmallStrand),
            ("testSmallHammingDistanceInMiddleSomewhere", testSmallHammingDistanceInMiddleSomewhere),
            ("testLargerDistance", testLargerDistance),
            ("testReturnsNilWhenOtherStrandLonger", testReturnsNilWhenOtherStrandLonger),
            ("testReturnsNilWhenOriginalStrandLonger", testReturnsNilWhenOriginalStrandLonger),
        ]
    }
}
