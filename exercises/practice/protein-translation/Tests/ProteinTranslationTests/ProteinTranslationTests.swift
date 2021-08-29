import XCTest
@testable import ProteinTranslation

class ProteinTranslationTests: XCTestCase {

    func testAUGTranslatesToMethionine() {
        XCTAssertEqual("Methionine", try? ProteinTranslation.translationOfCodon("AUG"))
    }

    func testIdentifiesPhenylalanineCodons() {
        XCTAssertEqual("Phenylalanine", try? ProteinTranslation.translationOfCodon("UUU"))
        XCTAssertEqual("Phenylalanine", try? ProteinTranslation.translationOfCodon("UUC"))
    }

    func testIdentifiesLeucineCodons() {
        ["UUA", "UUG"].forEach {
            XCTAssertEqual("Leucine", try? ProteinTranslation.translationOfCodon($0))
        }
    }

    func testIdentifiesSerineCodons() {
        ["UCU", "UCC", "UCA", "UCG"].forEach {
            XCTAssertEqual("Serine", try? ProteinTranslation.translationOfCodon($0))
        }
    }

    func testIdentifiesTyrosineCodons() {
        ["UAU", "UAC"].forEach {
            XCTAssertEqual("Tyrosine", try? ProteinTranslation.translationOfCodon($0))
        }
    }

    func testIdentifiesCysteineCodons() {
        ["UGU", "UGC"].forEach {
            XCTAssertEqual("Cysteine", try? ProteinTranslation.translationOfCodon($0))
        }
    }

    func testIdentifiesTryptophanCodons() {
        XCTAssertEqual("Tryptophan", try? ProteinTranslation.translationOfCodon("UGG"))
    }

    func testIdentifiesStopCodons() {
        ["UAA", "UAG", "UGA"].forEach {
            XCTAssertEqual("STOP", try? ProteinTranslation.translationOfCodon($0))
        }
    }

    func testTranslatesRNAStrandIntoCorrectProtein() {
        XCTAssertEqual(["Methionine", "Phenylalanine", "Tryptophan"],
                   try!ProteinTranslation.translationOfRNA("AUGUUUUGG"))
    }

    func testStopsTranslationIfStopCodonPresent() {
        XCTAssertEqual(["Methionine", "Phenylalanine"], try! ProteinTranslation.translationOfRNA("AUGUUUUAA"))
    }

    func testStopsTranslationOfLongerStrand() {
        XCTAssertEqual(["Tryptophan", "Cysteine", "Tyrosine"],
                       try! ProteinTranslation.translationOfRNA("UGGUGUUAUUAAUGGUUU"))
    }

    func testInvalidCodons() {
        XCTAssertThrowsError(try ProteinTranslation.translationOfRNA("CARROT"))
    }

    static var allTests: [(String, (ProteinTranslationTests) -> () throws -> Void)] {
        return [
            ("testAUGTranslatesToMethionine", testAUGTranslatesToMethionine),
            ("testIdentifiesPhenylalanineCodons", testIdentifiesPhenylalanineCodons),
            ("testIdentifiesLeucineCodons", testIdentifiesLeucineCodons),
            ("testIdentifiesSerineCodons", testIdentifiesSerineCodons),
            ("testIdentifiesTyrosineCodons", testIdentifiesTyrosineCodons),
            ("testIdentifiesCysteineCodons", testIdentifiesCysteineCodons),
            ("testIdentifiesTryptophanCodons", testIdentifiesTryptophanCodons),
            ("testIdentifiesStopCodons", testIdentifiesStopCodons),
            ("testTranslatesRNAStrandIntoCorrectProtein", testTranslatesRNAStrandIntoCorrectProtein),
            ("testStopsTranslationIfStopCodonPresent", testStopsTranslationIfStopCodonPresent),
            ("testStopsTranslationOfLongerStrand", testStopsTranslationOfLongerStrand),
            ("testInvalidCodons", testInvalidCodons),
        ]
    }
}
