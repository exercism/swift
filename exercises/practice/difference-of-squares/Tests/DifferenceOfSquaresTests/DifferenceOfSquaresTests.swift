import Foundation
import Testing

@testable import DifferenceOfSquares

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct DifferenceOfSquaresTests {

  @Test("square of sum 1")
  func testSquareOfSum1() {
    #expect(1 == Squares(1).squareOfSum)
  }

  @Test("square of sum 5", .enabled(if: RUNALL))
  func testSquareOfSum5() {
    #expect(225 == Squares(5).squareOfSum)
  }

  @Test("square of sum 100", .enabled(if: RUNALL))
  func testSquareOfSum100() {
    #expect(25_502_500 == Squares(100).squareOfSum)
  }

  @Test("sum of squares 1", .enabled(if: RUNALL))
  func testSumOfSquares1() {
    #expect(1 == Squares(1).sumOfSquares)
  }

  @Test("sum of squares 5", .enabled(if: RUNALL))
  func testSumOfSquares5() {
    #expect(55 == Squares(5).sumOfSquares)
  }

  @Test("sum of squares 100", .enabled(if: RUNALL))
  func testSumOfSquares100() {
    #expect(338350 == Squares(100).sumOfSquares)
  }

  @Test("difference of squares 1", .enabled(if: RUNALL))
  func testDifferenceOfSquares1() {
    #expect(0 == Squares(1).differenceOfSquares)
  }

  @Test("difference of squares 5", .enabled(if: RUNALL))
  func testDifferenceOfSquares5() {
    #expect(170 == Squares(5).differenceOfSquares)
  }

  @Test("difference of squares 100", .enabled(if: RUNALL))
  func testDifferenceOfSquares100() {
    #expect(25_164_150 == Squares(100).differenceOfSquares)
  }
}
