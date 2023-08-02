import XCTest

@testable import FlattenArray

class FlattenArrayTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmpty() {
    let result: [Int] = flattenArray([])
    let expected: [Int] = []
    XCTAssertEqual(expected, result)
  }

  func testNoNesting() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([0, 1, 2])
    let expected: [Int] = [0, 1, 2]
    XCTAssertEqual(expected, result)
  }

  func testFlattensANestedArray() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([[[]]])
    let expected: [Int] = []
    XCTAssertEqual(expected, result)
  }

  func testFlattensArrayWithJustIntegersPresent() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([1, [2, 3, 4, 5, 6, 7], 8])
    let expected: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
    XCTAssertEqual(expected, result)
  }

  func test5LevelNesting() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
    let expected: [Int] = [0, 2, 2, 3, 8, 100, 4, 50, -2]
    XCTAssertEqual(expected, result)
  }

  func test6LevelNesting() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([1, [2, [[3]], [4, [[5]]], 6, 7], 8])
    let expected: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
    XCTAssertEqual(expected, result)
  }

  func testNullValuesAreOmittedFromTheFinalResult() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([1, 2, nil])
    let expected: [Int] = [1, 2]
    XCTAssertEqual(expected, result)
  }

  func testConsecutiveNullValuesAtTheFrontOfTheListAreOmittedFromTheFinalResult() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([nil, nil, 3])
    let expected: [Int] = [3]
    XCTAssertEqual(expected, result)
  }

  func testConsecutiveNullValuesInTheMiddleOfTheListAreOmittedFromTheFinalResult() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([1, nil, nil, 4])
    let expected: [Int] = [1, 4]
    XCTAssertEqual(expected, result)
  }

  func test6LevelNestListWithNullValues() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2])
    let expected: [Int] = [0, 2, 2, 3, 8, 100, -2]
    XCTAssertEqual(expected, result)
  }

  func testAllValuesInNestedListAreNull() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let result: [Int] = flattenArray([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil])
    let expected: [Int] = []
    XCTAssertEqual(expected, result)
  }
}
