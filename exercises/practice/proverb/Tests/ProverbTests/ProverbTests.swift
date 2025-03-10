import Foundation
import Testing

@testable import Proverb

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ProverbTests {

  @Test("zero pieces")
  func testZeroPieces() {
    let expected = ""
    #expect(Proverb([]).recite() == expected)
  }

  @Test("one piece", .enabled(if: RUNALL))
  func testOnePiece() {
    let expected = "And all for the want of a nail."
    #expect(Proverb(["nail"]).recite() == expected)
  }

  @Test("two pieces", .enabled(if: RUNALL))
  func testTwoPieces() {
    let expected = "For want of a nail the shoe was lost.\n" + "And all for the want of a nail."
    #expect(Proverb(["nail", "shoe"]).recite() == expected)
  }

  @Test("three pieces", .enabled(if: RUNALL))
  func testThreePieces() {
    let expected =
      "For want of a nail the shoe was lost.\n" + "For want of a shoe the horse was lost.\n"
      + "And all for the want of a nail."
    #expect(Proverb(["nail", "shoe", "horse"]).recite() == expected)
  }

  @Test("full proverb", .enabled(if: RUNALL))
  func testFullProverb() {
    let expected =
      "For want of a nail the shoe was lost.\n" + "For want of a shoe the horse was lost.\n"
      + "For want of a horse the rider was lost.\n" + "For want of a rider the message was lost.\n"
      + "For want of a message the battle was lost.\n"
      + "For want of a battle the kingdom was lost.\n" + "And all for the want of a nail."
    #expect(
      Proverb(["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]).recite()
        == expected)
  }

  @Test("four pieces modernized", .enabled(if: RUNALL))
  func testFourPiecesModernized() {
    let expected =
      "For want of a pin the gun was lost.\n" + "For want of a gun the soldier was lost.\n"
      + "For want of a soldier the battle was lost.\n" + "And all for the want of a pin."
    #expect(Proverb(["pin", "gun", "soldier", "battle"]).recite() == expected)
  }
}
