import XCTest

@testable import Strain

class StrainTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testKeepOnEmptyListReturnsEmptyList() {
    let input: [Int] = []
    let expected: [Int] = []
    XCTAssertEqual(input.keep { x in true }, expected)
  }

  func testKeepsEverything() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [1, 3, 5]
    let expected = [1, 3, 5]
    XCTAssertEqual(input.keep { x in true }, expected)
  }

  func testKeepsNothing() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [1, 3, 5]
    let expected: [Int] = []
    XCTAssertEqual(input.keep { x in false }, expected)
  }

  func testKeepsFirstAndLast() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [1, 2, 3]
    let expected = [1, 3]
    XCTAssertEqual(input.keep { x in x % 2 == 1 }, expected)
  }

  func testKeepsNeitherFirstNorLast() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [1, 2, 3]
    let expected = [2]
    XCTAssertEqual(input.keep { x in x % 2 == 0 }, expected)
  }

  func testKeepsStrings() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
    let expected = ["zebra", "zombies", "zealot"]
    XCTAssertEqual(input.keep { x in x.starts(with: "z") }, expected)
  }

  func testKeepsLists() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [
      [1, 2, 3], [5, 5, 5], [5, 1, 2], [2, 1, 2], [1, 5, 2], [2, 2, 1], [1, 2, 5],
    ]
    let expected = [[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]]
    XCTAssertEqual(input.keep { x in x.contains(5) }, expected)
  }

  func testDiscardOnEmptyListReturnsEmptyList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input: [Int] = []
    let expected: [Int] = []
    XCTAssertEqual(input.discard { x in true }, expected)
  }

  func testDiscardsEverything() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [1, 3, 5]
    let expected: [Int] = []
    XCTAssertEqual(input.discard { x in true }, expected)
  }

  func testDiscardsNothing() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [1, 3, 5]
    let expected = [1, 3, 5]
    XCTAssertEqual(input.discard { x in false }, expected)
  }

  func testDiscardsFirstAndLast() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [1, 2, 3]
    let expected = [2]
    XCTAssertEqual(input.discard { x in x % 2 == 1 }, expected)
  }

  func testDiscardsNeitherFirstNorLast() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [1, 2, 3]
    let expected = [1, 3]
    XCTAssertEqual(input.discard { x in x % 2 == 0 }, expected)
  }

  func testDiscardsStrings() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
    let expected = ["apple", "banana", "cherimoya"]
    XCTAssertEqual(input.discard { x in x.starts(with: "z") }, expected)
  }

  func testDiscardsLists() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let input = [
      [1, 2, 3], [5, 5, 5], [5, 1, 2], [2, 1, 2], [1, 5, 2], [2, 2, 1], [1, 2, 5],
    ]
    let expected = [[1, 2, 3], [2, 1, 2], [2, 2, 1]]
    XCTAssertEqual(input.discard { x in x.contains(5) }, expected)
  }
}
