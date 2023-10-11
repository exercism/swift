import XCTest

@testable import Grains

class GrainsTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testGrainsOnSquare1() {
    XCTAssertEqual(try! Grains.square(1), 1)
  }

  func testGrainsOnSquare2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Grains.square(2), 2)
  }

  func testGrainsOnSquare3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Grains.square(3), 4)
  }

  func testGrainsOnSquare4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Grains.square(4), 8)
  }

  func testGrainsOnSquare16() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Grains.square(16), 32768)
  }

  func testGrainsOnSquare32() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Grains.square(32), 2_147_483_648)
  }

  func testGrainsOnSquare64() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Grains.square(64), 9_223_372_036_854_775_808)
  }

  func testSquare0IsInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Grains.square(0)) { error in
      XCTAssertEqual(error as? GrainsError, GrainsError.inputTooLow)
    }
  }

  func testNegativeSquareIsInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Grains.square(-1)) { error in
      XCTAssertEqual(error as? GrainsError, GrainsError.inputTooLow)
    }
  }

  func testSquareGreaterThan64IsInvalid() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try Grains.square(65)) { error in
      XCTAssertEqual(error as? GrainsError, GrainsError.inputTooHigh)
    }
  }

  func test2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! Grains.total, 18_446_744_073_709_551_615)
  }
}
