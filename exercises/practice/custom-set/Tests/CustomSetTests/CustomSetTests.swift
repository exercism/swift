import XCTest

@testable import CustomSet

class CustomSetTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false
  let emptyArray = [Int]()

  func testSetsWithNoElementsAreEmpty1() {
    var customSet = CustomSet(emptyArray)
    XCTAssertTrue(customSet.isEmpty)
  }

  func testSetsWithElementsAreNotEmpty1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet([1])
    XCTAssertFalse(customSet.isEmpty)
  }

  func testNothingIsContainedInAnEmptySet2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet(emptyArray)
    XCTAssertFalse(customSet.contains(1))
  }

  func testWhenTheElementIsInTheSet2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet([1, 2, 3])
    XCTAssertTrue(customSet.contains(1))
  }

  func testWhenTheElementIsNotInTheSet2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet([1, 2, 3])
    XCTAssertFalse(customSet.contains(4))
  }

  func testEmptySetIsASubsetOfAnotherEmptySet3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertTrue(set1.isSubset(of: set2))
  }

  func testEmptySetIsASubsetOfNonEmptySet3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([1])
    XCTAssertTrue(set1.isSubset(of: set2))
  }

  func testNonEmptySetIsNotASubsetOfEmptySet3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1])
    let set2 = CustomSet(emptyArray)
    XCTAssertFalse(set1.isSubset(of: set2))
  }

  func testSetIsASubsetOfSetWithExactSameElements3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 3])
    XCTAssertTrue(set1.isSubset(of: set2))
  }

  func testSetIsASubsetOfLargerSetWithSameElements3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 1, 2, 3])
    XCTAssertTrue(set1.isSubset(of: set2))
  }

  func testSetIsNotASubsetOfSetThatDoesNotContainItsElements3() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 1, 3])
    XCTAssertFalse(set1.isSubset(of: set2))
  }

  func testTheEmptySetIsDisjointWithItself4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertTrue(set1.isDisjoint(with: set2))
  }

  func testEmptySetIsDisjointWithNonEmptySet4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([1])
    XCTAssertTrue(set1.isDisjoint(with: set2))
  }

  func testNonEmptySetIsDisjointWithEmptySet4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1])
    let set2 = CustomSet(emptyArray)
    XCTAssertTrue(set1.isDisjoint(with: set2))
  }

  func testSetsAreNotDisjointIfTheyShareAnElement4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([2, 3])
    XCTAssertFalse(set1.isDisjoint(with: set2))
  }

  func testSetsAreDisjointIfTheyShareNoElements4() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([3, 4])
    XCTAssertTrue(set1.isDisjoint(with: set2))
  }

  func testEmptySetsAreEqual5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1, set2)
  }

  func testEmptySetIsNotEqualToNonEmptySet5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([1, 2, 3])
    XCTAssertNotEqual(set1, set2)
  }

  func testNonEmptySetIsNotEqualToEmptySet5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet(emptyArray)
    XCTAssertNotEqual(set1, set2)
  }

  func testSetsWithTheSameElementsAreEqual5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([2, 1])
    XCTAssertEqual(set1, set2)
  }

  func testSetsWithDifferentElementsAreNotEqual5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 4])
    XCTAssertNotEqual(set1, set2)
  }

  func testSetIsNotEqualToLargerSetWithSameElements5() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 3, 4])
    XCTAssertNotEqual(set1, set2)
  }

  func testAddToEmptySet6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet(emptyArray)
    customSet.add(3)
    XCTAssertEqual(customSet, CustomSet([3]))
  }

  func testAddToNonEmptySet6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet([1, 2, 4])
    customSet.add(3)
    XCTAssertEqual(customSet, CustomSet([1, 2, 3, 4]))
  }

  func testAddingAnExistingElementDoesNotChangeTheSet6() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    var customSet = CustomSet([1, 2, 3])
    customSet.add(3)
    XCTAssertEqual(customSet, CustomSet([1, 2, 3]))
  }

  func testIntersectionOfTwoEmptySetsIsAnEmptySet7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.intersection(set2), CustomSet([]))
  }

  func testIntersectionOfAnEmptySetAndNonEmptySetIsAnEmptySet7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([3, 2, 5])
    XCTAssertEqual(set1.intersection(set2), CustomSet([]))
  }

  func testIntersectionOfANonEmptySetAndAnEmptySetIsAnEmptySet7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.intersection(set2), CustomSet([]))
  }

  func testIntersectionOfTwoSetsWithNoSharedElementsIsAnEmptySet7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 5, 6])
    XCTAssertEqual(set1.intersection(set2), CustomSet([]))
  }

  func testIntersectionOfTwoSetsWithSharedElementsIsASetOfTheSharedElements7() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet([3, 2, 5])
    XCTAssertEqual(set1.intersection(set2), CustomSet([2, 3]))
  }

  func testDifferenceOfTwoEmptySetsIsAnEmptySet8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.difference(set2), CustomSet([]))
  }

  func testDifferenceOfEmptySetAndNonEmptySetIsAnEmptySet8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([3, 2, 5])
    XCTAssertEqual(set1.difference(set2), CustomSet([]))
  }

  func testDifferenceOfANonEmptySetAndAnEmptySetIsTheNonEmptySet8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.difference(set2), CustomSet([1, 2, 3, 4]))
  }

  func testDifferenceOfTwoNonEmptySetsIsASetOfElementsThatAreOnlyInTheFirstSet8() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([3, 2, 1])
    let set2 = CustomSet([2, 4])
    XCTAssertEqual(set1.difference(set2), CustomSet([1, 3]))
  }

  func testUnionOfEmptySetsIsAnEmptySet9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.union(set2), CustomSet([]))
  }

  func testUnionOfAnEmptySetAndNonEmptySetIsTheNonEmptySet9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet(emptyArray)
    let set2 = CustomSet([2])
    XCTAssertEqual(set1.union(set2), CustomSet([2]))
  }

  func testUnionOfANonEmptySetAndEmptySetIsTheNonEmptySet9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 3])
    let set2 = CustomSet(emptyArray)
    XCTAssertEqual(set1.union(set2), CustomSet([1, 3]))
  }

  func testUnionOfNonEmptySetsContainsAllUniqueElements9() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let set1 = CustomSet([1, 3])
    let set2 = CustomSet([2, 3])
    XCTAssertEqual(set1.union(set2), CustomSet([3, 2, 1]))
  }
}
