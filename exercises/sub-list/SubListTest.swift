import XCTest

class SubListTest: XCTestCase {

    func testEmptyLists() {

        let sublists = SubList(firstList: [], secondList: [])
        let expected = "equal"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testEmptyListWithinNonEmptyList() {

        let sublists = SubList(firstList: [], secondList: [1, 2, 3])
        let expected = "sublist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testNonEmptyListContainingEmptyList() {

        let sublists = SubList(firstList: [1, 2, 3], secondList: [])
        let expected = "superlist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testEqualLists() {

        let sublists = SubList(firstList: [1, 2, 3], secondList: [1, 2, 3])
        let expected = "equal"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testDifferentLists() {

        let sublists = SubList(firstList: [1, 2, 3], secondList: [2, 3, 4])
        let expected = "unequal"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testFalseStart() {

        let sublists = SubList(firstList: [1, 2, 5], secondList: [0, 1, 2, 3, 1, 2, 5, 6])
        let expected = "sublist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testConsecutive() {

        let sublists = SubList(firstList: [1, 1, 2], secondList: [0, 1, 1, 1, 2, 1, 2])
        let expected = "sublist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))

    }

    func testSublistAtStart() {

        let sublists = SubList(firstList: [0, 1, 2], secondList: [0, 1, 2, 3, 4, 5])
        let expected = "sublist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testSublistInMiddle() {

        let sublists = SubList(firstList: [2, 3, 4], secondList: [0, 1, 2, 3, 4, 5])
        let expected = "sublist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))

    }

    func testSublistAtEnd() {

        let sublists = SubList(firstList: [3, 4, 5], secondList: [0, 1, 2, 3, 4, 5])
        let expected = "sublist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testAtStartOfSuperList() {

        let sublists = SubList(firstList: [0, 1, 2, 3, 4, 5], secondList: [0, 1, 2])
        let expected = "superlist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))

    }

    func testInMiddleOfSuperList() {

        let sublists = SubList(firstList: [0, 1, 2, 3, 4, 5], secondList: [ 2, 3])
        let expected = "superlist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testAtEndOfSuperList() {

        let sublists = SubList(firstList: [0, 1, 2, 3, 4, 5], secondList: [3, 4, 5])
        let expected = "superlist"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testFirstListMissingElementFromSecondList() {

        let sublists = SubList(firstList: [1, 3], secondList: [1, 2, 3])
        let expected = "unequal"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))

    }

    func testSecondListMissingElementFromFirstList() {

        let sublists = SubList(firstList: [1, 2, 3], secondList: [1, 3])
        let expected = "unequal"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }

    func testOrderMattersToAList() {

        let sublists = SubList(firstList: [1, 2, 3], secondList: [3, 2, 1])
        let expected = "unequal"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))

    }

    func testSameDigitsButDifferentNumbers() {

        let sublists = SubList(firstList: [1, 0, 1], secondList: [10, 1])
        let expected = "unequal"
        XCTAssertEqual(expected, sublists.checkSubList(list_one: sublists.firstList, list_two: sublists.secondList))
    }
}
