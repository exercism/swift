import XCTest
@testable import Dominoes

class DominoesTests: XCTestCase {

    func testEmptyInputEmptyOutput() {
        let input = [(Int, Int)]()
        XCTAssertFalse(Dominoes(input).chained)
    }

    func testSingletonInputSingletonOutput() {
        let input = [(1, 1)]
        XCTAssertTrue(Dominoes(input).chained)
    }

    func testSingletonThatCantBeChained() {
        let input = [(1, 2)]
        XCTAssertFalse(Dominoes(input).chained)
    }

    func testNoRepeatNumbers() {
        let input = [(1, 2), (3, 1), (2, 3)]
        XCTAssertTrue(Dominoes(input).chained)
    }

    func testCanReverseDominoes() {
        let input = [(1, 2), (1, 3), (2, 3)]
        XCTAssertTrue(Dominoes(input).chained)
    }

    func testInvalidInput() {
        let input = [(1, 2), (4, 1), (2, 3)]
        XCTAssertFalse(Dominoes(input).chained)
    }

    func testDisconnectedSimple() {
        let input = [(1, 1), (2, 2)]
        XCTAssertFalse(Dominoes(input).chained)
    }

    func testDisconnectedDoubleLoop() {
        let input = [(1, 2), (2, 1), (3, 4), (4, 3)]
        XCTAssertFalse(Dominoes(input).chained)
    }

    func testDisconnectedSingleIsolated() {
        let input = [(1, 2), (2, 3), (3, 1), (4, 4)]
        XCTAssertFalse(Dominoes(input).chained)
    }

    func testNeedBacktrack() {
        let input = [(1, 2), (2, 3), (3, 1), (2, 4), (2, 4)]
        XCTAssertTrue(Dominoes(input).chained)
    }

    func testSeparateLoops() {
        let input = [(1, 2), (2, 3), (3, 1), (1, 1), (2, 2), (3, 3)]
        XCTAssertTrue(Dominoes(input).chained)
    }

    func testTenElements() {
        let input = [(1, 2), (5, 3), (3, 1), (1, 2), (2, 4), (1, 6), (2, 3), (3, 4), (5, 6)]
        XCTAssertTrue(Dominoes(input).chained)
    }

    static var allTests: [(String, (DominoesTests) -> () throws -> Void)] {
        return [
            ("testEmptyInputEmptyOutput", testEmptyInputEmptyOutput),
            ("testSingletonInputSingletonOutput", testSingletonInputSingletonOutput),
            ("testSingletonThatCantBeChained", testSingletonThatCantBeChained),
            ("testNoRepeatNumbers", testNoRepeatNumbers),
            ("testCanReverseDominoes", testCanReverseDominoes),
            ("testInvalidInput", testInvalidInput),
            ("testDisconnectedSimple", testDisconnectedSimple),
            ("testDisconnectedDoubleLoop", testDisconnectedDoubleLoop),
            ("testDisconnectedSingleIsolated", testDisconnectedSingleIsolated),
            ("testNeedBacktrack", testNeedBacktrack),
            ("testSeparateLoops", testSeparateLoops),
            ("testTenElements", testTenElements),
        ]
    }
}
