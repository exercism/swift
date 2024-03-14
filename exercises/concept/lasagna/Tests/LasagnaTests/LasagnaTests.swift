import XCTest

@testable import Lasagna

let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

class TaskExpectedMinutesInOvenTests: XCTestCase {
  func testExpectedMinutes() {
    XCTAssertEqual(expectedMinutesInOven, 40)
  }
}

class TaskRemainingMinutesInOven: XCTestCase {
  func testRemainingMinutes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(remainingMinutesInOven(elapsedMinutes: 13), 27)
  }

  func testRemainingMinutesWhenDone() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(remainingMinutesInOven(elapsedMinutes: 40), 0)
  }

  func testRemainingMinutesWhenLessThanOne() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(remainingMinutesInOven(elapsedMinutes: 39), 1)
  }
}

class TaskPreparationTimeInMinutes: XCTestCase {
  func testPreparationMinutes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(preparationTimeInMinutes(layers: 6), 12)
  }

  func testPreparationMinutesForOneLayer() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(preparationTimeInMinutes(layers: 1), 2)
  }

  func testPreparationMinutesForZeroLayers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(preparationTimeInMinutes(layers: 0), 0)
  }
}

class TaskTotalTimeInMinutes: XCTestCase {
  func testTotalMinutes() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(totalTimeInMinutes(layers: 1, elapsedMinutes: 30), 32)
  }

  func testTotalMinutesWhenDone() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(totalTimeInMinutes(layers: 2, elapsedMinutes: 25), 29)
  }

  func testTotalMinutesWhenLessThanOne() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(totalTimeInMinutes(layers: 4, elapsedMinutes: 8), 16)
  }
}
