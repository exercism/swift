import XCTest
@testable import CustomSet

class CustomSetTests: XCTestCase {
    let emptyTypedArray = [Int]()

    func testSetsWithNoElementsAreEmpty() {
        XCTAssertTrue(CustomSet(emptyTypedArray).isEmpty)
    }

    func testSetsWithElementsAreNotEmpty() {
        XCTAssertFalse(CustomSet([1]).isEmpty)
    }

    func testNothingIsContainedInAnEmptySet() {
        XCTAssertFalse(CustomSet(emptyTypedArray).contains(1))
    }
    func testWhenTheElementIsInTheSet() {
        XCTAssertTrue(CustomSet([1, 2, 3]).contains(1))
    }
    func testWhenTheElementIsNotInTheSet() {
        XCTAssertFalse(CustomSet([1, 2, 3]).contains(4))
    }

    func testEmptySetIsASubsetOfAnotherEmptySet() {
        XCTAssertTrue(CustomSet(emptyTypedArray).isSubsetOf(CustomSet([])))
    }
    func testEmptySetIsASubsetOfNonEmptySet() {
        XCTAssertTrue(CustomSet(emptyTypedArray).isSubsetOf(CustomSet([1])))
    }
    func testNonEmptySetIsNotASubsetOfEmptySet() {
        XCTAssertFalse(CustomSet([1]).isSubsetOf(CustomSet(emptyTypedArray)))
    }
    func testSetIsASubsetOfSetWithExactSameElements() {
        XCTAssertTrue(CustomSet([1, 2, 3]).isSubsetOf(CustomSet([1, 2, 3])))
    }
    func testSetIsASubsetOfLargerSetWithSameElements() {
        XCTAssertTrue(CustomSet([1, 2, 3]).isSubsetOf(CustomSet([4, 1, 2, 3])))
    }
    func testSetIsNotASubsetOfSetThatDoesNotContainItsElements() {
        XCTAssertFalse(CustomSet([1, 2, 3]).isSubsetOf(CustomSet([4, 1, 3])))
    }

    func testTheEmptySetIsDisjointWithItself() {
        XCTAssertTrue(CustomSet(emptyTypedArray).isDisjoint(CustomSet(emptyTypedArray)))
    }
    func testEmptySetIsDisjointWithNonEmptySet() {
        XCTAssertTrue(CustomSet(emptyTypedArray).isDisjoint(CustomSet([1])))
    }
    func testNonEmptySetIsDisjointWithEmptySet() {
        XCTAssertTrue(CustomSet([1]).isDisjoint(CustomSet(emptyTypedArray)))
    }
    func testSetsAreNotDisjointIfTheyShareAnElement() {
        XCTAssertFalse(CustomSet([1, 2]).isDisjoint(CustomSet([2, 3])))
    }
    func testSetsAreDisjointIfTheyShareNoElements() {
        XCTAssertTrue(CustomSet([1, 2]).isDisjoint(CustomSet([3, 4])))
    }

    func testEmptySetsAreEqual() {
        XCTAssertEqual(CustomSet(emptyTypedArray), CustomSet(emptyTypedArray))
    }
    func testEmptySetIsNotEqualToNonEmptySet() {
        XCTAssertNotEqual(CustomSet(emptyTypedArray), CustomSet([1, 2, 3]))
    }
    func testNonEmptySetIsNotEqualToEmptySet() {
        XCTAssertNotEqual(CustomSet([1, 2, 3]), CustomSet(emptyTypedArray))
    }
    func testSetsWithTheSameElementsAreEqual() {
        XCTAssertEqual(CustomSet([1, 2]), CustomSet([2, 1]))
    }
    func testSetsWithDifferentElementsAreNotEqual() {
        XCTAssertNotEqual(CustomSet([1, 2, 3]), CustomSet([1, 2, 4]))
    }
    func testSetIsNotEqualToLargerSetWithSameElements() {
        XCTAssertNotEqual(CustomSet([1, 2, 3]), CustomSet([1, 2, 3, 4]))
    }

    func testAddToEmptySet() {
        let expected = CustomSet([3])
        var actual = CustomSet(emptyTypedArray)
        actual.add(3)
        XCTAssertEqual(expected, actual)
    }
    func testAddToNonEmptySet() {
        let expected = CustomSet([1, 2, 3, 4])
        var actual = CustomSet([1, 2, 4])
        actual.add(3)
        XCTAssertEqual(expected, actual)
    }
    func testAddingAnExistingElementDoesNotChangeTheSet() {
        let expected = CustomSet([1, 2, 3])
        var actual = CustomSet([1, 2, 3])
        actual.add(3)
        XCTAssertEqual(expected, actual)
    }

    func testIntersectionOfTwoEmptySetsIsAnEmptySet() {
        let expected = CustomSet(emptyTypedArray)
        let actual = CustomSet(emptyTypedArray).intersection(CustomSet(emptyTypedArray))
        XCTAssertEqual(expected, actual)
    }
    func testIntersectionOfAnEmptySetAndNonEmptySetIsAnEmptySet() {
        let expected = CustomSet(emptyTypedArray)
        let actual = CustomSet(emptyTypedArray).intersection(CustomSet([3, 2, 5]))
        XCTAssertEqual(expected, actual)
    }
    func testIntersectionOfANonEmptySetAndAnEmptySetIsAnEmptySet() {
        let expected = CustomSet(emptyTypedArray)
        let actual = CustomSet([1, 2, 3, 4]).intersection(CustomSet(emptyTypedArray))
        XCTAssertEqual(expected, actual)
    }
    func testIntersectionOfTwoSetsWithNoSharedElementsIsAnEmptySet() {
        let expected = CustomSet(emptyTypedArray)
        let actual = CustomSet([1, 2, 3]).intersection(CustomSet([4, 5, 6]))
        XCTAssertEqual(expected, actual)
    }
    func testIntersectionOfTwoSetsWithSharedElementsIsASetOfTheSharedElements() {
        let expected = CustomSet([2, 3])
        let actual = CustomSet([1, 2, 3, 4]).intersection(CustomSet([3, 2, 5]))
        XCTAssertEqual(expected, actual)
    }

    func testDifferenceOfTwoEmptySetsIsAnEmptySet() {
        let expected = CustomSet(emptyTypedArray)
        let actual = CustomSet(emptyTypedArray).difference(CustomSet(emptyTypedArray))
        XCTAssertEqual(expected, actual)
    }
    func testDifferenceOfEmptySetAndNonEmptySetIsAnEmptySet() {
        let expected = CustomSet(emptyTypedArray)
        let actual = CustomSet(emptyTypedArray).difference(CustomSet([3, 2, 5]))
        XCTAssertEqual(expected, actual)
    }
    func testDifferenceOfANonEmptySetAndAnEmptySetIsTheNonEmptySet() {
        let expected = CustomSet([1, 2, 3, 4])
        let actual = CustomSet([1, 2, 3, 4]).difference(CustomSet(emptyTypedArray))
        XCTAssertEqual(expected, actual)
    }
    func testDifferenceOfTwoNonEmptySetsIsASetOfElementsThatAreOnlyInTheFirstSet() {
        let expected = CustomSet([1, 3])
        let actual = CustomSet([3, 2, 1]).difference(CustomSet([2, 4]))
        XCTAssertEqual(expected, actual)
    }

    func testUnionOfEmptySetsIsAnEmptySet() {
        let expected = CustomSet(emptyTypedArray)
        let actual = CustomSet(emptyTypedArray).union(CustomSet(emptyTypedArray))
        XCTAssertEqual(expected, actual)
    }
    func testUnionOfAnEmptySetAndNonEmptySetIsTheNonEmptySet() {
        let expected = CustomSet([2])
        let actual = CustomSet(emptyTypedArray).union(CustomSet([2]))
        XCTAssertEqual(expected, actual)
    }
    func testUnionOfANonEmptySetAndEmptySetIsTheNonEmptySet() {
        let expected = CustomSet([1, 3])
        let actual = CustomSet([1, 3]).union(CustomSet(emptyTypedArray))
        XCTAssertEqual(expected, actual)
    }
    func testUnionOfNonEmptySetsContainsAllUniqueElements() {
        let expected = CustomSet([3, 2, 1])
        let actual = CustomSet([1, 3]).union(CustomSet([2, 3]))
        XCTAssertEqual(expected, actual)
    }

    func testDeleteMethod() {

        var expected1 = CustomSet([3, 2, 1])
        expected1.delete(2)
        XCTAssertEqual(CustomSet([1, 3]), expected1)

        var expected2 = CustomSet([3, 2, 1])
        expected2.delete(4)
        XCTAssertEqual(CustomSet([1, 2, 3]), expected2)
    }

    func testRemoveAllMethod() {
        var expected1 = CustomSet([1, 2])
        expected1.removeAll()
        XCTAssertEqual(CustomSet(emptyTypedArray), expected1)

        var expected2 = CustomSet(emptyTypedArray)
        expected2.removeAll()
        XCTAssertEqual(CustomSet(emptyTypedArray), expected2)
    }

    func testSize() {
        XCTAssertEqual(0, CustomSet(emptyTypedArray).size)
        XCTAssertEqual(3, CustomSet([1, 2, 3]).size)
        XCTAssertEqual(3, CustomSet([1, 2, 3, 2]).size)
    }

    func testToA() {
        XCTAssertEqual([1, 2, 3], CustomSet([3, 1, 2]).toSortedArray)
        XCTAssertEqual([1, 2, 3], CustomSet([3, 1, 2, 1]).toSortedArray)
    }

    static var allTests: [(String, (CustomSetTests) -> () throws -> Void)] {
        return [
            ("testSetsWithNoElementsAreEmpty", testSetsWithNoElementsAreEmpty),
            ("testSetsWithElementsAreNotEmpty", testSetsWithElementsAreNotEmpty),
            ("testNothingIsContainedInAnEmptySet", testNothingIsContainedInAnEmptySet),
            ("testWhenTheElementIsInTheSet", testWhenTheElementIsInTheSet),
            ("testWhenTheElementIsNotInTheSet", testWhenTheElementIsNotInTheSet),
            ("testEmptySetIsASubsetOfAnotherEmptySet", testEmptySetIsASubsetOfAnotherEmptySet),
            ("testEmptySetIsASubsetOfNonEmptySet", testEmptySetIsASubsetOfNonEmptySet),
            ("testNonEmptySetIsNotASubsetOfEmptySet", testNonEmptySetIsNotASubsetOfEmptySet),
            ("testSetIsASubsetOfSetWithExactSameElements", testSetIsASubsetOfSetWithExactSameElements),
            ("testSetIsASubsetOfLargerSetWithSameElements", testSetIsASubsetOfLargerSetWithSameElements),
            ("testSetIsNotASubsetOfSetThatDoesNotContainItsElements", testSetIsNotASubsetOfSetThatDoesNotContainItsElements),
            ("testTheEmptySetIsDisjointWithItself", testTheEmptySetIsDisjointWithItself),
            ("testEmptySetIsDisjointWithNonEmptySet", testEmptySetIsDisjointWithNonEmptySet),
            ("testNonEmptySetIsDisjointWithEmptySet", testNonEmptySetIsDisjointWithEmptySet),
            ("testSetsAreNotDisjointIfTheyShareAnElement", testSetsAreNotDisjointIfTheyShareAnElement),
            ("testSetsAreDisjointIfTheyShareNoElements", testSetsAreDisjointIfTheyShareNoElements),
            ("testEmptySetsAreEqual", testEmptySetsAreEqual),
            ("testEmptySetIsNotEqualToNonEmptySet", testEmptySetIsNotEqualToNonEmptySet),
            ("testNonEmptySetIsNotEqualToEmptySet", testNonEmptySetIsNotEqualToEmptySet),
            ("testSetsWithTheSameElementsAreEqual", testSetsWithTheSameElementsAreEqual),
            ("testSetsWithDifferentElementsAreNotEqual", testSetsWithDifferentElementsAreNotEqual),
            ("testSetIsNotEqualToLargerSetWithSameElements", testSetIsNotEqualToLargerSetWithSameElements),
            ("testAddToEmptySet", testAddToEmptySet),
            ("testAddToNonEmptySet", testAddToNonEmptySet),
            ("testAddingAnExistingElementDoesNotChangeTheSet", testAddingAnExistingElementDoesNotChangeTheSet),
            ("testIntersectionOfTwoEmptySetsIsAnEmptySet", testIntersectionOfTwoEmptySetsIsAnEmptySet),
            ("testIntersectionOfAnEmptySetAndNonEmptySetIsAnEmptySet", testIntersectionOfAnEmptySetAndNonEmptySetIsAnEmptySet),
            ("testIntersectionOfANonEmptySetAndAnEmptySetIsAnEmptySet", testIntersectionOfANonEmptySetAndAnEmptySetIsAnEmptySet),
            ("testIntersectionOfTwoSetsWithNoSharedElementsIsAnEmptySet", testIntersectionOfTwoSetsWithNoSharedElementsIsAnEmptySet),
            ("testIntersectionOfTwoSetsWithSharedElementsIsASetOfTheSharedElements", testIntersectionOfTwoSetsWithSharedElementsIsASetOfTheSharedElements),
            ("testDifferenceOfTwoEmptySetsIsAnEmptySet", testDifferenceOfTwoEmptySetsIsAnEmptySet),
            ("testDifferenceOfEmptySetAndNonEmptySetIsAnEmptySet", testDifferenceOfEmptySetAndNonEmptySetIsAnEmptySet),
            ("testDifferenceOfANonEmptySetAndAnEmptySetIsTheNonEmptySet", testDifferenceOfANonEmptySetAndAnEmptySetIsTheNonEmptySet),
            ("testDifferenceOfTwoNonEmptySetsIsASetOfElementsThatAreOnlyInTheFirstSet", testDifferenceOfTwoNonEmptySetsIsASetOfElementsThatAreOnlyInTheFirstSet),
            ("testUnionOfEmptySetsIsAnEmptySet", testUnionOfEmptySetsIsAnEmptySet),
            ("testUnionOfAnEmptySetAndNonEmptySetIsTheNonEmptySet", testUnionOfAnEmptySetAndNonEmptySetIsTheNonEmptySet),
            ("testUnionOfANonEmptySetAndEmptySetIsTheNonEmptySet", testUnionOfANonEmptySetAndEmptySetIsTheNonEmptySet),
            ("testUnionOfNonEmptySetsContainsAllUniqueElements", testUnionOfNonEmptySetsContainsAllUniqueElements),
            ("testDeleteMethod", testDeleteMethod),
            ("testRemoveAllMethod", testRemoveAllMethod),
            ("testSize", testSize),
            ("testToA", testToA),
        ]
    }
}
