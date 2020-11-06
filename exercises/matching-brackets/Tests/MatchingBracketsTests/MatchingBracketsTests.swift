import XCTest
@testable import MatchingBrackets

class MatchingBracketsTests: XCTestCase {

    func testPairedSquareBrackets() {
        XCTAssertTrue(MatchingBrackets.paired(text: "[]"))
    }

    func testEmptyString() {
        XCTAssertTrue(MatchingBrackets.paired(text: ""))
    }

    func testUnpairedBrackets() {
        XCTAssertFalse(MatchingBrackets.paired(text: "[["))
    }

    func testWrongOrderedBrackets() {
        XCTAssertFalse(MatchingBrackets.paired(text: "}{"))
    }

    func testPairedWithWhitespace() {
        XCTAssertTrue(MatchingBrackets.paired(text: "{ }"))
    }

    func testSimpleNestedBrackets() {
        XCTAssertTrue(MatchingBrackets.paired(text: "{[]}"))
    }

    func testSeveralPairedBrackets() {
        XCTAssertTrue(MatchingBrackets.paired(text: "{}[]()"))
    }

    func testPairedAndNestedBrackets() {
        XCTAssertTrue(MatchingBrackets.paired(text: "([{}({}[])])"))
    }

    func testUnopenedClosingBrackets() {
        XCTAssertFalse(MatchingBrackets.paired(text: "{[)][]}"))
    }

    func testUnpairedAndNestedBrackets() {
        XCTAssertFalse(MatchingBrackets.paired(text: "([{])"))
    }

    func testPairedAndWrongNestedBrackets() {
        XCTAssertFalse(MatchingBrackets.paired(text: "[({]})"))
    }

    func testMathExpression() {
        XCTAssertTrue(MatchingBrackets.paired(text: "(((185 + 223.85) * 15) - 543)/2"))
    }

    func testComplexLatexExpression() {
        let text = "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
        XCTAssertTrue(MatchingBrackets.paired(text: text))
    }

    static var allTests: [(String, (MatchingBracketsTests) -> () throws -> Void)] {
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
