import Foundation
import Testing

@testable import ResistorColorDuo

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ResistorColorDuoTests {

  @Test("Brown and black")
  func testBrownAndBlack() throws {
    #expect(try ResistorColorDuo.value(for: ["brown", "black"]) == 10)
  }

  @Test("Blue and grey", .enabled(if: RUNALL))
  func testBlueAndGrey() throws {
    #expect(try ResistorColorDuo.value(for: ["blue", "grey"]) == 68)
  }

  @Test("Yellow and violet", .enabled(if: RUNALL))
  func testYellowAndViolet() throws {
    #expect(try ResistorColorDuo.value(for: ["yellow", "violet"]) == 47)
  }

  @Test("White and red", .enabled(if: RUNALL))
  func testWhiteAndRed() throws {
    #expect(try ResistorColorDuo.value(for: ["white", "red"]) == 92)
  }

  @Test("Orange and orange", .enabled(if: RUNALL))
  func testOrangeAndOrange() throws {
    #expect(try ResistorColorDuo.value(for: ["orange", "orange"]) == 33)
  }

  @Test("Ignore additional colors", .enabled(if: RUNALL))
  func testIgnoreAdditionalColors() throws {
    #expect(try ResistorColorDuo.value(for: ["green", "brown", "orange"]) == 51)
  }

  @Test("Black and brown, one-digit", .enabled(if: RUNALL))
  func testBlackAndBrownOneDigit() throws {
    #expect(try ResistorColorDuo.value(for: ["black", "brown"]) == 1)
  }
}
