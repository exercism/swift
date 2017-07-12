import XCTest
@testable import ScrabbleScore

class ScrabbleScoreTests: XCTestCase {
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

    func testScoringUtility() {
        XCTAssertEqual( 13, Scrabble.score("alacrity"))
    }

    static var allTests: [(String, (ScrabbleScoreTests) -> () throws -> Void)] {
        return [
            ("testEmptyWordScoresZero", testEmptyWordScoresZero),
            ("testWhitespaceScoresZero", testWhitespaceScoresZero),
            ("testNilScoresZero", testNilScoresZero),
            ("testScoresVeryShortWord", testScoresVeryShortWord),
            ("testScoresOtherVeryShortWord", testScoresOtherVeryShortWord),
            ("testSimpleWordScoresTheNumberOfLetters", testSimpleWordScoresTheNumberOfLetters),
            ("testComplicatedWordScoresMore", testComplicatedWordScoresMore),
            ("testScoresAreCaseInsensitive", testScoresAreCaseInsensitive),
            ("testScoringUtility", testScoringUtility),
        ]
    }
}
