import Foundation
import Testing

@testable import PythagoreanTriplet

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PythagoreanTripletTests {

  @Test("triplets whose sum is 12")
  func testTripletsWhoseSumIs12() {
    #expect(tripletsWithSum(12) == [[3, 4, 5]])
  }

  @Test("triplets whose sum is 108", .enabled(if: RUNALL))
  func testTripletsWhoseSumIs108() {
    #expect(tripletsWithSum(108) == [[27, 36, 45]])
  }

  @Test("triplets whose sum is 1000", .enabled(if: RUNALL))
  func testTripletsWhoseSumIs1000() {
    #expect(tripletsWithSum(1000) == [[200, 375, 425]])
  }

  @Test("no matching triplets for 1001", .enabled(if: RUNALL))
  func testNoMatchingTripletsFor1001() {
    #expect(tripletsWithSum(1001) == [])
  }

  @Test("returns all matching triplets", .enabled(if: RUNALL))
  func testReturnsAllMatchingTriplets() {
    #expect(tripletsWithSum(90) == [[9, 40, 41], [15, 36, 39]])
  }

  @Test("several matching triplets", .enabled(if: RUNALL))
  func testSeveralMatchingTriplets() {
    #expect(
      tripletsWithSum(840) == [
        [40, 399, 401], [56, 390, 394], [105, 360, 375], [120, 350, 370], [140, 336, 364],
        [168, 315, 357], [210, 280, 350], [240, 252, 348],
      ])
  }

  @Test("triplets for large number", .enabled(if: RUNALL))
  func testTripletsForLargeNumber() {
    #expect(
      tripletsWithSum(30000) == [
        [1200, 14375, 14425], [1875, 14000, 14125], [5000, 12000, 13000], [6000, 11250, 12750],
        [7500, 10000, 12500],
      ])
  }
}
