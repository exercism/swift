import Foundation
import Testing

@testable import Dominoes

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct DominoesTests {

  @Test("empty input = empty output")
  func testEmptyInputEmptyOutput() {
    let input = [(Int, Int)]()
    #expect(Dominoes(input).chained)
  }

  @Test("singleton input = singleton output", .enabled(if: RUNALL))
  func testSingletonInputSingletonOutput() {
    let input = [(1, 1)]
    #expect(Dominoes(input).chained)
  }

  @Test("singleton that can't be chained", .enabled(if: RUNALL))
  func testSingletonThatCantBeChained() {
    let input = [(1, 2)]
    #expect(!Dominoes(input).chained)
  }

  @Test("three elements", .enabled(if: RUNALL))
  func testThreeElements() {
    let input = [(1, 2), (3, 1), (2, 3)]
    #expect(Dominoes(input).chained)
  }

  @Test("can reverse dominoes", .enabled(if: RUNALL))
  func testCanReverseDominoes() {
    let input = [(1, 2), (1, 3), (2, 3)]
    #expect(Dominoes(input).chained)
  }

  @Test("can't be chained", .enabled(if: RUNALL))
  func testCantBeChained() {
    let input = [(1, 2), (4, 1), (2, 3)]
    #expect(!Dominoes(input).chained)
  }

  @Test("disconnected - simple", .enabled(if: RUNALL))
  func testDisconnectedSimple() {
    let input = [(1, 1), (2, 2)]
    #expect(!Dominoes(input).chained)
  }

  @Test("disconnected - double loop", .enabled(if: RUNALL))
  func testDisconnectedDoubleLoop() {
    let input = [(1, 2), (2, 1), (3, 4), (4, 3)]
    #expect(!Dominoes(input).chained)
  }

  @Test("disconnected - single isolated", .enabled(if: RUNALL))
  func testDisconnectedSingleIsolated() {
    let input = [(1, 2), (2, 3), (3, 1), (4, 4)]
    #expect(!Dominoes(input).chained)
  }

  @Test("need backtrack", .enabled(if: RUNALL))
  func testNeedBacktrack() {
    let input = [(1, 2), (2, 3), (3, 1), (2, 4), (2, 4)]
    #expect(Dominoes(input).chained)
  }

  @Test("separate loops", .enabled(if: RUNALL))
  func testSeparateLoops() {
    let input = [(1, 2), (2, 3), (3, 1), (1, 1), (2, 2), (3, 3)]
    #expect(Dominoes(input).chained)
  }

  @Test("nine elements", .enabled(if: RUNALL))
  func testNineElements() {
    let input = [(1, 2), (5, 3), (3, 1), (1, 2), (2, 4), (1, 6), (2, 3), (3, 4), (5, 6)]
    #expect(Dominoes(input).chained)
  }

  @Test("separate three-domino loops", .enabled(if: RUNALL))
  func testSeparateThreeDominoLoops() {
    let input = [(1, 2), (2, 3), (3, 1), (4, 5), (5, 6), (6, 4)]
    #expect(!Dominoes(input).chained)
  }
}
