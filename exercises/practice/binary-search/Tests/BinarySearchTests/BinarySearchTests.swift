import Foundation
import Testing

@testable import BinarySearch

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct BinarySearchTests {

  @Test("finds a value in an array with one element")
  func testFindsAValueInAnArrayWithOneElement() {
    let binarySearch = BinarySearch([6])
    #expect(try! binarySearch.searchFor(6) == 0)
  }

  @Test("finds a value in the middle of an array", .enabled(if: RUNALL))
  func testFindsAValueInTheMiddleOfAnArray() {
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])
    #expect(try! binarySearch.searchFor(6) == 3)
  }

  @Test("finds a value at the beginning of an array", .enabled(if: RUNALL))
  func testFindsAValueAtTheBeginningOfAnArray() {
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])
    #expect(try! binarySearch.searchFor(1) == 0)
  }

  @Test("finds a value at the end of an array", .enabled(if: RUNALL))
  func testFindsAValueAtTheEndOfAnArray() {
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])
    #expect(try! binarySearch.searchFor(11) == 6)
  }

  @Test("finds a value in an array of odd length", .enabled(if: RUNALL))
  func testFindsAValueInAnArrayOfOddLength() {
    let binarySearch = BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634])
    #expect(try! binarySearch.searchFor(144) == 9)
  }

  @Test("finds a value in an array of even length", .enabled(if: RUNALL))
  func testFindsAValueInAnArrayOfEvenLength() {
    let binarySearch = BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377])
    #expect(try! binarySearch.searchFor(21) == 5)
  }

  @Test("identifies that a value is not included in the array", .enabled(if: RUNALL))
  func testIdentifiesThatAValueIsNotIncludedInTheArray() {
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])

    #expect(throws: BinarySearchError.valueNotFound) { try binarySearch.searchFor(7) }
  }

  @Test("a value smaller than the array's smallest value is not found", .enabled(if: RUNALL))
  func testAValueSmallerThanTheArraysSmallestValueIsNotFound() {
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])

    #expect(throws: BinarySearchError.valueNotFound) { try binarySearch.searchFor(0) }
  }

  @Test("a value larger than the array's largest value is not found", .enabled(if: RUNALL))
  func testAValueLargerThanTheArraysLargestValueIsNotFound() {
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])

    #expect(throws: BinarySearchError.valueNotFound) { try binarySearch.searchFor(13) }
  }

  @Test("nothing is found in an empty array", .enabled(if: RUNALL))
  func testNothingIsFoundInAnEmptyArray() {
    let binarySearch = BinarySearch([])

    #expect(throws: BinarySearchError.valueNotFound) { try binarySearch.searchFor(1) }
  }

  @Test("nothing is found when the left and right bounds cross", .enabled(if: RUNALL))
  func testNothingIsFoundWhenTheLeftAndRightBoundsCross() {
    let binarySearch = BinarySearch([1, 2])

    #expect(throws: BinarySearchError.valueNotFound) { try binarySearch.searchFor(0) }
  }
}
