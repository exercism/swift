import XCTest



class PalindromeProductsTest: XCTestCase {
    
    func testLargestPalindromeFromSingleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 9)
        let largest = palindromes.largest
        XCTAssertEqual(9, largest.value)
        XCTAssertTrue(Set([1, 9]) == Set(largest.factor) || Set([3, 3]) == Set(largest.factor) )
    }
    
    func testLargestPalindromeFromDoubleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 99, minFactor: 10)
        let largest = palindromes.largest
        XCTAssertEqual(9009, largest.value)
        XCTAssertEqual(Set([91, 99]), Set(largest.factor))
    }

    func testSmallestPalindromeFromDoubleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 99, minFactor: 10)
        let smallest = palindromes.smallest
        XCTAssertEqual(121, smallest.value)
        XCTAssertEqual(Set([11, 11]), Set(smallest.factor))
    }
    
    func testLargestPalindromeFromTripleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 999, minFactor: 100)
        let largest = palindromes.largest
        XCTAssertEqual(906_609, largest.value)
        XCTAssertEqual(Set([913, 993]), Set(largest.factor))
    }
    
    func testSmallestPalindromeFromTripleDigitFactors() {
        let palindromes = PalindromeProducts(maxFactor: 999, minFactor: 100)
        let smallest = palindromes.smallest
        XCTAssertEqual(10_201, smallest.value)
        XCTAssertEqual(Set([101, 101]), Set(smallest.factor))
    }
    
}
