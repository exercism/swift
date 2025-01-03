import Foundation
import Testing

@testable import Triangle

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct TriangleTests {

  @Test("all sides are equal")
  func testAllSidesAreEqual1() {
    #expect(Triangle([2, 2, 2]).isEquilateral)
  }

  @Test("any side is unequal", .enabled(if: RUNALL))
  func testAnySideIsUnequal1() {
    #expect(!Triangle([2, 3, 2]).isEquilateral)
  }

  @Test("no sides are equal", .enabled(if: RUNALL))
  func testNoSidesAreEqual1() {
    #expect(!Triangle([5, 4, 6]).isEquilateral)
  }

  @Test("all zero sides is not a triangle", .enabled(if: RUNALL))
  func testAllZeroSidesIsNotATriangle1() {
    #expect(!Triangle([0, 0, 0]).isEquilateral)
  }

  @Test("sides may be floats", .enabled(if: RUNALL))
  func testSidesMayBeFloats1() {
    #expect(Triangle([0.5, 0.5, 0.5]).isEquilateral)
  }

  @Test("last two sides are equal", .enabled(if: RUNALL))
  func testLastTwoSidesAreEqual2() {
    #expect(Triangle([3, 4, 4]).isIsosceles)
  }

  @Test("first two sides are equal", .enabled(if: RUNALL))
  func testFirstTwoSidesAreEqual2() {
    #expect(Triangle([4, 4, 3]).isIsosceles)
  }

  @Test("first and last sides are equal", .enabled(if: RUNALL))
  func testFirstAndLastSidesAreEqual2() {
    #expect(Triangle([4, 3, 4]).isIsosceles)
  }

  @Test("equilateral triangles are also isosceles", .enabled(if: RUNALL))
  func testEquilateralTrianglesAreAlsoIsosceles2() {
    #expect(Triangle([4, 4, 4]).isIsosceles)
  }

  @Test("no sides are equal", .enabled(if: RUNALL))
  func testNoSidesAreEqual2() {
    #expect(!Triangle([2, 3, 4]).isIsosceles)
  }

  @Test("first triangle inequality violation", .enabled(if: RUNALL))
  func testFirstTriangleInequalityViolation2() {
    #expect(!Triangle([1, 1, 3]).isIsosceles)
  }

  @Test("second triangle inequality violation", .enabled(if: RUNALL))
  func testSecondTriangleInequalityViolation2() {
    #expect(!Triangle([1, 3, 1]).isIsosceles)
  }

  @Test("third triangle inequality violation", .enabled(if: RUNALL))
  func testThirdTriangleInequalityViolation2() {
    #expect(!Triangle([3, 1, 1]).isIsosceles)
  }

  @Test("sides may be floats", .enabled(if: RUNALL))
  func testSidesMayBeFloats2() {
    #expect(Triangle([0.5, 0.4, 0.5]).isIsosceles)
  }

  @Test("no sides are equal", .enabled(if: RUNALL))
  func testNoSidesAreEqual3() {
    #expect(Triangle([5, 4, 6]).isScalene)
  }

  @Test("all sides are equal", .enabled(if: RUNALL))
  func testAllSidesAreEqual3() {
    #expect(!Triangle([4, 4, 4]).isScalene)
  }

  @Test("first and second sides are equal", .enabled(if: RUNALL))
  func testFirstAndSecondSidesAreEqual3() {
    #expect(!Triangle([4, 4, 3]).isScalene)
  }

  @Test("first and third sides are equal", .enabled(if: RUNALL))
  func testFirstAndThirdSidesAreEqual3() {
    #expect(!Triangle([3, 4, 3]).isScalene)
  }

  @Test("second and third sides are equal", .enabled(if: RUNALL))
  func testSecondAndThirdSidesAreEqual3() {
    #expect(!Triangle([4, 3, 3]).isScalene)
  }

  @Test("may not violate triangle inequality", .enabled(if: RUNALL))
  func testMayNotViolateTriangleInequality3() {
    #expect(!Triangle([7, 3, 2]).isScalene)
  }

  @Test("sides may be floats", .enabled(if: RUNALL))
  func testSidesMayBeFloats3() {
    #expect(Triangle([0.5, 0.4, 0.6]).isScalene)
  }
}
