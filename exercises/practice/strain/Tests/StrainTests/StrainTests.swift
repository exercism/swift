import Foundation
import Testing

@testable import Strain

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct StrainTests {

  @Test("keep on empty list returns empty list")
  func testKeepOnEmptyListReturnsEmptyList() {
    let input: [Int] = []
    let expected: [Int] = []
    #expect(input.keep { x in true } == expected)
  }

  @Test("keeps everything", .enabled(if: RUNALL))
  func testKeepsEverything() {
    let input = [1, 3, 5]
    let expected = [1, 3, 5]
    #expect(input.keep { x in true } == expected)
  }

  @Test("keeps nothing", .enabled(if: RUNALL))
  func testKeepsNothing() {
    let input = [1, 3, 5]
    let expected: [Int] = []
    #expect(input.keep { x in false } == expected)
  }

  @Test("keeps first and last", .enabled(if: RUNALL))
  func testKeepsFirstAndLast() {
    let input = [1, 2, 3]
    let expected = [1, 3]
    #expect(input.keep { x in x % 2 == 1 } == expected)
  }

  @Test("keeps neither first nor last", .enabled(if: RUNALL))
  func testKeepsNeitherFirstNorLast() {
    let input = [1, 2, 3]
    let expected = [2]
    #expect(input.keep { x in x % 2 == 0 } == expected)
  }

  @Test("keeps strings", .enabled(if: RUNALL))
  func testKeepsStrings() {
    let input = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
    let expected = ["zebra", "zombies", "zealot"]
    #expect(input.keep { x in x.starts(with: "z") } == expected)
  }

  @Test("keeps lists", .enabled(if: RUNALL))
  func testKeepsLists() {
    let input = [
      [1, 2, 3], [5, 5, 5], [5, 1, 2], [2, 1, 2], [1, 5, 2], [2, 2, 1], [1, 2, 5],
    ]
    let expected = [[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]]
    #expect(input.keep { x in x.contains(5) } == expected)
  }

  @Test("discard on empty list returns empty list", .enabled(if: RUNALL))
  func testDiscardOnEmptyListReturnsEmptyList() {
    let input: [Int] = []
    let expected: [Int] = []
    #expect(input.discard { x in true } == expected)
  }

  @Test("discards everything", .enabled(if: RUNALL))
  func testDiscardsEverything() {
    let input = [1, 3, 5]
    let expected: [Int] = []
    #expect(input.discard { x in true } == expected)
  }

  @Test("discards nothing", .enabled(if: RUNALL))
  func testDiscardsNothing() {
    let input = [1, 3, 5]
    let expected = [1, 3, 5]
    #expect(input.discard { x in false } == expected)
  }

  @Test("discards first and last", .enabled(if: RUNALL))
  func testDiscardsFirstAndLast() {
    let input = [1, 2, 3]
    let expected = [2]
    #expect(input.discard { x in x % 2 == 1 } == expected)
  }

  @Test("discards neither first nor last", .enabled(if: RUNALL))
  func testDiscardsNeitherFirstNorLast() {
    let input = [1, 2, 3]
    let expected = [1, 3]
    #expect(input.discard { x in x % 2 == 0 } == expected)
  }

  @Test("discards strings", .enabled(if: RUNALL))
  func testDiscardsStrings() {
    let input = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
    let expected = ["apple", "banana", "cherimoya"]
    #expect(input.discard { x in x.starts(with: "z") } == expected)
  }

  @Test("discards lists", .enabled(if: RUNALL))
  func testDiscardsLists() {
    let input = [
      [1, 2, 3], [5, 5, 5], [5, 1, 2], [2, 1, 2], [1, 5, 2], [2, 2, 1], [1, 2, 5],
    ]
    let expected = [[1, 2, 3], [2, 1, 2], [2, 2, 1]]
    #expect(input.discard { x in x.contains(5) } == expected)
  }
}
