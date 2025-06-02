import Foundation
import Testing

@testable import Darts

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct DartsTests {

  @Test("Missed target")
  func testMissedTarget() {
    #expect(dartScore(x: -9, y: 9) == 0)
  }

  @Test("On the outer circle", .enabled(if: RUNALL))
  func testOnTheOuterCircle() {
    #expect(dartScore(x: 0, y: 10) == 1)
  }

  @Test("On the middle circle", .enabled(if: RUNALL))
  func testOnTheMiddleCircle() {
    #expect(dartScore(x: -5, y: 0) == 5)
  }

  @Test("On the inner circle", .enabled(if: RUNALL))
  func testOnTheInnerCircle() {
    #expect(dartScore(x: 0, y: -1) == 10)
  }

  @Test("Exactly on center", .enabled(if: RUNALL))
  func testExactlyOnCenter() {
    #expect(dartScore(x: 0, y: 0) == 10)
  }

  @Test("Near the center", .enabled(if: RUNALL))
  func testNearTheCenter() {
    #expect(dartScore(x: -0.1, y: -0.1) == 10)
  }

  @Test("Just within the inner circle", .enabled(if: RUNALL))
  func testJustWithinTheInnerCircle() {
    #expect(dartScore(x: 0.7, y: 0.7) == 10)
  }

  @Test("Just outside the inner circle", .enabled(if: RUNALL))
  func testJustOutsideTheInnerCircle() {
    #expect(dartScore(x: 0.8, y: -0.8) == 5)
  }

  @Test("Just within the middle circle", .enabled(if: RUNALL))
  func testJustWithinTheMiddleCircle() {
    #expect(dartScore(x: -3.5, y: 3.5) == 5)
  }

  @Test("Just outside the middle circle", .enabled(if: RUNALL))
  func testJustOutsideTheMiddleCircle() {
    #expect(dartScore(x: -3.6, y: -3.6) == 1)
  }

  @Test("Just within the outer circle", .enabled(if: RUNALL))
  func testJustWithinTheOuterCircle() {
    #expect(dartScore(x: -7, y: 7) == 1)
  }

  @Test("Just outside the outer circle", .enabled(if: RUNALL))
  func testJustOutsideTheOuterCircle() {
    #expect(dartScore(x: 7.1, y: -7.1) == 0)
  }

  @Test("Asymmetric position between the inner and middle circles", .enabled(if: RUNALL))
  func testAsymmetricPositionBetweenTheInnerAndMiddleCircles() {
    #expect(dartScore(x: 0.5, y: -4) == 5)
  }
}
