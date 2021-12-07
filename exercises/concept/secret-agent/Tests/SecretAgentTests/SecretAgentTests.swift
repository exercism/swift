import XCTest

@testable import SecretAgent

final class SecretAgentTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false
  let protected = protectSecret(
    "UMBRA will fill everyone's sugar bowls with salt!", withPassword: "P455w0rd")

  func testPasswordSuccess() {
    XCTAssertEqual(protected("P455w0rd"), "UMBRA will fill everyone's sugar bowls with salt!")
  }

  func testPasswordFail() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(protected("hunter2"), "Sorry. No hidden secrets here.")
  }

  func testCombination1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    let combo = generateCombination(forRoom: 1, usingFunction: { ($0 * 127 + 19) % 256 })
    XCTAssertTrue(combo == (146, 129, 18))
  }

  func testCombination2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let combo = generateCombination(
      forRoom: 1,
      usingFunction: {
        ($0 * 73 + 161) % 256
      })
    XCTAssertTrue(combo == (234, 91, 148))
  }

  static var allTests = [
    ("testPasswordSuccess", testPasswordSuccess),
    ("testPasswordFail", testPasswordFail),
    ("testCombination1", testCombination1),
    ("testCombination2", testCombination2),
  ]
}
