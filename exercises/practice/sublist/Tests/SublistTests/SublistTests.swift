import Foundation
import Testing

@testable import Sublist

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SublistTests {

  @Test("empty lists")
  func testEmptyLists() {
    #expect(.equal == classifier(listOne: [], listTwo: []))
  }

  @Test("empty list within non empty list", .enabled(if: RUNALL))
  func testEmptyListWithinNonEmptyList() {
    #expect(.sublist == classifier(listOne: [], listTwo: [1, 2, 3]))
  }

  @Test("non empty list contains empty list", .enabled(if: RUNALL))
  func testNonEmptyListContainsEmptyList() {
    #expect(.superlist == classifier(listOne: [1, 2, 3], listTwo: []))
  }

  @Test("list equals itself", .enabled(if: RUNALL))
  func testListEqualsItself() {
    #expect(.equal == classifier(listOne: [1, 2, 3], listTwo: [1, 2, 3]))
  }

  @Test("different lists", .enabled(if: RUNALL))
  func testDifferentLists() {
    #expect(.unequal == classifier(listOne: [1, 2, 3], listTwo: [2, 3, 4]))
  }

  @Test("false start", .enabled(if: RUNALL))
  func testFalseStart() {
    #expect(.sublist == classifier(listOne: [1, 2, 5], listTwo: [0, 1, 2, 3, 1, 2, 5, 6]))
  }

  @Test("consecutive", .enabled(if: RUNALL))
  func testConsecutive() {
    #expect(.sublist == classifier(listOne: [1, 1, 2], listTwo: [0, 1, 1, 1, 2, 1, 2]))
  }

  @Test("sublist at start", .enabled(if: RUNALL))
  func testSublistAtStart() {
    #expect(.sublist == classifier(listOne: [0, 1, 2], listTwo: [0, 1, 2, 3, 4, 5]))
  }

  @Test("sublist in middle", .enabled(if: RUNALL))
  func testSublistInMiddle() {
    #expect(.sublist == classifier(listOne: [2, 3, 4], listTwo: [0, 1, 2, 3, 4, 5]))
  }

  @Test("sublist at end", .enabled(if: RUNALL))
  func testSublistAtEnd() {
    #expect(.sublist == classifier(listOne: [3, 4, 5], listTwo: [0, 1, 2, 3, 4, 5]))
  }

  @Test("at start of superlist", .enabled(if: RUNALL))
  func testAtStartOfSuperlist() {
    #expect(.superlist == classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [0, 1, 2]))
  }

  @Test("in middle of superlist", .enabled(if: RUNALL))
  func testInMiddleOfSuperlist() {
    #expect(.superlist == classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [2, 3]))
  }

  @Test("at end of superlist", .enabled(if: RUNALL))
  func testAtEndOfSuperlist() {
    #expect(.superlist == classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [3, 4, 5]))
  }

  @Test("first list missing element from second list", .enabled(if: RUNALL))
  func testFirstListMissingElementFromSecondList() {
    #expect(.unequal == classifier(listOne: [1, 3], listTwo: [1, 2, 3]))
  }

  @Test("second list missing element from first list", .enabled(if: RUNALL))
  func testSecondListMissingElementFromFirstList() {
    #expect(.unequal == classifier(listOne: [1, 2, 3], listTwo: [1, 3]))
  }

  @Test("first list missing additional digits from second list", .enabled(if: RUNALL))
  func testFirstListMissingAdditionalDigitsFromSecondList() {
    #expect(.unequal == classifier(listOne: [1, 2], listTwo: [1, 22]))
  }

  @Test("order matters to a list", .enabled(if: RUNALL))
  func testOrderMattersToAList() {
    #expect(.unequal == classifier(listOne: [1, 2, 3], listTwo: [3, 2, 1]))
  }

  @Test("same digits but different numbers", .enabled(if: RUNALL))
  func testSameDigitsButDifferentNumbers() {
    #expect(.unequal == classifier(listOne: [1, 0, 1], listTwo: [10, 1]))
  }
}
