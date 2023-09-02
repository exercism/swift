import XCTest

@testable import Sublist

class SublistTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testEmptyLists() {
    XCTAssertEqual(.equal, classifier(listOne: [], listTwo: []))
  }

  func testEmptyListWithinNonEmptyList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.sublist, classifier(listOne: [], listTwo: [1, 2, 3]))
  }

  func testNonEmptyListContainsEmptyList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.superlist, classifier(listOne: [1, 2, 3], listTwo: []))
  }

  func testListEqualsItself() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.equal, classifier(listOne: [1, 2, 3], listTwo: [1, 2, 3]))
  }

  func testDifferentLists() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.unequal, classifier(listOne: [1, 2, 3], listTwo: [2, 3, 4]))
  }

  func testFalseStart() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.sublist, classifier(listOne: [1, 2, 5], listTwo: [0, 1, 2, 3, 1, 2, 5, 6]))
  }

  func testConsecutive() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.sublist, classifier(listOne: [1, 1, 2], listTwo: [0, 1, 1, 1, 2, 1, 2]))
  }

  func testSublistAtStart() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.sublist, classifier(listOne: [0, 1, 2], listTwo: [0, 1, 2, 3, 4, 5]))
  }

  func testSublistInMiddle() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.sublist, classifier(listOne: [2, 3, 4], listTwo: [0, 1, 2, 3, 4, 5]))
  }

  func testSublistAtEnd() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.sublist, classifier(listOne: [3, 4, 5], listTwo: [0, 1, 2, 3, 4, 5]))
  }

  func testAtStartOfSuperlist() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [0, 1, 2]))
  }

  func testInMiddleOfSuperlist() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [2, 3]))
  }

  func testAtEndOfSuperlist() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [3, 4, 5]))
  }

  func testFirstListMissingElementFromSecondList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.unequal, classifier(listOne: [1, 3], listTwo: [1, 2, 3]))
  }

  func testSecondListMissingElementFromFirstList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.unequal, classifier(listOne: [1, 2, 3], listTwo: [1, 3]))
  }

  func testFirstListMissingAdditionalDigitsFromSecondList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.unequal, classifier(listOne: [1, 2], listTwo: [1, 22]))
  }

  func testOrderMattersToAList() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.unequal, classifier(listOne: [1, 2, 3], listTwo: [3, 2, 1]))
  }

  func testSameDigitsButDifferentNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(.unequal, classifier(listOne: [1, 0, 1], listTwo: [10, 1]))
  }
}
