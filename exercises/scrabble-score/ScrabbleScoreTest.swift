import XCTest



class ScrabbleScoreTest: XCTestCase {
    
    func testEmptyWordScoresZero() {
        XCTAssertEqual( 0, Scrabble("").score)
    }
    
    func testWhitespaceScoresZero() {
        XCTAssertEqual( 0, Scrabble(" \t\n").score)
    }
    
    func testNilScoresZero() {
        XCTAssertEqual( 0, Scrabble(nil).score)
    }
    
    func testScoresVeryShortWord() {
        XCTAssertEqual( 1, Scrabble("a").score)
    }
    
    func testScoresOtherVeryShortWord() {
        XCTAssertEqual( 4, Scrabble("f").score)
    }
    
    func testSimpleWordScoresTheNumberOfLetters() {
        XCTAssertEqual( 6, Scrabble("street").score)
    }
    
    func testComplicatedWordScoresMore() {
        XCTAssertEqual( 22, Scrabble("quirky").score)
    }
    
    func testScoresAreCaseInsensitive() {
        XCTAssertEqual( 41, Scrabble("OXYPHENBUTAZONE").score)
    }
    
    func testConvenientScoring() {
        XCTAssertEqual( 13, Scrabble.score("alacrity"))
    }
    
}
