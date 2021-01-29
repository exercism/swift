import XCTest
@testable import BracketPush

class BracketPushTests: XCTestCase {

    func testPairedSquareBrackets() {
        XCTAssertTrue(BracketPush.paired(text: "[]"))
    }

    func testEmptyString() {
        XCTAssertTrue(BracketPush.paired(text: ""))
    }

    func testUnpairedBrackets() {
        XCTAssertFalse(BracketPush.paired(text: "[["))
    }

    func testWrongOrderedBrackets() {
        XCTAssertFalse(BracketPush.paired(text: "}{"))
    }

    func testPairedWithWhitespace() {
        XCTAssertTrue(BracketPush.paired(text: "{ }"))
    }

    func testSimpleNestedBrackets() {
        XCTAssertTrue(BracketPush.paired(text: "{[]}"))
    }

    func testSeveralPairedBrackets() {
        XCTAssertTrue(BracketPush.paired(text: "{}[]()"))
    }

    func testPairedAndNestedBrackets() {
        XCTAssertTrue(BracketPush.paired(text: "([{}({}[])])"))
    }

    func testUnopenedClosingBrackets() {
        XCTAssertFalse(BracketPush.paired(text: "{[)][]}"))
    }

    func testUnpairedAndNestedBrackets() {
        XCTAssertFalse(BracketPush.paired(text: "([{])"))
    }

    func testPairedAndWrongNestedBrackets() {
        XCTAssertFalse(BracketPush.paired(text: "[({]})"))
    }

    func testMathExpression() {
        XCTAssertTrue(BracketPush.paired(text: "(((185 + 223.85) * 15) - 543)/2"))
    }

    func testComplexLatexExpression() {
        let text = "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
        XCTAssertTrue(BracketPush.paired(text: text))
    }

    static var allTests: [(String, (BracketPushTests) -> () throws -> Void)] {
        return [
            ("testPairedSquareBrackets", testPairedSquareBrackets),
            ("testEmptyString", testEmptyString),
            ("testUnpairedBrackets", testUnpairedBrackets),
            ("testWrongOrderedBrackets", testWrongOrderedBrackets),
            ("testPairedWithWhitespace", testPairedWithWhitespace),
            ("testSimpleNestedBrackets", testSimpleNestedBrackets),
            ("testSeveralPairedBrackets", testSeveralPairedBrackets),
            ("testPairedAndNestedBrackets", testPairedAndNestedBrackets),
            ("testUnopenedClosingBrackets", testUnopenedClosingBrackets),
            ("testUnpairedAndNestedBrackets", testUnpairedAndNestedBrackets),
            ("testPairedAndWrongNestedBrackets", testPairedAndWrongNestedBrackets),
            ("testMathExpression", testMathExpression),
            ("testComplexLatexExpression", testComplexLatexExpression),
        ]
    }
}
