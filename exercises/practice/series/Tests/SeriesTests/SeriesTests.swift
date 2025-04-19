import Foundation
import Testing

@testable import Series

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SeriesTests {

  @Test("slices of one from one")
  func testSlicesOfOneFromOne() {
    let series = Series("1")
    #expect(try! series.slice(1) == ["1"])
  }

  @Test("slices of one from two", .enabled(if: RUNALL))
  func testSlicesOfOneFromTwo() {
    let series = Series("12")
    #expect(try! series.slice(1) == ["1", "2"])
  }

  @Test("slices of two", .enabled(if: RUNALL))
  func testSlicesOfTwo() {
    let series = Series("35")
    #expect(try! series.slice(2) == ["35"])
  }

  @Test("slices of two overlap", .enabled(if: RUNALL))
  func testSlicesOfTwoOverlap() {
    let series = Series("9142")
    #expect(try! series.slice(2) == ["91", "14", "42"])
  }

  @Test("slices can include duplicates", .enabled(if: RUNALL))
  func testSlicesCanIncludeDuplicates() {
    let series = Series("777777")
    #expect(try! series.slice(3) == ["777", "777", "777", "777"])
  }

  @Test("slices of a long series", .enabled(if: RUNALL))
  func testSlicesOfALongSeries() {
    let series = Series("918493904243")
    #expect(
      try! series.slice(5) == [
        "91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243",
      ])
  }

  @Test("slice length is too large", .enabled(if: RUNALL))
  func testSliceLengthIsTooLarge() {
    let series = Series("12345")
    #expect(
      throws:
        SeriesError.sliceLengthLongerThanSeries
    ) { try series.slice(6) }
  }

  @Test("slice length is way too large", .enabled(if: RUNALL))
  func testSliceLengthIsWayTooLarge() {
    let series = Series("12345")
    #expect(
      throws:
        SeriesError.sliceLengthLongerThanSeries
    ) { try series.slice(42) }
  }

  @Test("slice length cannot be zero", .enabled(if: RUNALL))
  func testSliceLengthCannotBeZero() {
    let series = Series("12345")
    #expect(
      throws:
        SeriesError.sliceLengthZeroOrLess
    ) { try series.slice(0) }
  }

  @Test("slice length cannot be negative", .enabled(if: RUNALL))
  func testSliceLengthCannotBeNegative() {
    let series = Series("123")
    #expect(
      throws:
        SeriesError.sliceLengthZeroOrLess
    ) { try series.slice(-1) }
  }

  @Test("empty series is invalid", .enabled(if: RUNALL))
  func testEmptySeriesIsInvalid() {
    let series = Series("")
    #expect(
      throws:
        SeriesError.emptySeries
    ) { try series.slice(1) }
  }
}
