import XCTest
@testable import CryptoSquare

class CryptoSquareTests: XCTestCase {

    func testNormalizeStrangeCharacters() {
        let crypto = Crypto("s#$%^&plunk")
        XCTAssertEqual("splunk", crypto.normalizePlaintext)
    }

    func testNormalizeUppercaseCharacters() {
        let crypto = Crypto("WHOA HEY!")
        XCTAssertEqual("whoahey", crypto.normalizePlaintext)
    }

    func testNormalizeWithNumbers() {
        let crypto = Crypto("1, 2, 3 GO!")
        XCTAssertEqual("123go", crypto.normalizePlaintext)
    }

    func testSizeOfSmallSquare() {
        let crypto = Crypto("1234")
        XCTAssertEqual(2, crypto.size)
    }

    func testSizeOfSlightlyLargerSquare() {
        let crypto = Crypto("123456789")
        XCTAssertEqual(3, crypto.size)
    }

    func testSizeOfNonPerfectSquare() {
        let crypto = Crypto("123456789abc")
        XCTAssertEqual(4, crypto.size)
    }

    func testSizeIsDeterminedByNormalizedPlaintext() {
        let crypto = Crypto("Oh hey, this is nuts!")
        XCTAssertEqual(4, crypto.size)
    }

    func testPlaintextSegments() {
        let crypto = Crypto("Never vex thine heart with idle woes")
        let expected = ["neverv", "exthin", "eheart", "withid", "lewoes"]
        XCTAssertEqual(expected, crypto.plaintextSegments)
    }

    func testOtherPlaintextSegments() {
        let crypto = Crypto("ZOMG! ZOMBIES!!!")
        XCTAssertEqual(["zomg", "zomb", "ies"], crypto.plaintextSegments)
    }

    func testCiphertext() {
        let crypto = Crypto("Time is an illusion. Lunchtime doubly so.")
        XCTAssertEqual("tasneyinicdsmiohooelntuillibsuuml", crypto.ciphertext)
    }

    func testAnotherCiphertext() {
        let crypto = Crypto("We all know interspecies romance is weird.")
        XCTAssertEqual("wneiaweoreneawssciliprerlneoidktcms", crypto.ciphertext)
    }

    func testNormalizedCiphertext() {
        let crypto = Crypto("Vampires are people too!")
        XCTAssertEqual("vrel aepe mset paoo irpo", crypto.normalizeCiphertext)
    }

    func testNormalizedCiphertextSpillsIntoShortSegment() {
        let crypto = Crypto("Madness, and then illumination.")
        XCTAssertEqual("msemo aanin dninn dlaet ltshu i", crypto.normalizeCiphertext)
    }

    func testAnotherNormalizedCiphertext() {
        let crypto = Crypto(
            "If man was meant to stay on the ground god would have given us roots"
        )
        let  expected = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghns seoau"
        XCTAssertEqual(expected, crypto.normalizeCiphertext)
    }

    func testNormalizedCiphertextWithPunctuation() {
        let crypto = Crypto("Have a nice day. Feed the dog & chill out!")
        let expected = "hifei acedl veeol eddgo aatcu nyhht"
        XCTAssertEqual(expected, crypto.normalizeCiphertext)
    }

    static var allTests: [(String, (CryptoSquareTests) -> () throws -> Void)] {
        return [
            ("testNormalizeStrangeCharacters", testNormalizeStrangeCharacters),
            ("testNormalizeUppercaseCharacters", testNormalizeUppercaseCharacters),
            ("testNormalizeWithNumbers", testNormalizeWithNumbers),
            ("testSizeOfSmallSquare", testSizeOfSmallSquare),
            ("testSizeOfSlightlyLargerSquare", testSizeOfSlightlyLargerSquare),
            ("testSizeOfNonPerfectSquare", testSizeOfNonPerfectSquare),
            ("testSizeIsDeterminedByNormalizedPlaintext", testSizeIsDeterminedByNormalizedPlaintext),
            ("testPlaintextSegments", testPlaintextSegments),
            ("testOtherPlaintextSegments", testOtherPlaintextSegments),
            ("testCiphertext", testCiphertext),
            ("testAnotherCiphertext", testAnotherCiphertext),
            ("testNormalizedCiphertext", testNormalizedCiphertext),
            ("testNormalizedCiphertextSpillsIntoShortSegment", testNormalizedCiphertextSpillsIntoShortSegment),
            ("testAnotherNormalizedCiphertext", testAnotherNormalizedCiphertext),
            ("testNormalizedCiphertextWithPunctuation", testNormalizedCiphertextWithPunctuation),
        ]
    }
}
