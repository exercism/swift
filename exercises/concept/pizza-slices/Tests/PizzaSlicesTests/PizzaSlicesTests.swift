import Testing
import Foundation
import RealModule

@testable import PizzaSlices

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PizzaSlicesTests {
  @Test("A normal slice") 
  func testSliceNormal() {
    let size = sliceSize(diameter: 16, slices: 10)
    #expect(size!.isApproximatelyEqual(to: Double.pi * 6.4, relativeTolerance: 0.01))
  }

  @Test("A slice with nil diameter", .enabled(if: RUNALL))
  func testSliceNilDiameter() {
    let size = sliceSize(diameter: nil, slices: 10)
    #expect(size == nil)
  }

  @Test("A slice with nil slices", .enabled(if: RUNALL))
  func testSliceNilSlices() {
    let size = sliceSize(diameter: 16, slices: nil)
    #expect(size == nil)
  }

  @Test("A slice with invalid diameter", .enabled(if: RUNALL))
  func testSliceBadDiameter() {
    let size = sliceSize(diameter: -16, slices: 10)
    #expect(size == nil)
  }

  @Test("A slice with invalid slices", .enabled(if: RUNALL))
  func testSliceBadSlices() {
    let size = sliceSize(diameter: 16, slices: 0)
    #expect(size == nil)
  }

  @Test("When slice A is bigger", .enabled(if: RUNALL))
  func testABiggest() {
    let biggest = biggestSlice(diameterA: "16", slicesA: "8", diameterB: "12", slicesB: "6")
    #expect(biggest == "Slice A is bigger")
  }


  @Test("When slice B is bigger", .enabled(if: RUNALL))
  func testBBiggest() {
    let biggest = biggestSlice(diameterA: "16", slicesA: "10", diameterB: "18", slicesB: "12")
    #expect(biggest == "Slice B is bigger")
  }

  @Test("When both slices are the same", .enabled(if: RUNALL))
  func testBothSame() {
    let biggest = biggestSlice(diameterA: "16", slicesA: "10", diameterB: "16", slicesB: "10")
    #expect(biggest == "Neither slice is bigger")
  }

  @Test("When A is nil", .enabled(if: RUNALL))
  func testANil() {
    let biggest = biggestSlice(diameterA: "-16", slicesA: "8", diameterB: "12", slicesB: "6")
    #expect(biggest == "Slice B is bigger")
  }

  @Test("When B is nil", .enabled(if: RUNALL))
  func testBNil() {
    let biggest = biggestSlice(diameterA: "16", slicesA: "8", diameterB: "-18", slicesB: "12")
    #expect(biggest == "Slice A is bigger")
  }

  @Test("When both are nil", .enabled(if: RUNALL))
  func testBothNil() {
    let biggest = biggestSlice(diameterA: "16", slicesA: "-8", diameterB: "16 inches", slicesB: "8")
    #expect(biggest == "Neither slice is bigger")
  }

  @Test("That zero is valid", .enabled(if: RUNALL))
  func testZeroIsValid() {
    let biggest = biggestSlice(diameterA: "0", slicesA: "8", diameterB: "16 inches", slicesB: "8")
    #expect(biggest == "Slice A is bigger")
  }
}
