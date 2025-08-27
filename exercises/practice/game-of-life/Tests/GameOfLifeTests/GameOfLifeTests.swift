import Foundation
import Testing

@testable import GameOfLife

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite
struct GameOfLifeTests {

  @Test("empty matrix")
  func testEmptyMatrix() {
    let initial: [[Int]] = []
    let expected: [[Int]] = []
    #expect(tick(initial) == expected)
  }

  @Test("live cells with zero live neighbors die", .enabled(if: RUNALL))
  func testLiveCellsWithZeroLiveNeighborsDie() {
    let initial: [[Int]] = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
    let expected: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    #expect(tick(initial) == expected)
  }

  @Test("live cells with only one live neighbor die", .enabled(if: RUNALL))
  func testLiveCellsWithOnlyOneLiveNeighborDie() {
    let initial: [[Int]] = [[0, 0, 0], [0, 1, 0], [0, 1, 0]]
    let expected: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    #expect(tick(initial) == expected)
  }

  @Test("live cells with two live neighbors stay alive", .enabled(if: RUNALL))
  func testLiveCellsWithTwoLiveNeighborsStayAlive() {
    let initial: [[Int]] = [[1, 0, 1], [1, 0, 1], [1, 0, 1]]
    let expected: [[Int]] = [[0, 0, 0], [1, 0, 1], [0, 0, 0]]
    #expect(tick(initial) == expected)
  }

  @Test("live cells with three live neighbors stay alive", .enabled(if: RUNALL))
  func testLiveCellsWithThreeLiveNeighborsStayAlive() {
    let initial: [[Int]] = [[0, 1, 0], [1, 0, 0], [1, 1, 0]]
    let expected: [[Int]] = [[0, 0, 0], [1, 0, 0], [1, 1, 0]]
    #expect(tick(initial) == expected)
  }

  @Test("dead cells with three live neighbors become alive", .enabled(if: RUNALL))
  func testDeadCellsWithThreeLiveNeighborsBecomeAlive() {
    let initial: [[Int]] = [[1, 1, 0], [0, 0, 0], [1, 0, 0]]
    let expected: [[Int]] = [[0, 0, 0], [1, 1, 0], [0, 0, 0]]
    #expect(tick(initial) == expected)
  }

  @Test("live cells with four or more neighbors die", .enabled(if: RUNALL))
  func testLiveCellsWithFourOrMoreNeighborsDie() {
    let initial: [[Int]] = [[1, 1, 1], [1, 1, 1], [1, 1, 1]]
    let expected: [[Int]] = [[1, 0, 1], [0, 0, 0], [1, 0, 1]]
    #expect(tick(initial) == expected)
  }

  @Test("bigger matrix", .enabled(if: RUNALL))
  func testBiggerMatrix() {
    let initial: [[Int]] = [
      [1, 1, 0, 1, 1, 0, 0, 0], [1, 0, 1, 1, 0, 0, 0, 0], [1, 1, 1, 0, 0, 1, 1, 1],
      [0, 0, 0, 0, 0, 1, 1, 0], [1, 0, 0, 0, 1, 1, 0, 0], [1, 1, 0, 0, 0, 1, 1, 1],
      [0, 0, 1, 0, 1, 0, 0, 1], [1, 0, 0, 0, 0, 0, 1, 1],
    ]
    let expected: [[Int]] = [
      [1, 1, 0, 1, 1, 0, 0, 0], [0, 0, 0, 0, 0, 1, 1, 0], [1, 0, 1, 1, 1, 1, 0, 1],
      [1, 0, 0, 0, 0, 0, 0, 1], [1, 1, 0, 0, 1, 0, 0, 1], [1, 1, 0, 1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1, 1],
    ]
    #expect(tick(initial) == expected)
  }
}
