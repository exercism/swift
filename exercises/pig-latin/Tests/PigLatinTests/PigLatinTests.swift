import XCTest
@testable import PigLatin

class PigLatinTests: XCTestCase {
    func testWordBeginningWithA() {
        XCTAssertEqual("appleay", PigLatin.translate("apple"))
    }

    func test_otherWordBeginningE() {
        XCTAssertEqual("earay", PigLatin.translate("ear"))
    }

    func testWordBeginningWithP() {
        XCTAssertEqual("igpay", PigLatin.translate("pig"))
    }

    func testWordBeginningWithK() {
        XCTAssertEqual("oalakay", PigLatin.translate("koala"))
    }

    func testWordBeginningWithCh() {
        XCTAssertEqual("airchay", PigLatin.translate("chair"))
    }

    func testWordBeginningWithQu() {
        XCTAssertEqual("eenquay", PigLatin.translate("queen"))
    }

    func testWordWithConsonantPrecedingQu() {
        XCTAssertEqual("aresquay", PigLatin.translate("square"))
    }

    func testWordBeginningWithTh() {
        XCTAssertEqual("erapythay", PigLatin.translate("therapy"))
    }

    func testWordBeginningWithThr() {
        XCTAssertEqual("ushthray", PigLatin.translate("thrush"))
    }

    func testWordBeginningWithSch() {
        XCTAssertEqual("oolschay", PigLatin.translate("school"))
    }

    func testWordBeginningWithYe() {
        XCTAssertEqual("ellowyay", PigLatin.translate("yellow"))
    }

    func testWordBeginningWithYt() {
        XCTAssertEqual("yttriaay", PigLatin.translate("yttria"))
    }

    func testWordBeginningWithXe() {
        XCTAssertEqual("enonxay", PigLatin.translate("xenon"))
    }

    func testWordBeginningWithXr() {
        XCTAssertEqual("xrayay", PigLatin.translate("xray"))
    }

    func testTranslatesPhrase() {
        XCTAssertEqual("ickquay astfay unray", PigLatin.translate("quick fast run"))
    }

    static var allTests: [(String, (PigLatinTests) -> () throws -> Void)] {
        return [
            ("testWordBeginningWithA", testWordBeginningWithA),
            ("test_otherWordBeginningE", test_otherWordBeginningE),
            ("testWordBeginningWithP", testWordBeginningWithP),
            ("testWordBeginningWithK", testWordBeginningWithK),
            ("testWordBeginningWithCh", testWordBeginningWithCh),
            ("testWordBeginningWithQu", testWordBeginningWithQu),
            ("testWordWithConsonantPrecedingQu", testWordWithConsonantPrecedingQu),
            ("testWordBeginningWithTh", testWordBeginningWithTh),
            ("testWordBeginningWithThr", testWordBeginningWithThr),
            ("testWordBeginningWithSch", testWordBeginningWithSch),
            ("testWordBeginningWithYe", testWordBeginningWithYe),
            ("testWordBeginningWithYt", testWordBeginningWithYt),
            ("testWordBeginningWithXe", testWordBeginningWithXe),
            ("testWordBeginningWithXr", testWordBeginningWithXr),
            ("testTranslatesPhrase", testTranslatesPhrase),
        ]
    }
}
