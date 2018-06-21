import XCTest
@testable import AtbashCipher

class AtbashCipherTests: XCTestCase {

    func testEncodeNo() {
        XCTAssertEqual("ml", AtbashCipher.encode("no") )
    }

    func testEncodeYes() {
        XCTAssertEqual("bvh", AtbashCipher.encode("yes") )
    }

    func testEncodeOMG() {
        XCTAssertEqual("lnt", AtbashCipher.encode("OMG") )
    }

    func testEncodeOMGWithSpaces() {
        XCTAssertEqual("lnt", AtbashCipher.encode("O M G") )
    }

    func testEncodeLongWord() {
        XCTAssertEqual("nrmwy oldrm tob", AtbashCipher.encode("mindblowingly") )
    }

    func testEncodeNumbers() {
        XCTAssertEqual("gvhgr mt123 gvhgr mt",
                       AtbashCipher.encode("Testing, 1 2 3, testing.") )
    }

    func testEncodeSentence() {
        XCTAssertEqual("gifgs rhurx grlm", AtbashCipher.encode("Truth is fiction.") )
    }

    func testEncodeAllTheThings() {
        let plaintext = "The quick brown fox jumps over the lazy dog."
        let cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
        XCTAssertEqual(cipher, AtbashCipher.encode(plaintext) )
    }

    static var allTests: [(String, (AtbashCipherTests) -> () throws -> Void)] {
        return [
            ("testEncodeNo", testEncodeNo),
            ("testEncodeYes", testEncodeYes),
            ("testEncodeOMG", testEncodeOMG),
            ("testEncodeOMGWithSpaces", testEncodeOMGWithSpaces),
            ("testEncodeLongWord", testEncodeLongWord),
            ("testEncodeNumbers", testEncodeNumbers),
            ("testEncodeSentence", testEncodeSentence),
            ("testEncodeAllTheThings", testEncodeAllTheThings),
        ]
    }
}
