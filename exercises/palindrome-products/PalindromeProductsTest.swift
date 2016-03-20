import XCTest

// Apple Swift version 2.1

class PalindromeProductsTest: XCTestCase {
    
    func testLargestPalindromeFromSingleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 9)
        let largest = palindromes.largest
        XCTAssertEqual(9, largest.value)
        XCTAssertEqual([1, 9], largest.factor)
    }
    
    func testLargestPalindromeFromDoubleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 99, minFactor: 10)
        let largest = palindromes.largest
        XCTAssertEqual(9009, largest.value)
        XCTAssertEqual([91, 99], largest.factor)
    }

    func testSmallestPalindromeFromDoubleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 99, minFactor: 10)
        let smallest = palindromes.smallest
        XCTAssertEqual(121, smallest.value)
        XCTAssertEqual([11, 11], smallest.factor)
    }
    
    func testLargestPalindromeFromTripleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 999, minFactor: 100)
        let largest = palindromes.largest
        XCTAssertEqual(906_609, largest.value)
        XCTAssertEqual([913, 993], largest.factor)
    }
    
    func testSmallestPalindromeFromTripleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 999, minFactor: 100)
        let smallest = palindromes.smallest
        XCTAssertEqual(10_201, smallest.value)
        XCTAssertEqual([101, 101], smallest.factor)
    }
    
}
