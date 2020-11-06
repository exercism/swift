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

    func testNoDuplicates() {
        XCTAssertEqual(CustomSet([1, 1]), CustomSet([1]))
    }

    func testDeleteMethod() {

        var expected1 = CustomSet([3, 2, 1])
        expected1.delete(2)
        XCTAssertEqual(CustomSet([1, 3]), expected1)

        var expected2 = CustomSet([3, 2, 1])
        expected2.delete(4)
        XCTAssertEqual(CustomSet([1, 2, 3]), expected2)
    }

    func testDifference() {
        XCTAssertEqual(CustomSet([1, 3]),
                       CustomSet([1, 2, 3]).difference(CustomSet([2, 4])))
        XCTAssertEqual(CustomSet([2, 3]),
                       CustomSet([1, 2, 3, 4]).difference(CustomSet([1, 4])))

    }

    func testRemoveAllMethod() {
        var expected1 = CustomSet([1, 2])
        expected1.removeAll()
        XCTAssertEqual(CustomSet(emptyTypedArray), expected1)

        var expected2 = CustomSet(emptyTypedArray)
        expected2.removeAll()
        XCTAssertEqual(CustomSet(emptyTypedArray), expected2)
    }

    func testIntersection() {
        XCTAssertEqual(CustomSet(["a", "c"]),
                       CustomSet(["a", "b", "c"]).intersection(CustomSet(["a", "c", "d"])))

        XCTAssertEqual(CustomSet([3.0]),
                       CustomSet([1.0, 2.0, 3.0]).intersection(CustomSet([3.0])))
    }



    func testPutMethod() {
        var expected1 = CustomSet([1, 2, 4])
        expected1.put(3)
        XCTAssertEqual(CustomSet([1, 2, 3, 4]),
                       expected1)

        var expected2 = CustomSet([1, 2, 3])
        expected2.put(3)
        XCTAssertEqual(CustomSet([1, 2, 3]),
                       expected2)
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

    func testUnion() {
        XCTAssertEqual(CustomSet([3, 2, 1]),
                       CustomSet([1, 3]).union(CustomSet([2])))
        XCTAssertEqual(CustomSet([3.0, 3, 2, 1]),
                       CustomSet([1, 3]).union(CustomSet([2, 3.0])))
        XCTAssertEqual(CustomSet([3, 1]),
                       CustomSet([1, 3]).union(CustomSet(emptyTypedArray)))
        XCTAssertEqual(CustomSet([2]),
                       CustomSet([2]).union(CustomSet(emptyTypedArray)))
        XCTAssertEqual(CustomSet(emptyTypedArray),
                       CustomSet(emptyTypedArray).union(CustomSet(emptyTypedArray)))
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
            ("testNoDuplicates", testNoDuplicates),
            ("testDeleteMethod", testDeleteMethod),
            ("testDifference", testDifference),
            ("testRemoveAllMethod", testRemoveAllMethod),
            ("testIntersection", testIntersection),
            ("testPutMethod", testPutMethod),
            ("testSize", testSize),
            ("testToA", testToA),
            ("testUnion", testUnion),
        ]
    }
}
