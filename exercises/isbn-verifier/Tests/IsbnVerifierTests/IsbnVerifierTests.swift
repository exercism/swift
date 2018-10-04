import XCTest
@testable import IsbnVerifier

class IsbnVerifierTests: XCTestCase {

    func testEmptyString() {
        XCTAssertFalse(IsbnVerifier.isValid(""))
    }

    func testValidIsbnNumber() {
        XCTAssertTrue(IsbnVerifier.isValid("3-598-21508-8"))
    }

    func testInvalidIsbnCheckDigit() {
        XCTAssertFalse(IsbnVerifier.isValid("3-598-21508-9"))
    }

    func testValidIsbnNumberWithACheckDigitOf10() {
        XCTAssertTrue(IsbnVerifier.isValid("3-598-21507-X"))
    }

    func testCheckDigitIsACharacterOtherThanX() {
        XCTAssertFalse(IsbnVerifier.isValid("3-598-21507-A"))
    }

    func testInvalidCharacterInIsbn() {
        XCTAssertFalse(IsbnVerifier.isValid("3-598-2K507-0"))
    }

    func testXIsOnlyValidAsACheckDigit() {
        XCTAssertFalse(IsbnVerifier.isValid("3-598-2X507-9"))
    }

    func testValidIsbnWithoutSeparatingDashes() {
        XCTAssertTrue(IsbnVerifier.isValid("3598215088"))
    }

    func testIsbnWithoutSeparatingDashesAndXAsCheckDigit() {
        XCTAssertTrue(IsbnVerifier.isValid("359821507X"))
    }

    func testIsbnWithoutCheckDigitAndDashes() {
        XCTAssertFalse(IsbnVerifier.isValid("359821507"))
    }

    func testTooLongIsbnAndNoDashes() {
        XCTAssertFalse(IsbnVerifier.isValid("3598215078X"))
    }

    func testIsbnWithoutCheckDigit() {
        XCTAssertFalse(IsbnVerifier.isValid("3-598-21507"))
    }

    func testTooLongIsbn() {
        XCTAssertFalse(IsbnVerifier.isValid("3-598-21507-XX"))
    }

    func testCheckDigitOfXShouldNotBeUsedFor0() {
        XCTAssertFalse(IsbnVerifier.isValid("3-598-21515-X"))
    }

    static var allTests: [(String, (IsbnVerifierTests) -> () throws -> Void)] {
        return [
            ("testEmptyString", testEmptyString),
            ("testValidIsbnNumber", testValidIsbnNumber),
            ("testInvalidIsbnCheckDigit", testInvalidIsbnCheckDigit),
            ("testValidIsbnNumberWithACheckDigitOf10", testValidIsbnNumberWithACheckDigitOf10),
            ("testCheckDigitIsACharacterOtherThanX", testCheckDigitIsACharacterOtherThanX),
            ("testInvalidCharacterInIsbn", testInvalidCharacterInIsbn),
            ("testXIsOnlyValidAsACheckDigit", testXIsOnlyValidAsACheckDigit),
            ("testValidIsbnWithoutSeparatingDashes", testValidIsbnWithoutSeparatingDashes),
            ("testIsbnWithoutSeparatingDashesAndXAsCheckDigit", testIsbnWithoutSeparatingDashesAndXAsCheckDigit),
            ("testIsbnWithoutCheckDigitAndDashes", testIsbnWithoutCheckDigitAndDashes),
            ("testTooLongIsbnAndNoDashes", testTooLongIsbnAndNoDashes),
            ("testIsbnWithoutCheckDigit", testIsbnWithoutCheckDigit),
            ("testTooLongIsbn", testTooLongIsbn),
            ("testCheckDigitOfXShouldNotBeUsedFor0", testCheckDigitOfXShouldNotBeUsedFor0)
        ]
    }
}
