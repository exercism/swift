import Foundation
import Testing

@testable import CollatzConjecture

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct CollatzConjectureTests {

  @Test("zero steps for one")
  func testZeroStepsForOne() { #expect(try! CollatzConjecture.steps(1) == 0) }

  @Test("divide if even", .enabled(if: RUNALL))
  func testDivideIfEven() { #expect(try! CollatzConjecture.steps(16) == 4) }

  @Test("even and odd steps", .enabled(if: RUNALL))
  func testEvenAndOddSteps() { #expect(try! CollatzConjecture.steps(12) == 9) }

  @Test("large number of even and odd steps", .enabled(if: RUNALL))
  func testLargeNumberOfEvenAndOddSteps() {
    #expect(try! CollatzConjecture.steps(1_000_000) == 152)
  }

  @Test("zero is an error", .enabled(if: RUNALL))
  func testZeroIsAnError() {
    #expect(throws: (any Error).self) { try CollatzConjecture.steps(0) }
  }

  @Test("negative value is an error", .enabled(if: RUNALL))
  func testNegativeValueIsAnError() {
    #expect(throws: (any Error).self) { try CollatzConjecture.steps(-15) }
  }
}
