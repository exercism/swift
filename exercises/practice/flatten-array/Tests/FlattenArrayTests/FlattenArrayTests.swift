import Foundation
import Testing

@testable import FlattenArray

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct FlattenArrayTests {

  @Test("empty")
  func testEmpty() {
    let result: [Int] = flattenArray([])
    let expected: [Int] = []
    #expect(expected == result)
  }

  @Test("no nesting", .enabled(if: RUNALL))
  func testNoNesting() {
    let result: [Int] = flattenArray([0, 1, 2])
    let expected: [Int] = [0, 1, 2]
    #expect(expected == result)
  }

  @Test("flattens a nested array", .enabled(if: RUNALL))
  func testFlattensANestedArray() {
    let result: [Int] = flattenArray([[[]]])
    let expected: [Int] = []
    #expect(expected == result)
  }

  @Test("flattens array with just integers present", .enabled(if: RUNALL))
  func testFlattensArrayWithJustIntegersPresent() {
    let result: [Int] = flattenArray([1, [2, 3, 4, 5, 6, 7], 8])
    let expected: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
    #expect(expected == result)
  }

  @Test("5 level nesting", .enabled(if: RUNALL))
  func test5LevelNesting() {
    let result: [Int] = flattenArray([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
    let expected: [Int] = [0, 2, 2, 3, 8, 100, 4, 50, -2]
    #expect(expected == result)
  }

  @Test("6 level nesting", .enabled(if: RUNALL))
  func test6LevelNesting() {
    let result: [Int] = flattenArray([1, [2, [[3]], [4, [[5]]], 6, 7], 8])
    let expected: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
    #expect(expected == result)
  }

  @Test("null values are omitted from the final result", .enabled(if: RUNALL))
  func testNullValuesAreOmittedFromTheFinalResult() {
    let result: [Int] = flattenArray([1, 2, nil])
    let expected: [Int] = [1, 2]
    #expect(expected == result)
  }

  @Test(
    "consecutive null values at the front of the list are omitted from the final result",
    .enabled(if: RUNALL))
  func testConsecutiveNullValuesAtTheFrontOfTheListAreOmittedFromTheFinalResult() {
    let result: [Int] = flattenArray([nil, nil, 3])
    let expected: [Int] = [3]
    #expect(expected == result)
  }

  @Test(
    "consecutive null values in the middle of the list are omitted from the final result",
    .enabled(if: RUNALL))
  func testConsecutiveNullValuesInTheMiddleOfTheListAreOmittedFromTheFinalResult() {
    let result: [Int] = flattenArray([1, nil, nil, 4])
    let expected: [Int] = [1, 4]
    #expect(expected == result)
  }

  @Test("6 level nest list with null values", .enabled(if: RUNALL))
  func test6LevelNestListWithNullValues() {
    let result: [Int] = flattenArray([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2])
    let expected: [Int] = [0, 2, 2, 3, 8, 100, -2]
    #expect(expected == result)
  }

  @Test("all values in nested list are null", .enabled(if: RUNALL))
  func testAllValuesInNestedListAreNull() {
    let result: [Int] = flattenArray([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil])
    let expected: [Int] = []
    #expect(expected == result)
  }
}
