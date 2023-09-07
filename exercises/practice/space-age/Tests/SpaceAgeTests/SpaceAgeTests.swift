import XCTest

@testable import SpaceAge

class SpaceAgeTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testAgeOnEarth() {
    let age = SpaceAge(1_000_000_000)
    XCTAssertEqual(age.onEarth, 31.69, accuracy: 0.02)
  }

  func testAgeOnMercury() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let age = SpaceAge(2_134_835_688)
    XCTAssertEqual(age.onMercury, 280.88, accuracy: 0.02)
  }

  func testAgeOnVenus() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let age = SpaceAge(189_839_836)
    XCTAssertEqual(age.onVenus, 9.78, accuracy: 0.02)
  }

  func testAgeOnMars() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let age = SpaceAge(2_129_871_239)
    XCTAssertEqual(age.onMars, 35.88, accuracy: 0.02)
  }

  func testAgeOnJupiter() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let age = SpaceAge(901_876_382)
    XCTAssertEqual(age.onJupiter, 2.41, accuracy: 0.02)
  }

  func testAgeOnSaturn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let age = SpaceAge(2_000_000_000)
    XCTAssertEqual(age.onSaturn, 2.15, accuracy: 0.02)
  }

  func testAgeOnUranus() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let age = SpaceAge(1_210_123_456)
    XCTAssertEqual(age.onUranus, 0.46, accuracy: 0.02)
  }

  func testAgeOnNeptune() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let age = SpaceAge(1_821_023_456)
    XCTAssertEqual(age.onNeptune, 0.35, accuracy: 0.02)
  }
}
