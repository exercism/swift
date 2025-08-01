import Foundation
import Testing

@testable import CustomSet

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite
struct CustomSetTests {

  @Test("sets with no elements are empty")
  func testSetsWithNoElementsAreEmpty() {
    let customSet = CustomSet([Int]())
    #expect(customSet.isEmpty)
  }
  @Test("sets with elements are not empty", .enabled(if: RUNALL))
  func testSetsWithElementsAreNotEmpty() {
    let customSet = CustomSet([1])
    #expect(!customSet.isEmpty)
  }
  @Test("nothing is contained in an empty set", .enabled(if: RUNALL))
  func testNothingIsContainedInAnEmptySet() {
    let customSet = CustomSet([Int]())
    #expect(!customSet.contains(1))
  }
  @Test("when the element is in the set", .enabled(if: RUNALL))
  func testWhenTheElementIsInTheSet() {
    let customSet = CustomSet([1, 2, 3])
    #expect(customSet.contains(1))
  }
  @Test("when the element is not in the set", .enabled(if: RUNALL))
  func testWhenTheElementIsNotInTheSet() {
    let customSet = CustomSet([1, 2, 3])
    #expect(!customSet.contains(4))
  }
  @Test("empty set is a subset of another empty set", .enabled(if: RUNALL))
  func testEmptySetIsASubsetOfAnotherEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([Int]())
    #expect(set1.isSubset(of: set2))
  }
  @Test("empty set is a subset of non-empty set", .enabled(if: RUNALL))
  func testEmptySetIsASubsetOfNonEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([1])
    #expect(set1.isSubset(of: set2))
  }
  @Test("non-empty set is not a subset of empty set", .enabled(if: RUNALL))
  func testNonEmptySetIsNotASubsetOfEmptySet() {
    let set1 = CustomSet([1])
    let set2 = CustomSet([Int]())
    #expect(!set1.isSubset(of: set2))
  }
  @Test("set is a subset of set with exact same elements", .enabled(if: RUNALL))
  func testSetIsASubsetOfSetWithExactSameElements() {
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 3])
    #expect(set1.isSubset(of: set2))
  }
  @Test("set is a subset of larger set with same elements", .enabled(if: RUNALL))
  func testSetIsASubsetOfLargerSetWithSameElements() {
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 1, 2, 3])
    #expect(set1.isSubset(of: set2))
  }
  @Test("set is not a subset of set that does not contain its elements", .enabled(if: RUNALL))
  func testSetIsNotASubsetOfSetThatDoesNotContainItsElements() {
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 1, 3])
    #expect(!set1.isSubset(of: set2))
  }
  @Test("the empty set is disjoint with itself", .enabled(if: RUNALL))
  func testTheEmptySetIsDisjointWithItself() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([Int]())
    #expect(set1.isDisjoint(with: set2))
  }
  @Test("empty set is disjoint with non-empty set", .enabled(if: RUNALL))
  func testEmptySetIsDisjointWithNonEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([1])
    #expect(set1.isDisjoint(with: set2))
  }
  @Test("non-empty set is disjoint with empty set", .enabled(if: RUNALL))
  func testNonEmptySetIsDisjointWithEmptySet() {
    let set1 = CustomSet([1])
    let set2 = CustomSet([Int]())
    #expect(set1.isDisjoint(with: set2))
  }
  @Test("sets are not disjoint if they share an element", .enabled(if: RUNALL))
  func testSetsAreNotDisjointIfTheyShareAnElement() {
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([2, 3])
    #expect(!set1.isDisjoint(with: set2))
  }
  @Test("sets are disjoint if they share no elements", .enabled(if: RUNALL))
  func testSetsAreDisjointIfTheyShareNoElements() {
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([3, 4])
    #expect(set1.isDisjoint(with: set2))
  }
  @Test("empty sets are equal", .enabled(if: RUNALL))
  func testEmptySetsAreEqual() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([Int]())
    #expect((set1 == set2))
  }
  @Test("empty set is not equal to non-empty set", .enabled(if: RUNALL))
  func testEmptySetIsNotEqualToNonEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([1, 2, 3])
    #expect(!(set1 == set2))
  }
  @Test("non-empty set is not equal to empty set", .enabled(if: RUNALL))
  func testNonEmptySetIsNotEqualToEmptySet() {
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([Int]())
    #expect(!(set1 == set2))
  }
  @Test("sets with the same elements are equal", .enabled(if: RUNALL))
  func testSetsWithTheSameElementsAreEqual() {
    let set1 = CustomSet([1, 2])
    let set2 = CustomSet([2, 1])
    #expect((set1 == set2))
  }
  @Test("sets with different elements are not equal", .enabled(if: RUNALL))
  func testSetsWithDifferentElementsAreNotEqual() {
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 4])
    #expect(!(set1 == set2))
  }
  @Test("set is not equal to larger set with same elements", .enabled(if: RUNALL))
  func testSetIsNotEqualToLargerSetWithSameElements() {
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([1, 2, 3, 4])
    #expect(!(set1 == set2))
  }
  @Test("add to empty set", .enabled(if: RUNALL))
  func testAddToEmptySet() {
    var customSet = CustomSet([Int]())
    customSet.add(3)
    #expect(customSet == CustomSet([3]))
  }
  @Test("add to non-empty set", .enabled(if: RUNALL))
  func testAddToNonEmptySet() {
    var customSet = CustomSet([1, 2, 4])
    customSet.add(3)
    #expect(customSet == CustomSet([1, 2, 3, 4]))
  }
  @Test("adding an existing element does not change the set", .enabled(if: RUNALL))
  func testAddingAnExistingElementDoesNotChangeTheSet() {
    var customSet = CustomSet([1, 2, 3])
    customSet.add(3)
    #expect(customSet == CustomSet([1, 2, 3]))
  }
  @Test("intersection of two empty sets is an empty set", .enabled(if: RUNALL))
  func testIntersectionOfTwoEmptySetsIsAnEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([Int]())
    #expect(set1.intersection(set2) == CustomSet([]))
  }
  @Test("intersection of an empty set and non-empty set is an empty set", .enabled(if: RUNALL))
  func testIntersectionOfAnEmptySetAndNonEmptySetIsAnEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([3, 2, 5])
    #expect(set1.intersection(set2) == CustomSet([]))
  }
  @Test("intersection of a non-empty set and an empty set is an empty set", .enabled(if: RUNALL))
  func testIntersectionOfANonEmptySetAndAnEmptySetIsAnEmptySet() {
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet([Int]())
    #expect(set1.intersection(set2) == CustomSet([]))
  }
  @Test("intersection of two sets with no shared elements is an empty set", .enabled(if: RUNALL))
  func testIntersectionOfTwoSetsWithNoSharedElementsIsAnEmptySet() {
    let set1 = CustomSet([1, 2, 3])
    let set2 = CustomSet([4, 5, 6])
    #expect(set1.intersection(set2) == CustomSet([]))
  }
  @Test(
    "intersection of two sets with shared elements is a set of the shared elements",
    .enabled(if: RUNALL))
  func testIntersectionOfTwoSetsWithSharedElementsIsASetOfTheSharedElements() {
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet([3, 2, 5])
    #expect(set1.intersection(set2) == CustomSet([2, 3]))
  }
  @Test("difference of two empty sets is an empty set", .enabled(if: RUNALL))
  func testDifferenceOfTwoEmptySetsIsAnEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([Int]())
    #expect(set1.difference(set2) == CustomSet([]))
  }
  @Test("difference of empty set and non-empty set is an empty set", .enabled(if: RUNALL))
  func testDifferenceOfEmptySetAndNonEmptySetIsAnEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([3, 2, 5])
    #expect(set1.difference(set2) == CustomSet([]))
  }
  @Test("difference of a non-empty set and an empty set is the non-empty set", .enabled(if: RUNALL))
  func testDifferenceOfANonEmptySetAndAnEmptySetIsTheNonEmptySet() {
    let set1 = CustomSet([1, 2, 3, 4])
    let set2 = CustomSet([Int]())
    #expect(set1.difference(set2) == CustomSet([1, 2, 3, 4]))
  }
  @Test(
    "difference of two non-empty sets is a set of elements that are only in the first set",
    .enabled(if: RUNALL))
  func testDifferenceOfTwoNonEmptySetsIsASetOfElementsThatAreOnlyInTheFirstSet() {
    let set1 = CustomSet([3, 2, 1])
    let set2 = CustomSet([2, 4])
    #expect(set1.difference(set2) == CustomSet([1, 3]))
  }
  @Test("union of empty sets is an empty set", .enabled(if: RUNALL))
  func testUnionOfEmptySetsIsAnEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([Int]())
    #expect(set1.union(set2) == CustomSet([]))
  }
  @Test("union of an empty set and non-empty set is the non-empty set", .enabled(if: RUNALL))
  func testUnionOfAnEmptySetAndNonEmptySetIsTheNonEmptySet() {
    let set1 = CustomSet([Int]())
    let set2 = CustomSet([2])
    #expect(set1.union(set2) == CustomSet([2]))
  }
  @Test("union of a non-empty set and empty set is the non-empty set", .enabled(if: RUNALL))
  func testUnionOfANonEmptySetAndEmptySetIsTheNonEmptySet() {
    let set1 = CustomSet([1, 3])
    let set2 = CustomSet([Int]())
    #expect(set1.union(set2) == CustomSet([1, 3]))
  }
  @Test("union of non-empty sets contains all unique elements", .enabled(if: RUNALL))
  func testUnionOfNonEmptySetsContainsAllUniqueElements() {
    let set1 = CustomSet([1, 3])
    let set2 = CustomSet([2, 3])
    #expect(set1.union(set2) == CustomSet([3, 2, 1]))
  }
}
