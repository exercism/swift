import XCTest

@testable import BinarySearch

class BinarySearchTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testFindsAValueInAnArrayWithOneElement() {
    let binarySearch = BinarySearch([6])
    XCTAssertEqual(try! binarySearch.searchFor(6), 0)
  }

  func testFindsAValueInTheMiddleOfAnArray() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])
    XCTAssertEqual(try! binarySearch.searchFor(6), 3)
  }

  func testFindsAValueAtTheBeginningOfAnArray() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])
    XCTAssertEqual(try! binarySearch.searchFor(1), 0)
  }

  func testFindsAValueAtTheEndOfAnArray() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])
    XCTAssertEqual(try! binarySearch.searchFor(11), 6)
  }

  func testFindsAValueInAnArrayOfOddLength() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634])
    XCTAssertEqual(try! binarySearch.searchFor(144), 9)
  }

  func testFindsAValueInAnArrayOfEvenLength() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377])
    XCTAssertEqual(try! binarySearch.searchFor(21), 5)
  }

  func testIdentifiesThatAValueIsNotIncludedInTheArray() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])

    XCTAssertThrowsError(try binarySearch.searchFor(7)) { error in
      XCTAssertEqual(error as? BinarySearchError, BinarySearchError.valueNotFound)
    }
  }

  func testAValueSmallerThanTheArraysSmallestValueIsNotFound() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])

    XCTAssertThrowsError(try binarySearch.searchFor(0)) { error in
      XCTAssertEqual(error as? BinarySearchError, BinarySearchError.valueNotFound)
    }
  }

  func testAValueLargerThanTheArraysLargestValueIsNotFound() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 3, 4, 6, 8, 9, 11])

    XCTAssertThrowsError(try binarySearch.searchFor(13)) { error in
      XCTAssertEqual(error as? BinarySearchError, BinarySearchError.valueNotFound)
    }
  }

  func testNothingIsFoundInAnEmptyArray() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([])

    XCTAssertThrowsError(try binarySearch.searchFor(1)) { error in
      XCTAssertEqual(error as? BinarySearchError, BinarySearchError.valueNotFound)
    }
  }

  func testNothingIsFoundWhenTheLeftAndRightBoundsCross() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let binarySearch = BinarySearch([1, 2])

    XCTAssertThrowsError(try binarySearch.searchFor(0)) { error in
      XCTAssertEqual(error as? BinarySearchError, BinarySearchError.valueNotFound)
    }
  }
}
