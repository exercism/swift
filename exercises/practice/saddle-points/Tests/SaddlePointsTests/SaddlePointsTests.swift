import Foundation
import Testing

@testable import SaddlePoints

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SaddlePointsTests {

  @Test("Can identify single saddle point")
  func testCanIdentifySingleSaddlePoint() {
    let input = [[9, 8, 7], [5, 3, 2], [6, 6, 7]]
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [
      Position(row: 2, column: 1)
    ].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }

  @Test("Can identify that empty matrix has no saddle points", .enabled(if: RUNALL))
  func testCanIdentifyThatEmptyMatrixHasNoSaddlePoints() {
    let input = [[Int]]()
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }

  @Test("Can identify lack of saddle points when there are none", .enabled(if: RUNALL))
  func testCanIdentifyLackOfSaddlePointsWhenThereAreNone() {
    let input = [[1, 2, 3], [3, 1, 2], [2, 3, 1]]
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }

  @Test("Can identify multiple saddle points in a column", .enabled(if: RUNALL))
  func testCanIdentifyMultipleSaddlePointsInAColumn() {
    let input = [[4, 5, 4], [3, 5, 5], [1, 5, 4]]
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [
      Position(row: 1, column: 2), Position(row: 2, column: 2), Position(row: 3, column: 2),
    ].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }

  @Test("Can identify multiple saddle points in a row", .enabled(if: RUNALL))
  func testCanIdentifyMultipleSaddlePointsInARow() {
    let input = [[6, 7, 8], [5, 5, 5], [7, 5, 6]]
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [
      Position(row: 2, column: 1), Position(row: 2, column: 2), Position(row: 2, column: 3),
    ].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }

  @Test("Can identify saddle point in bottom right corner", .enabled(if: RUNALL))
  func testCanIdentifySaddlePointInBottomRightCorner() {
    let input = [[8, 7, 9], [6, 7, 6], [3, 2, 5]]
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [
      Position(row: 3, column: 3)
    ].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }

  @Test("Can identify saddle points in a non square matrix", .enabled(if: RUNALL))
  func testCanIdentifySaddlePointsInANonSquareMatrix() {
    let input = [[3, 1, 3], [3, 2, 4]]
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [
      Position(row: 1, column: 3), Position(row: 1, column: 1),
    ].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }

  @Test(
    "Can identify that saddle points in a single column matrix are those with the minimum value",
    .enabled(if: RUNALL))
  func testCanIdentifyThatSaddlePointsInASingleColumnMatrixAreThoseWithTheMinimumValue() {
    let input = [[2], [1], [4], [1]]
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [
      Position(row: 2, column: 1), Position(row: 4, column: 1),
    ].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }

  @Test(
    "Can identify that saddle points in a single row matrix are those with the maximum value",
    .enabled(if: RUNALL))
  func testCanIdentifyThatSaddlePointsInASingleRowMatrixAreThoseWithTheMaximumValue() {
    let input = [[2, 5, 3, 5]]
    let saddlePoints = SaddlePoints.saddlePoints(input).sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    let expected: [Position] = [
      Position(row: 1, column: 2), Position(row: 1, column: 4),
    ].sorted {
      $0.row < $1.row || $0.row == $1.row && $0.column > $1.column
    }
    #expect(saddlePoints == expected)
  }
}
