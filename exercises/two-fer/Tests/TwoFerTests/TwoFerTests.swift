import XCTest
@testable import TwoFer

class TwoFerTests: XCTestCase {

    func testNoNameGiven() {
        XCTAssertEqual(TwoFer.twoFer(), "One for you, one for me.")
    }

    func testANameGiven() {
        XCTAssertEqual(TwoFer.twoFer(name: "Alice"), "One for Alice, one for me.")
    }

    func testAnotherNameGiven() {
        XCTAssertEqual(TwoFer.twoFer(name: "Bob"), "One for Bob, one for me.")
    }

    static var allTests: [(String, (TwoFerTests) -> () throws -> Void)] {
        return [
            ("testNoNameGiven", testNoNameGiven),
            ("testANameGiven", testANameGiven),
            ("testAnotherNameGiven", testAnotherNameGiven),
        ]
    }
}
