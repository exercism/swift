import Foundation
import Testing

@testable import TwoFer

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct TwoFerTests {

  @Test("no name given")
  func testNoNameGiven() { #expect(twoFer() == "One for you, one for me.") }

  @Test("a name given", .enabled(if: RUNALL))
  func testANameGiven() { #expect(twoFer(name: "Alice") == "One for Alice, one for me.") }

  @Test("another name given", .enabled(if: RUNALL))
  func testAnotherNameGiven() { #expect(twoFer(name: "Bob") == "One for Bob, one for me.") }
}
