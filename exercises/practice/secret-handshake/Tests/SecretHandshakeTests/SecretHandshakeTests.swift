import Foundation
import Testing

@testable import SecretHandshake

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SecretHandshakeTests {

  @Test("wink for 1")
  func testWinkFor1() {
    #expect(commands(number: 1) == ["wink"])
  }

  @Test("double blink for 10", .enabled(if: RUNALL))
  func testDoubleBlinkFor10() {
    #expect(commands(number: 2) == ["double blink"])
  }

  @Test("close your eyes for 100", .enabled(if: RUNALL))
  func testCloseYourEyesFor100() {
    #expect(commands(number: 4) == ["close your eyes"])
  }

  @Test("jump for 1000", .enabled(if: RUNALL))
  func testJumpFor1000() {
    #expect(commands(number: 8) == ["jump"])
  }

  @Test("combine two actions", .enabled(if: RUNALL))
  func testCombineTwoActions() {
    #expect(commands(number: 3) == ["wink", "double blink"])
  }

  @Test("reverse two actions", .enabled(if: RUNALL))
  func testReverseTwoActions() {
    #expect(commands(number: 19) == ["double blink", "wink"])
  }

  @Test("reversing one action gives the same action", .enabled(if: RUNALL))
  func testReversingOneActionGivesTheSameAction() {
    #expect(commands(number: 24) == ["jump"])
  }

  @Test("reversing no actions still gives no actions", .enabled(if: RUNALL))
  func testReversingNoActionsStillGivesNoActions() {
    #expect(commands(number: 16) == [])
  }

  @Test("all possible actions", .enabled(if: RUNALL))
  func testAllPossibleActions() {
    #expect(commands(number: 15) == ["wink", "double blink", "close your eyes", "jump"])
  }

  @Test("reverse all possible actions", .enabled(if: RUNALL))
  func testReverseAllPossibleActions() {
    #expect(commands(number: 31) == ["jump", "close your eyes", "double blink", "wink"])
  }

  @Test("do nothing for zero", .enabled(if: RUNALL))
  func testDoNothingForZero() {
    #expect(commands(number: 0) == [])
  }
}
