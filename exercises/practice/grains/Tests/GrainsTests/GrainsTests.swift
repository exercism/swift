import Foundation
import Testing

@testable import Grains

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct GrainsTests {

  @Test("grains on square 1")
  func testGrainsOnSquare1() {
    #expect(try! Grains.square(1) == 1)
  }

  @Test("grains on square 2", .enabled(if: RUNALL))
  func testGrainsOnSquare2() {
    #expect(try! Grains.square(2) == 2)
  }

  @Test("grains on square 3", .enabled(if: RUNALL))
  func testGrainsOnSquare3() {
    #expect(try! Grains.square(3) == 4)
  }

  @Test("grains on square 4", .enabled(if: RUNALL))
  func testGrainsOnSquare4() {
    #expect(try! Grains.square(4) == 8)
  }

  @Test("grains on square 16", .enabled(if: RUNALL))
  func testGrainsOnSquare16() {
    #expect(try! Grains.square(16) == 32768)
  }

  @Test("grains on square 32", .enabled(if: RUNALL))
  func testGrainsOnSquare32() {
    #expect(try! Grains.square(32) == 2_147_483_648)
  }

  @Test("grains on square 64", .enabled(if: RUNALL))
  func testGrainsOnSquare64() {
    #expect(try! Grains.square(64) == 9_223_372_036_854_775_808)
  }

  @Test("square 0 is invalid", .enabled(if: RUNALL))
  func testSquare0IsInvalid() {
    #expect(
      throws:
        GrainsError.inputTooLow
    ) { try Grains.square(0) }
  }

  @Test("negative square is invalid", .enabled(if: RUNALL))
  func testNegativeSquareIsInvalid() {
    #expect(
      throws:
        GrainsError.inputTooLow
    ) { try Grains.square(-1) }
  }

  @Test("square greater than 64 is invalid", .enabled(if: RUNALL))
  func testSquareGreaterThan64IsInvalid() {
    #expect(
      throws:
        GrainsError.inputTooHigh
    ) { try Grains.square(65) }
  }

  @Test("", .enabled(if: RUNALL))
  func test2() {
    #expect(Grains.total == 18_446_744_073_709_551_615)
  }
}
