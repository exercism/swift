import XCTest

class CryptoSquareTest: XCTestCase {
    
    func testNormalizeStrangeCharacters() {
        var crypto = Crypto("s#$%^&plunk")
        XCTAssertEqual("splunk", crypto.normalizePlaintext)
    }
        
    func testNormalizeUppercaseCharacters() {
        var crypto = Crypto("WHOA HEY!")
        XCTAssertEqual("whoahey", crypto.normalizePlaintext)
    }
    
    func testNormalizeWithNumbers() {
        var crypto = Crypto("1, 2, 3 GO!")
        XCTAssertEqual("123go", crypto.normalizePlaintext)
    }
    
    func testSizeOfSmallSquare() {
        var crypto = Crypto("1234")
        XCTAssertEqual(2, crypto.size)
    }

    func testSizeOfSlightlyLargerSquare() {
        var crypto = Crypto("123456789")
        XCTAssertEqual(3, crypto.size)
    }
    
    func testSizeOfNonPerfectSquare() {
        var crypto = Crypto("123456789abc")
        XCTAssertEqual(4, crypto.size)
    }
    
    func testSizeIsDeterminedByNormalizedPlaintext() {
        var crypto = Crypto("Oh hey, this is nuts!")
        XCTAssertEqual(4, crypto.size)
    }
    
    func testPlaintextSegments() {
        var crypto = Crypto("Never vex thine heart with idle woes")
        let expected = ["neverv", "exthin", "eheart", "withid", "lewoes"]
        XCTAssertEqual(expected, crypto.plaintextSegments)
    }

    func testOtherPlaintextSegments() {
        var crypto = Crypto("ZOMG! ZOMBIES!!!")
        XCTAssertEqual(["zomg", "zomb", "ies"], crypto.plaintextSegments)
    }

    func testCiphertext() {
        var crypto = Crypto("Time is an illusion. Lunchtime doubly so.")
        XCTAssertEqual("tasneyinicdsmiohooelntuillibsuuml", crypto.ciphertext)
    }

    func testAnotherCiphertext() {
        var crypto = Crypto("We all know interspecies romance is weird.")
        XCTAssertEqual("wneiaweoreneawssciliprerlneoidktcms", crypto.ciphertext)
    }
    
    func testNormalizedCiphertext() {
        var crypto = Crypto("Vampires are people too!")
        XCTAssertEqual("vrel aepe mset paoo irpo", crypto.normalizeCiphertext)
    }
    
    func testNormalizedCiphertextSpillsIntoShortSegment() {
        var crypto = Crypto("Madness, and then illumination.")
        XCTAssertEqual("msemo aanin dninn dlaet ltshu i", crypto.normalizeCiphertext)
    }
    
    func testAnotherNormalizedCiphertext() {
        var crypto = Crypto(
            "If man was meant to stay on the ground god would have given us roots"
       )
       var  expected = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghns seoau"
        XCTAssertEqual(expected, crypto.normalizeCiphertext)
    }
    
    func testNormalizedCiphertextWithPunctuation() {
        var crypto = Crypto("Have a nice day. Feed the dog & chill out!")
        let expected = "hifei acedl veeol eddgo aatcu nyhht"
        XCTAssertEqual(expected, crypto.normalizeCiphertext)
    }
    
    
}