import XCTest
@testable import Wordy

class WordyTests: XCTestCase {
    func testAdd1() {
        XCTAssertEqual(2, try? WordProblem("What is 1 plus 1?").answer())
    }

    func testAdd2() {
        XCTAssertEqual(55, try? WordProblem("What is 53 plus 2?").answer())
    }

    func testAddNegativeNumbers() {
        XCTAssertEqual(-11, try? WordProblem("What is -1 plus -10?").answer()) }

    func testAddMoreDigits() {
        XCTAssertEqual(45_801, try? WordProblem("What is 123 plus 45678?").answer())
    }

    func testSubtract() {
        XCTAssertEqual(16, try? WordProblem("What is 4 minus -12?").answer())
    }

    func testMultiply() {
        XCTAssertEqual(-75, try? WordProblem("What is -3 multiplied by 25?").answer()) }

    func testDivide() {
        XCTAssertEqual(-11, try? WordProblem("What is 33 divided by -3?").answer()) }

    func testAddTwice() {
        let question = "What is 1 plus 1 plus 1?"
        XCTAssertEqual(3, try? WordProblem(question).answer())
    }

    func testAddThenSubtract() {
        let question = "What is 1 plus 5 minus -2?"
        XCTAssertEqual(8, try? WordProblem(question).answer())
    }

    func testSubtractTwice() {
        let question = "What is 20 minus 4 minus 13?"
        XCTAssertEqual(3, try? WordProblem(question).answer())
    }

    func testSubtractThenAdd() {
        let question = "What is 17 minus 6 plus 3?"
        XCTAssertEqual(14, try? WordProblem(question).answer())
    }

    func testMultiplyTwice() {
        let question = "What is 2 multiplied by -2 multiplied by 3?"
        XCTAssertEqual(-12, try? WordProblem(question).answer()) }

    func testAddThenMultiply() {
        let question = "What is -3 plus 7 multiplied by -2?"
        XCTAssertEqual(-8, try? WordProblem(question).answer()) }

    func testDivideTwice() {
        let question = "What is -12 divided by 2 divided by -3?"
        XCTAssertEqual(2, try? WordProblem(question).answer())
    }

    func testTooAdvanced() {
        XCTAssertNil(try? WordProblem("What is 53 cubed?").answer())
    }

    func testIrrelevant() {
        XCTAssertNil(try? WordProblem("Who is the president of the United States?").answer()) }

    static var allTests: [(String, (WordyTests) -> () throws -> Void)] {
        return [
            ("testAdd1", testAdd1),
            ("testAdd2", testAdd2),
            ("testAddNegativeNumbers", testAddNegativeNumbers),
            ("testAddMoreDigits", testAddMoreDigits),
            ("testSubtract", testSubtract),
            ("testMultiply", testMultiply),
            ("testDivide", testDivide),
            ("testAddTwice", testAddTwice),
            ("testAddThenSubtract", testAddThenSubtract),
            ("testSubtractTwice", testSubtractTwice),
            ("testSubtractThenAdd", testSubtractThenAdd),
            ("testMultiplyTwice", testMultiplyTwice),
            ("testAddThenMultiply", testAddThenMultiply),
            ("testDivideTwice", testDivideTwice),
            ("testTooAdvanced", testTooAdvanced),
            ("testIrrelevant", testIrrelevant),
        ]
    }
}
