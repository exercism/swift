import XCTest

@testable import ArmstrongNumbers

class ArmstrongNumbersTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testZeroIsAnArmstrongNumber() {
    XCTAssertTrue(isArmstrongNumber(0))
  }

  func testSingleDigitNumbersAreArmstrongNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isArmstrongNumber(5))
  }

  func testThereAreNoTwoDigitArmstrongNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isArmstrongNumber(10))
  }

  func testThreeDigitNumberThatIsAnArmstrongNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isArmstrongNumber(153))
  }

  func testThreeDigitNumberThatIsNotAnArmstrongNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isArmstrongNumber(100))
  }

  func testFourDigitNumberThatIsAnArmstrongNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isArmstrongNumber(9474))
  }

  func testFourDigitNumberThatIsNotAnArmstrongNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isArmstrongNumber(9475))
  }

  func testSevenDigitNumberThatIsAnArmstrongNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertTrue(isArmstrongNumber(9_926_315))
  }

  func testSevenDigitNumberThatIsNotAnArmstrongNumber() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertFalse(isArmstrongNumber(9_926_314))
  }
}
