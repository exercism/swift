import XCTest
@testable import RotationalCipher

class RotationalCipherTests: XCTestCase {

    func testRotateSingleCharacterBy1() {
        let expected = "b"
        XCTAssertEqual(expected, RotationalCipher.rotate("a", ROT: 1))
    }

    func testRotateSingleCharacterBy26() {
        let expected = "a"
        XCTAssertEqual(expected, RotationalCipher.rotate("a", ROT: 26))
    }

    func testRotateSingleCharacterBy0() {
        let expected = "a"
        XCTAssertEqual(expected, RotationalCipher.rotate("a", ROT: 0))
    }

    func testRotateSingleCharacterBy13() {
        let expected = "z"
        XCTAssertEqual(expected, RotationalCipher.rotate("m", ROT: 13))
    }

    func testRotateSingleCharacterWithWrapAround() {
        let expected = "a"
        XCTAssertEqual(expected, RotationalCipher.rotate("n", ROT: 13))
    }

    func testRotateCapitalLetters() {
        let expected = "TRL"
        XCTAssertEqual(expected, RotationalCipher.rotate("OMG", ROT: 5))
    }

    func testRotateSpaces() {
        let expected = "T R L"
        XCTAssertEqual(expected, RotationalCipher.rotate("O M G", ROT: 5))
    }

    func testRotateNumbers() {
        let expected = "Xiwxmrk 1 2 3 xiwxmrk"
        XCTAssertEqual(expected, RotationalCipher.rotate("Testing 1 2 3 testing", ROT: 4))
    }

    func testRotatePunctuation() {
        let expected = "Gzo'n zvo, Bmviyhv!"
        XCTAssertEqual(expected, RotationalCipher.rotate("Let's eat, Grandma!", ROT: 21))
    }

    func testRotateAllLetters() {
        let expected = "The quick brown fox jumps over the lazy dog."
        XCTAssertEqual(expected, RotationalCipher.rotate("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.", ROT: 13))
    }

    static var allTests: [(String, (RotationalCipherTests) -> () throws -> Void)] {
        return [
            ("testRotateSingleCharacterBy1", testRotateSingleCharacterBy1),
            ("testRotateSingleCharacterBy26", testRotateSingleCharacterBy26),
            ("testRotateSingleCharacterBy0", testRotateSingleCharacterBy0),
            ("testRotateSingleCharacterBy13", testRotateSingleCharacterBy13),
            ("testRotateSingleCharacterWithWrapAround", testRotateSingleCharacterWithWrapAround),
            ("testRotateCapitalLetters", testRotateCapitalLetters),
            ("testRotateSpaces", testRotateSpaces),
            ("testRotateNumbers", testRotateNumbers),
            ("testRotatePunctuation", testRotatePunctuation),
            ("testRotateAllLetters", testRotateAllLetters)
        ]
    }
}
