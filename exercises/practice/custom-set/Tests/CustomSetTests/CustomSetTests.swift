import XCTest

@testable import CustomSet

class CustomSetTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false
  let emptyArray = [Int]()

  func testSetsWithNoElementsAreEmpty() {
    let customSet = CustomSet(emptyArray)
    XCTAssertTrue(customSet.isEmpty)
  }

  func testSetsWithElementsAreNotEmpty() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let customSet = CustomSet([1])
    XCTAssertFalse(customSet.isEmpty)
  }

  func testNothingIsContainedInAnEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let customSet = CustomSet(emptyArray)
    XCTAssertFalse(customSet.contains(1))
  }

  func testWhenTheElementIsInTheSet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let customSet = CustomSet([1, 2, 3])
    XCTAssertTrue(customSet.contains(1))
  }

  func testWhenTheElementIsNotInTheSet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let customSet = CustomSet([1, 2, 3])
    XCTAssertFalse(customSet.contains(4))
  }

  func testEmptySetIsASubsetOfAnotherEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertTrue(set1.isSubset(of: set2))
  }

  func testEmptySetIsASubsetOfNonEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([1])
    XCTAssertTrue(set1.isSubset(of: set2))
  }

  func testNonEmptySetIsNotASubsetOfEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1])
    let set2 = CustomSet(emptyArray)
    XCTAssertFalse(set1.isSubset(of: set2))
  }

  func testSetIsASubsetOfSetWithExactSameElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 3])
    XCTAssertTrue(set1.isSubset(of: set2))
  }

  func testSetIsASubsetOfLargerSetWithSameElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 1, 2, 3])
    XCTAssertTrue(set1.isSubset(of: set2))
  }

  func testSetIsNotASubsetOfSetThatDoesNotContainItsElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 1, 3])
    XCTAssertFalse(set1.isSubset(of: set2))
  }

  func testTheEmptySetIsDisjointWithItself() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertTrue(set1.isDisjoint(with: set2))
  }

  func testEmptySetIsDisjointWithNonEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([1])
    XCTAssertTrue(set1.isDisjoint(with: set2))
  }

  func testNonEmptySetIsDisjointWithEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1])
    let set2 = CustomSet(emptyArray)
    XCTAssertTrue(set1.isDisjoint(with: set2))
  }

  func testSetsAreNotDisjointIfTheyShareAnElement() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([2, 3])
    XCTAssertFalse(set1.isDisjoint(with: set2))
  }

  func testSetsAreDisjointIfTheyShareNoElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([3, 4])
    XCTAssertTrue(set1.isDisjoint(with: set2))
  }

  func testEmptySetsAreEqual() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1, set2)
  }

  func testEmptySetIsNotEqualToNonEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([1, 2, 3])
    XCTAssertNotEqual(set1, set2)
  }

  func testNonEmptySetIsNotEqualToEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet(emptyArray)
    XCTAssertNotEqual(set1, set2)
  }

  func testSetsWithTheSameElementsAreEqual() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([2, 1])
    XCTAssertEqual(set1, set2)
  }

  func testSetsWithDifferentElementsAreNotEqual() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 4])
    XCTAssertNotEqual(set1, set2)
  }

  func testSetIsNotEqualToLargerSetWithSameElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 3, 4])
    XCTAssertNotEqual(set1, set2)
  }

  func testAddToEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet(emptyArray)
    customSet.add(3)
    XCTAssertEqual(customSet, CustomSet([3]))
  }

  func testAddToNonEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet([1, 2, 4])
    customSet.add(3)
    XCTAssertEqual(customSet, CustomSet([1, 2, 3, 4]))
  }

  func testAddingAnExistingElementDoesNotChangeTheSet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet([1, 2, 3])
    customSet.add(3)
    XCTAssertEqual(customSet, CustomSet([1, 2, 3]))
  }

  func testIntersectionOfTwoEmptySetsIsAnEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.intersection(set2), CustomSet([]))
  }

  func testIntersectionOfAnEmptySetAndNonEmptySetIsAnEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([3, 2, 5])
    XCTAssertEqual(set1.intersection(set2), CustomSet([]))
  }

  func testIntersectionOfANonEmptySetAndAnEmptySetIsAnEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.intersection(set2), CustomSet([]))
  }

  func testIntersectionOfTwoSetsWithNoSharedElementsIsAnEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 5, 6])
    XCTAssertEqual(set1.intersection(set2), CustomSet([]))
  }

  func testIntersectionOfTwoSetsWithSharedElementsIsASetOfTheSharedElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet([3, 2, 5])
    XCTAssertEqual(set1.intersection(set2), CustomSet([2, 3]))
  }

  func testDifferenceOfTwoEmptySetsIsAnEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.difference(set2), CustomSet([]))
  }

  func testDifferenceOfEmptySetAndNonEmptySetIsAnEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([3, 2, 5])
    XCTAssertEqual(set1.difference(set2), CustomSet([]))
  }

  func testDifferenceOfANonEmptySetAndAnEmptySetIsTheNonEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.difference(set2), CustomSet([1, 2, 3, 4]))
  }

  func testDifferenceOfTwoNonEmptySetsIsASetOfElementsThatAreOnlyInTheFirstSet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([3, 2, 1])
    let set2 = CustomSet([2, 4])
    XCTAssertEqual(set1.difference(set2), CustomSet([1, 3]))
  }

  func testUnionOfEmptySetsIsAnEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.union(set2), CustomSet([]))
  }

  func testUnionOfAnEmptySetAndNonEmptySetIsTheNonEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([2])
    XCTAssertEqual(set1.union(set2), CustomSet([2]))
  }

  func testUnionOfANonEmptySetAndEmptySetIsTheNonEmptySet() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 3])
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.union(set2), CustomSet([1, 3]))
  }

  func testUnionOfNonEmptySetsContainsAllUniqueElements() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 3])
    let set2 = CustomSet([2, 3])
    XCTAssertEqual(set1.union(set2), CustomSet([3, 2, 1]))
  }
}
