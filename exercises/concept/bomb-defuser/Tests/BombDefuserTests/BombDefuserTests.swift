import Testing
import Foundation

@testable import BombDefuser

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct BombDefuserTests {
  let stringify = { (tuple: (String, String, String)) in "\(tuple)" }

  @Test("flip")
  func testFlip() {
    let expected = ("Dabba", "Yabba", "Doo")
    let got = flip(("Yabba", "Dabba", "Doo"))
    #expect(
      stringify(expected) == stringify(got),
      "flip((\"Yabba\", \"Dabba\", \"Doo\"): Expected \(expected), got \(got)")
  }

  @Test("rotate", .enabled(if: RUNALL))
  func testRotate() throws {
    let expected = ("Dooby", "Doo", "Scooby")
    let got = rotate(("Scooby", "Dooby", "Doo"))
    #expect(
      stringify(expected) == stringify(got),
      "rotate((\"Scooby\", \"Dooby\", \"Doo\"): Expected \(expected), got \(got)")
  }

  @Test("shuffle", .enabled(if: RUNALL))
  func testShuffle1() throws {
    let wires = ("Red", "Yellow", "Black")
    let shuffle = makeShuffle(flipper: flip, rotator: rotate)
    let expected = ("Yellow", "Black", "Red")
    let key: [UInt8] = [0, 1, 1, 1, 0, 0, 0, 1]
    let got = shuffle(key, wires)
    #expect(
      stringify(expected) == stringify(got),
      "shuffle(113, (\"Red\", \"Yellow\", \"Black\")): Expected \(expected), got \(got)")
  }

  @Test("shuffle with other wires", .enabled(if: RUNALL))
  func testShuffle2() throws {
    let wires = ("Purple", "Cyan", "Marigold")
    let shuffle = makeShuffle(flipper: flip, rotator: rotate)
    let expected = ("Marigold", "Cyan", "Purple")
    let key: [UInt8] = [1, 1, 1, 1, 1, 1, 0, 1]
    let got = shuffle(key, wires)
    #expect(
      stringify(expected) == stringify(got),
      "shuffle(253, (\"Purple\", \"Cyan\", \"Marigold\")): Expected \(expected), got \(got)")
  }

  @Test("shuffle with another set of wires", .enabled(if: RUNALL))
  func testShuffle3() throws {
    let wires = ("Brown", "Orange", "White")
    let shuffle = makeShuffle(flipper: flip, rotator: rotate)
    let expected = ("Brown", "Orange", "White")
    let key : [UInt8] = [0, 0, 0, 0, 0, 0, 0, 0]
    let got = shuffle(key, wires)
    #expect(
      stringify(expected) == stringify(got),
      "shuffle(0, (\"Brown\", \"Orange\", \"White\")): Expected \(expected), got \(got)")
  }
}
