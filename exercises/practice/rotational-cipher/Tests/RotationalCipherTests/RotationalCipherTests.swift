import Foundation
import Testing

@testable import RotationalCipher

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct RotationalCipherTests {

  @Test("rotate a by 0, same output as input")
  func testRotateABy0SameOutputAsInput() {
    #expect(rotateCipher("a", shift: 0) == "a")
  }

  @Test("rotate a by 1", .enabled(if: RUNALL))
  func testRotateABy1() {
    #expect(rotateCipher("a", shift: 1) == "b")
  }

  @Test("rotate a by 26, same output as input", .enabled(if: RUNALL))
  func testRotateABy26SameOutputAsInput() {
    #expect(rotateCipher("a", shift: 26) == "a")
  }

  @Test("rotate m by 13", .enabled(if: RUNALL))
  func testRotateMBy13() {
    #expect(rotateCipher("m", shift: 13) == "z")
  }

  @Test("rotate n by 13 with wrap around alphabet", .enabled(if: RUNALL))
  func testRotateNBy13WithWrapAroundAlphabet() {
    #expect(rotateCipher("n", shift: 13) == "a")
  }

  @Test("rotate capital letters", .enabled(if: RUNALL))
  func testRotateCapitalLetters() {
    #expect(rotateCipher("OMG", shift: 5) == "TRL")
  }

  @Test("rotate spaces", .enabled(if: RUNALL))
  func testRotateSpaces() {
    #expect(rotateCipher("O M G", shift: 5) == "T R L")
  }

  @Test("rotate numbers", .enabled(if: RUNALL))
  func testRotateNumbers() {
    #expect(rotateCipher("Testing 1 2 3 testing", shift: 4) == "Xiwxmrk 1 2 3 xiwxmrk")
  }

  @Test("rotate punctuation", .enabled(if: RUNALL))
  func testRotatePunctuation() {
    #expect(rotateCipher("Let's eat, Grandma!", shift: 21) == "Gzo'n zvo, Bmviyhv!")
  }

  @Test("rotate all letters", .enabled(if: RUNALL))
  func testRotateAllLetters() {
    #expect(
      rotateCipher("The quick brown fox jumps over the lazy dog.", shift: 13)
        == "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
  }
}
