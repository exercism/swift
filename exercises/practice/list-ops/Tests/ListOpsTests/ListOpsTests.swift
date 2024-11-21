import XCTest

@testable import ListOps

class ListOpsTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testListToEmptyList11() {
    let input1: [Int] = []
    let input2: [Int] = [1, 2, 3, 4]
    let expected: [Int] = [1, 2, 3, 4]
    XCTAssertEqual(ListOps.append(input1, input2), expected)
  }

  func testEmptyListToList12() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input1: [Int] = [1, 2, 3, 4]
    let input2: [Int] = []
    let expected: [Int] = [1, 2, 3, 4]
    XCTAssertEqual(ListOps.append(input1, input2), expected)
  }

  func testNonEmptyLists13() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input1: [Int] = [1, 2]
    let input2: [Int] = [2, 3, 4, 5]
    let expected: [Int] = [1, 2, 2, 3, 4, 5]
    XCTAssertEqual(ListOps.append(input1, input2), expected)
  }

  func testEmptyList21() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected = [Int]()
    XCTAssertEqual(ListOps.concat([]), expected)
  }

  func testListOfLists22() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected = [1, 2, 3, 4, 5, 6]
    XCTAssertEqual(ListOps.concat([1, 2], [3], [], [4, 5, 6]), expected)
  }

  func testListOfNestedLists23() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected = [[1], [2], [3], [], [4, 5, 6]]
    XCTAssertEqual(ListOps.concat([[1], [2]], [[3]], [[]], [[4, 5, 6]]), expected)
  }

  func testEmptyList31() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = []
    let expected: [Int] = []
    XCTAssertEqual(ListOps.filter(input) { $0 % 2 == 1 }, expected)
  }

  func testNonEmptyList32() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = [1, 2, 3, 5]
    let expected: [Int] = [1, 3, 5]
    XCTAssertEqual(ListOps.filter(input) { $0 % 2 == 1 }, expected)
  }

  func testNonEmptyList41() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = [1, 2, 3, 4]
    let expected: Int = 4
    XCTAssertEqual(ListOps.length(input), expected)
  }

  func testEmptyList51() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = []
    let expected: [Int] = []
    XCTAssertEqual(ListOps.map(input) { $0 + 1 }, expected)
  }

  func testNonEmptyList52() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = [1, 3, 5, 7]
    let expected: [Int] = [2, 4, 6, 8]
    XCTAssertEqual(ListOps.map(input) { $0 + 1 }, expected)
  }

  func testDirectionIndependentFunctionAppliedToNonEmptyList61() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = [1, 2, 3, 4]
    let expected: Int = 15
    XCTAssertEqual(ListOps.foldLeft(input, accumulated: 5, combine: +), expected)
  }

  func testEmptyList71() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = []
    let expected: Int = 2
    XCTAssertEqual(ListOps.foldRight(input, accumulated: 2, combine: *), expected)
  }

  func testDirectionIndependentFunctionAppliedToNonEmptyList72() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = [1, 2, 3, 4]
    let expected: Int = 15
    XCTAssertEqual(ListOps.foldRight(input, accumulated: 5, combine: +), expected)
  }

  func testEmptyList81() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [Int]()
    let expected = [Int]()
    XCTAssertEqual(ListOps.reverse(input), expected)
  }

  func testListOfListsIsNotFlattened82() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [[1, 2], [3], [], [4, 5, 6]]
    let expected = [[4, 5, 6], [], [3], [1, 2]]
    XCTAssertEqual(ListOps.reverse(input), expected)
  }
}
