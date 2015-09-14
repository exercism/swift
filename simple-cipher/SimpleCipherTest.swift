
import XCTest

// Apple Swift version 2.0

class SimpleCipherTest: XCTestCase {

    func testCipherEncode() {
        let cipher = Cipher()
        let plaintext = "aaaaaaaaaa"
        let expected  = cipher.key.substringToIndex(cipher.key.startIndex.advancedBy(10))
        XCTAssertEqual(expected, cipher.encode(plaintext))
    }

    func testCipherDecode() {
        let cipher = Cipher()
        let plaintext = "aaaaaaaaaa"
        let expected  = cipher.key.substringToIndex(cipher.key.startIndex.advancedBy(10))
        XCTAssertEqual(plaintext, cipher.decode(expected))
    }

    func testCipherReversible() {
        let cipher = Cipher()
        let plaintext = "abcdefghij"
        XCTAssertEqual(plaintext, cipher.decode(cipher.encode(plaintext)))
    }
}

class SimpleCipherTestIncorrectKey: XCTestCase {

    func testCipherWithCapsKey() {
        XCTAssertTrue(Cipher(key: "ABCDEF") == nil)
    }

    func testCipherWithNumericKey() {
        XCTAssertTrue(Cipher(key: "12345") == nil)
    }

    func testCipherWithEmptyKey() {
        XCTAssertTrue(Cipher(key: "") == nil)
    }
    
}

class SimpleCipherTestSubstitution: XCTestCase {

    let cipher = Cipher(key: "abcdefghij") ?? Cipher()

    func testCipherKeyIsAsSubmitted() {
        XCTAssertEqual(cipher.key, "abcdefghij")
    }

    func testCipherEncode() {
        let plaintext = "aaaaaaaaaa"
        let ciphertext = "abcdefghij"
        XCTAssertEqual(ciphertext, cipher.encode(plaintext))
    }

    func testCipherDecode() {
        let plaintext = "aaaaaaaaaa"
        let ciphertext = "abcdefghij"
        XCTAssertEqual(plaintext, cipher.decode(ciphertext))
    }

    func testCipherReversible() {
        let plaintext = "abcdefghij"
        XCTAssertEqual(plaintext, cipher.decode(cipher.encode(plaintext)))
    }

    func testDoubleShiftEncode() {
        let plaintext = "iamapandabear"
        let ciphertext = "qayaeaagaciai"
        XCTAssertEqual(ciphertext, Cipher(key: "iamapandabear")?.encode(plaintext) ?? "")
    }

    func testCipherEncodeWrap() {
        let plaintext = "zzzzzzzzzz"
        let ciphertext = "zabcdefghi"
        XCTAssertEqual(ciphertext, cipher.encode(plaintext))
    }
}

class SimpleCipherTestPseudoShift: XCTestCase {

    let cipherPseudo = Cipher(key: "dddddddddd") ?? Cipher()

    func testCipherEncode() {
        let plaintext = "aaaaaaaaaa"
        let ciphertext = "dddddddddd"
        XCTAssertEqual(ciphertext, cipherPseudo.encode(plaintext))
    }

    func testCipherDecode() {
        let plaintext = "aaaaaaaaaa"
        let ciphertext = "dddddddddd"
        XCTAssertEqual(plaintext, cipherPseudo.decode(ciphertext))
    }

    func testCipherReversible() {
        let plaintext = "abcdefghij"
        XCTAssertEqual(plaintext, cipherPseudo.decode(cipherPseudo.encode(plaintext)))
    }

}
