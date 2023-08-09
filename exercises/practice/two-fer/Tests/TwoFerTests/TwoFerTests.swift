import XCTest

@testable import TwoFer

class TwoFerTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testNoNameGiven() {
    XCTAssertEqual(twoFer(), "One for you, one for me.")
  }

  func testANameGiven() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(twoFer(name: "Alice"), "One for Alice, one for me.")
  }

  func testAnotherNameGiven() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(twoFer(name: "Bob"), "One for Bob, one for me.")
  }
}
