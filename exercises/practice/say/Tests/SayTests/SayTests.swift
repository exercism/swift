import XCTest

@testable import Say

class SayTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testZero() {
    XCTAssertEqual(try! say(number: 0), "zero")
  }

  func testOne() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 1), "one")
  }

  func testFourteen() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 14), "fourteen")
  }

  func testTwenty() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 20), "twenty")
  }

  func testTwentyTwo() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 22), "twenty-two")
  }

  func testThirty() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 30), "thirty")
  }

  func testNinetyNine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 99), "ninety-nine")
  }

  func testOneHundred() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 100), "one hundred")
  }

  func testOneHundredTwentyThree() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 123), "one hundred twenty-three")
  }

  func testTwoHundred() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 200), "two hundred")
  }

  func testNineHundredNinetyNine() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 999), "nine hundred ninety-nine")
  }

  func testOneThousand() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 1000), "one thousand")
  }

  func testOneThousandTwoHundredThirtyFour() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 1234), "one thousand two hundred thirty-four")
  }

  func testOneMillion() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 1_000_000), "one million")
  }

  func testOneMillionTwoThousandThreeHundredFortyFive() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 1_002_345), "one million two thousand three hundred forty-five")
  }

  func testOneBillion() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! say(number: 1_000_000_000), "one billion")
  }

  func testABigNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      try! say(number: 987_654_321_123),
      "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three"
    )
  }

  func testNumbersBelowZeroAreOutOfRange() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test

    XCTAssertThrowsError(try say(number: -1)) { error in
      XCTAssertEqual(error as? SayError, SayError.outOfRange)
    }
  }

  func testNumbersAbove999999999999AreOutOfRange() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test

    XCTAssertThrowsError(try say(number: 1_000_000_000_000)) { error in
      XCTAssertEqual(error as? SayError, SayError.outOfRange)
    }
  }
}
