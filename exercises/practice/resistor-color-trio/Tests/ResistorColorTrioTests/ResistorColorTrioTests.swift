import Foundation
import Testing

@testable import ResistorColorTrio

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ResistorColorTrioTests {

  @Test("Orange and orange and black")
  func testOrangeAndOrangeAndBlack() throws {
    #expect(try ResistorColorTrio.label(for: ["orange", "orange", "black"]) == "33 ohms")
  }

  @Test("Blue and grey and brown", .enabled(if: RUNALL))
  func testBlueAndGreyAndBrown() throws {
    #expect(try ResistorColorTrio.label(for: ["blue", "grey", "brown"]) == "680 ohms")
  }

  @Test("Red and black and red", .enabled(if: RUNALL))
  func testRedAndBlackAndRed() throws {
    #expect(try ResistorColorTrio.label(for: ["red", "black", "red"]) == "2 kiloohms")
  }

  @Test("Green and brown and orange", .enabled(if: RUNALL))
  func testGreenAndBrownAndOrange() throws {
    #expect(try ResistorColorTrio.label(for: ["green", "brown", "orange"]) == "51 kiloohms")
  }

  @Test("Yellow and violet and yellow", .enabled(if: RUNALL))
  func testYellowAndVioletAndYellow() throws {
    #expect(try ResistorColorTrio.label(for: ["yellow", "violet", "yellow"]) == "470 kiloohms")
  }

  @Test("Blue and violet and blue", .enabled(if: RUNALL))
  func testBlueAndVioletAndBlue() throws {
    #expect(try ResistorColorTrio.label(for: ["blue", "violet", "blue"]) == "67 megaohms")
  }

  @Test("Minimum possible value", .enabled(if: RUNALL))
  func testMinimumPossibleValue() throws {
    #expect(try ResistorColorTrio.label(for: ["black", "black", "black"]) == "0 ohms")
  }

  @Test("Maximum possible value", .enabled(if: RUNALL))
  func testMaximumPossibleValue() throws {
    #expect(try ResistorColorTrio.label(for: ["white", "white", "white"]) == "99 gigaohms")
  }

  @Test("First two colors make an invalid octal number", .enabled(if: RUNALL))
  func testFirstTwoColorsMakeAnInvalidOctalNumber() throws {
    #expect(try ResistorColorTrio.label(for: ["black", "grey", "black"]) == "8 ohms")
  }

  @Test("Ignore extra colors", .enabled(if: RUNALL))
  func testIgnoreExtraColors() throws {
    #expect(
      try ResistorColorTrio.label(for: ["blue", "green", "yellow", "orange"]) == "650 kiloohms")
  }
}
