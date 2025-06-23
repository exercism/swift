import Foundation
import Testing

@testable import ResistorColor

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ResistorColorTests {

  @Test("Black")
  func testBlack() throws {
    #expect(try ResistorColor.colorCode(for: "black") == 0)
  }

  @Test("White", .enabled(if: RUNALL))
  func testWhite() throws {
    #expect(try ResistorColor.colorCode(for: "white") == 9)
  }

  @Test("Orange", .enabled(if: RUNALL))
  func testOrange() throws {
    #expect(try ResistorColor.colorCode(for: "orange") == 3)
  }

  @Test("Colors", .enabled(if: RUNALL))
  func testColors() {
    #expect(
      ResistorColor.colors == [
        "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white",
      ])
  }
}
