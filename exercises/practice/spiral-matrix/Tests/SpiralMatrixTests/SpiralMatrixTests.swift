import Foundation
import Testing

@testable import SpiralMatrix

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SpiralMatrixTests {

  @Test("empty spiral")
  func testEmptySpiral() {
    #expect(spiralMatrix(size: 0) == [])
  }

  @Test("trivial spiral", .enabled(if: RUNALL))
  func testTrivialSpiral() {
    #expect(spiralMatrix(size: 1) == [[1]])
  }

  @Test("spiral of size 2", .enabled(if: RUNALL))
  func testSpiralOfSize2() {
    #expect(spiralMatrix(size: 2) == [[1, 2], [4, 3]])
  }

  @Test("spiral of size 3", .enabled(if: RUNALL))
  func testSpiralOfSize3() {
    #expect(spiralMatrix(size: 3) == [[1, 2, 3], [8, 9, 4], [7, 6, 5]])
  }

  @Test("spiral of size 4", .enabled(if: RUNALL))
  func testSpiralOfSize4() {
    #expect(
      spiralMatrix(size: 4) == [[1, 2, 3, 4], [12, 13, 14, 5], [11, 16, 15, 6], [10, 9, 8, 7]])
  }

  @Test("spiral of size 5", .enabled(if: RUNALL))
  func testSpiralOfSize5() {
    #expect(
      spiralMatrix(size: 5) == [
        [1, 2, 3, 4, 5], [16, 17, 18, 19, 6], [15, 24, 25, 20, 7], [14, 23, 22, 21, 8],
        [13, 12, 11, 10, 9],
      ])
  }
}
