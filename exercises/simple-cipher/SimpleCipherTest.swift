#if swift(>=3.0)
    import XCTest
#endif

class SimpleCipherTest: XCTestCase {

    func testCipherEncode() {
        let cipher = Cipher()
        let plaintext = "aaaaaaaaaa"
        let expected  = cipher.key.substring(to: cipher.key.characters.index(cipher.key.startIndex, offsetBy: 10))
        XCTAssertEqual(expected, cipher.encode(plaintext))
    }

    func testCipherDecode() {
        let cipher = Cipher()
        let plaintext = "aaaaaaaaaa"
        let expected  = cipher.key.substring(to: cipher.key.characters.index(cipher.key.startIndex, offsetBy: 10))
        XCTAssertEqual(plaintext, cipher.decode(expected))
    }

    func testCipherReversible() {
        let cipher = Cipher()
        let plaintext = "abcdefghij"
        XCTAssertEqual(plaintext, cipher.decode(cipher.encode(plaintext)))
    }

    // MARK: TestIncorrectKey

    func testCipherWithCapsKey() {
        XCTAssertNil(Cipher(key: "ABCDEF"))
    }

    func testCipherWithNumericKey() {
        XCTAssertNil(Cipher(key: "12345"))
    }

    func testCipherWithEmptyKey() {
        XCTAssertNil(Cipher(key: ""))
    }

    // MARK: TestSubstitution

    let cipherSubstitution = Cipher(key: "abcdefghij") ?? Cipher()

    func testCipherKeyIsAsSubmitted() {
        XCTAssertEqual(cipherSubstitution.key, "abcdefghij")
    }

    func testCipherEncodeSubstitution() {
        let plaintext = "aaaaaaaaaa"
        let ciphertext = "abcdefghij"
        XCTAssertEqual(ciphertext, cipherSubstitution.encode(plaintext))
    }

    func testCipherDecodeSubstitution() {
        let plaintext = "aaaaaaaaaa"
        let ciphertext = "abcdefghij"
        XCTAssertEqual(plaintext, cipherSubstitution.decode(ciphertext))
    }

    func testCipherReversibleSubstitution() {
        let plaintext = "abcdefghij"
        XCTAssertEqual(plaintext, cipherSubstitution.decode(cipherSubstitution.encode(plaintext)))
    }

    func testDoubleShiftEncode() {
        let plaintext = "iamapandabear"
        let ciphertext = "qayaeaagaciai"
        XCTAssertEqual(ciphertext, Cipher(key: "iamapandabear")?.encode(plaintext) ?? "")
    }

    func testCipherEncodeWrap() {
        let plaintext = "zzzzzzzzzz"
        let ciphertext = "zabcdefghi"
        XCTAssertEqual(ciphertext, cipherSubstitution.encode(plaintext))
    }

    // MARK: TestPseudoShift

    let cipherPseudo = Cipher(key: "dddddddddd") ?? Cipher()

    func testCipherEncodePseudo() {
        let plaintext = "aaaaaaaaaa"
        let ciphertext = "dddddddddd"
        XCTAssertEqual(ciphertext, cipherPseudo.encode(plaintext))
    }

    func testCipherDecodePseudo() {
        let plaintext = "aaaaaaaaaa"
        let ciphertext = "dddddddddd"
        XCTAssertEqual(plaintext, cipherPseudo.decode(ciphertext))
    }

    func testCipherReversiblePseudo() {
        let plaintext = "abcdefghij"
        XCTAssertEqual(plaintext, cipherPseudo.decode(cipherPseudo.encode(plaintext)))
    }

}
