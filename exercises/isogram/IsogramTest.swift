#if swift(>=3.0)
    import XCTest
#endif

class IsogramTest: XCTestCase {

    func testEmptyString() {
        XCTAssertTrue(Isogram.isIsogram(""))
    }

    func testIsogramWithOnlyLowerCaseCharacters() {
        XCTAssertTrue(Isogram.isIsogram("isogram"))
    }

    func testWordWithOneDuplicatedCharacter() {
        XCTAssertFalse(Isogram.isIsogram("eleven"))
    }

    func testLongestReportedEnglishIsogram() {
        XCTAssertTrue(Isogram.isIsogram("subdermatoglyphic"))
    }

    func testWordWithDuplicatedCharacterInMixedCase() {
        XCTAssertFalse(Isogram.isIsogram("Alphabet"))
    }

    func testHypotheticalIsogrammicWordWithHyphen() {
        XCTAssertTrue(Isogram.isIsogram("thumbscrew-japingly"))
    }

    func testIsogramWithDuplicatedNonLetterCharacter() {
        XCTAssertTrue(Isogram.isIsogram("Hjelmqvist-Gryb-Zock-Pfund-Wax"))
    }

    func testMadeUpNameThatIsAnIsogram() {
        XCTAssertTrue(Isogram.isIsogram("Emily Jung Schwartzkopf"))
    }
}
