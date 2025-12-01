import Foundation
import Testing

@testable import SquareRoot

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SquareRootTests {

  @Test("root of 1")
  func testRootOf1() {
    #expect(throws: Never.self) {
      let actual = try SquareRoot.squareRoot(1)
      #expect(actual == 1)
    }
  }

  @Test("root of 4", .enabled(if: RUNALL))
  func testRootOf4() {
    #expect(throws: Never.self) {
      let actual = try SquareRoot.squareRoot(4)
      #expect(actual == 2)
    }
  }

  @Test("root of 25", .enabled(if: RUNALL))
  func testRootOf25() {
    #expect(throws: Never.self) {
      let actual = try SquareRoot.squareRoot(25)
      #expect(actual == 5)
    }
  }

  @Test("root of 81", .enabled(if: RUNALL))
  func testRootOf81() {
    #expect(throws: Never.self) {
      let actual = try SquareRoot.squareRoot(81)
      #expect(actual == 9)
    }
  }

  @Test("root of 196", .enabled(if: RUNALL))
  func testRootOf196() {
    #expect(throws: Never.self) {
      let actual = try SquareRoot.squareRoot(196)
      #expect(actual == 14)
    }
  }

  @Test("root of 65025", .enabled(if: RUNALL))
  func testRootOf65025() {
    #expect(throws: Never.self) {
      let actual = try SquareRoot.squareRoot(65025)
      #expect(actual == 255)
    }
  }
}
