import XCTest
@testable import Atbash

class AtbashTests: XCTestCase {

    func testEncodeNo() {
        XCTAssertEqual("ml", Atbash.encode("no") )
    }

    func testEncodeYes() {
        XCTAssertEqual("bvh", Atbash.encode("yes") )
    }

    func testEncodeOMG() {
        XCTAssertEqual("lnt", Atbash.encode("OMG") )
    }

    func testEncodeOMGWithSpaces() {
        XCTAssertEqual("lnt", Atbash.encode("O M G") )
    }

    func testEncodeLongWord() {
        XCTAssertEqual("nrmwy oldrm tob", Atbash.encode("mindblowingly") )
    }

    func testEncodeNumbers() {
        XCTAssertEqual("gvhgr mt123 gvhgr mt",
                       Atbash.encode("Testing, 1 2 3, testing.") )
    }

    func testEncodeSentence() {
        XCTAssertEqual("gifgs rhurx grlm", Atbash.encode("Truth is fiction.") )
    }

    func testEncodeAllTheThings() {
        let plaintext = "The quick brown fox jumps over the lazy dog."
        let cipher = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
        XCTAssertEqual(cipher, Atbash.encode(plaintext) )
    }

    static var allTests: [(String, (AtbashTests) -> () throws -> Void)] {
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
