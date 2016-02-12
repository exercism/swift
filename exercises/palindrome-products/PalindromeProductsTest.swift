import XCTest

// Apple Swift version 2.1

class PalindromeProductsTest: XCTestCase {
    
    func testLargestPalindromeFromSingleDigitFactors() {
        let palindromes = PalindromeCollection(maxFactor: 9)
        let largest = palindromes.largest
        XCTAssertEqual(9, largest.value)
        XCTAssertTrue(largest.factors == [[1, 9], [3, 3]] || largest.factors == [[3, 3], [1, 9]])
    }
    
    func testLargestPalindromeFromDoubleDigitFactors() {
        let palindromes = PalindromeCollection(maxFactor: 99, minFactor: 10)
        let largest = palindromes.largest
        XCTAssertEqual(9009, largest.value)
        XCTAssertEqual([[91, 99]], largest.factors)
    }
    
    func testSmallestPalindromeFromDoubleDigitFactors() {
        let palindromes = PalindromeCollection(maxFactor: 99, minFactor: 10)
        let smallest = palindromes.smallest
        XCTAssertEqual(121, smallest.value)
        XCTAssertEqual([[11, 11]], smallest.factors)
    }
    
    func testLargestPalindromeFromTripleDigitFactors() {
        let palindromes = PalindromeCollection(maxFactor: 999, minFactor: 100)
        let largest = palindromes.largest
        XCTAssertEqual(906_609, largest.value)
        XCTAssertEqual([[913, 993]], largest.factors)
    }
    
    func testSmallestPalindromeFromTripleDigitFactors() {
        let palindromes = PalindromeCollection(maxFactor: 999, minFactor: 100)
        let smallest = palindromes.smallest
        XCTAssertEqual(10_201, smallest.value)
        XCTAssertEqual([[101, 101]], smallest.factors)
    }
    
}
