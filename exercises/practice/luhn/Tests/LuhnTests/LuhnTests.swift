import XCTest
@testable import Luhn

class LuhnTests: XCTestCase {

    func testSingleDigitInvalid() {
        let luhn = Luhn("1")
        XCTAssertEqual (false, luhn.isValid)
    }

    func testSingleZeroInvalid() {
        let luhn = Luhn("0")
        XCTAssertEqual (false, luhn.isValid)
    }

    func testSimpleReversableValid() {
        let luhn = Luhn("059")
        XCTAssertEqual (true, luhn.isValid)
    }

    func testSimpleIrreversableValid() {
        let luhn = Luhn("59")
        XCTAssertEqual (true, luhn.isValid)
    }

    func testCanadianValid() {
        let luhn = Luhn("055 444 285")
        XCTAssertEqual (true, luhn.isValid)
    }

    func testCanadianInvalid() {
        let luhn = Luhn("055 444 286")
        XCTAssertEqual (false, luhn.isValid)
    }

    func testCreditCardInvalid() {
        let luhn = Luhn("8273 1232 7352 0569")
        XCTAssertEqual (false, luhn.isValid)
    }

    func testNonDigitInvalid() {
        let luhn = Luhn("055a 444 285")
        XCTAssertEqual (false, luhn.isValid)
    }

    func testPunctuationInvalid() {
        let luhn = Luhn("055-444-285")
        XCTAssertEqual (false, luhn.isValid)
    }

    func testSymbolsInvalid() {
        let luhn = Luhn("055£ 444$ 285")
        XCTAssertEqual (false, luhn.isValid)
    }

    func testZeroWithSpaceInvalid() {
        let luhn = Luhn(" 0")
        XCTAssertEqual (false, luhn.isValid)
    }

    func testMultipleZeroesValid() {
        let luhn = Luhn("0000 0")
        XCTAssertEqual (true, luhn.isValid)
    }

    func testInputNineOutputNine() {
        let luhn = Luhn("091")
        XCTAssertEqual (true, luhn.isValid)
    }

    static var allTests: [(String, (LuhnTests) -> () throws -> Void)] {
        return [
            ("testSingleDigitInvalid", testSingleDigitInvalid),
            ("testSingleZeroInvalid", testSingleZeroInvalid),
            ("testSimpleReversableValid", testSimpleReversableValid),
            ("testSimpleIrreversableValid", testSimpleIrreversableValid),
            ("testCanadianValid", testCanadianValid),
            ("testCanadianInvalid", testCanadianInvalid),
            ("testCreditCardInvalid", testCreditCardInvalid),
            ("testNonDigitInvalid", testNonDigitInvalid),
            ("testPunctuationInvalid", testPunctuationInvalid),
            ("testSymbolsInvalid", testSymbolsInvalid),
            ("testZeroWithSpaceInvalid", testZeroWithSpaceInvalid),
            ("testMultipleZeroesValid", testMultipleZeroesValid),
            ("testInputNineOutputNine", testInputNineOutputNine)
        ]
    }
}
