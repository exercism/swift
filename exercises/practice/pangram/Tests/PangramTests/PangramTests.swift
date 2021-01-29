import XCTest
@testable import Pangram

class PangramTests: XCTestCase {
    func testSentenceEmpty() {
        XCTAssertFalse(Pangram.isPangram(""))
    }

    func test_pangram_with_only_lower_case() {
        XCTAssertTrue(Pangram.isPangram("the quick brown fox jumps over the lazy dog"))
    }

    func testMissingCharacterX() {
        XCTAssertFalse(Pangram.isPangram("a quick movement of the enemy will jeopardize five gunboats"))
    }

    func testAnotherMissingCharacterX() {
        XCTAssertFalse(Pangram.isPangram("the quick brown fish jumps over the lazy dog"))
    }

    func testPangramWithUnderscores() {
        XCTAssertTrue(Pangram.isPangram("the_quick_brown_fox_jumps_over_the_lazy_dog"))
    }

    func testPangramWithNumbers() {
        XCTAssertTrue(Pangram.isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"))
    }

    func testMissingLettersReplacedByNumbers() {
        XCTAssertFalse(Pangram.isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"))
    }

    func testPangramWithMixedCaseAndPunctuation() {
        XCTAssertTrue(Pangram.isPangram("Five quacking Zephyrs jolt my wax bed."))
    }

    func testPangramWithNonAsciiCharacters() {
        XCTAssertTrue(Pangram.isPangram("Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."))
    }

    static var allTests: [(String, (PangramTests) -> () throws -> Void)] {
        return [
            ("testSentenceEmpty", testSentenceEmpty),
            ("test_pangram_with_only_lower_case", test_pangram_with_only_lower_case),
            ("testMissingCharacterX", testMissingCharacterX),
            ("testAnotherMissingCharacterX", testAnotherMissingCharacterX),
            ("testPangramWithUnderscores", testPangramWithUnderscores),
            ("testPangramWithNumbers", testPangramWithNumbers),
            ("testMissingLettersReplacedByNumbers", testMissingLettersReplacedByNumbers),
            ("testPangramWithMixedCaseAndPunctuation", testPangramWithMixedCaseAndPunctuation),
            ("testPangramWithNonAsciiCharacters", testPangramWithNonAsciiCharacters),
        ]
    }
}
