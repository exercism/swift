import XCTest

class SubListTest: XCTestCase {

    func testEmptyLists() {

        XCTAssertEqual(SublistKind.equal, classifier(listOne: [], listTwo: []) )
    }

    func testEmptyListWithinNonEmptyList() {

        XCTAssertEqual(SublistKind.sublist, classifier(listOne: [], listTwo: [1, 2, 3]))
    }

    func testNonEmptyListContainingEmptyList() {

        XCTAssertEqual(SublistKind.superlist, classifier(listOne: [1, 2, 3], listTwo: []))
    }

    func testEqualLists() {

        XCTAssertEqual(SublistKind.equal, classifier(listOne: [1, 2, 3], listTwo: [1, 2, 3]))
    }

    func testDifferentLists() {

        XCTAssertEqual(SublistKind.unequal, classifier(listOne: [1, 2, 3], listTwo: [2, 3, 4]))
    }

    func testFalseStart() {

        XCTAssertEqual(SublistKind.sublist, classifier(listOne: [1, 2, 5], listTwo: [0, 1, 2, 3, 1, 2, 5, 6]))
    }

    func testConsecutive() {

        XCTAssertEqual(SublistKind.sublist, classifier(listOne: [1, 1, 2], listTwo: [0, 1, 1, 1, 2, 1, 2]))

    }

    func testSublistAtStart() {

        XCTAssertEqual(SublistKind.sublist, classifier(listOne: [0, 1, 2], listTwo: [0, 1, 2, 3, 4, 5]))
    }

    func testSublistInMiddle() {

        XCTAssertEqual(SublistKind.sublist, classifier(listOne: [2, 3, 4], listTwo: [0, 1, 2, 3, 4, 5]))

    }

    func testSublistAtEnd() {

        XCTAssertEqual(SublistKind.sublist, classifier(listOne: [3, 4, 5], listTwo: [0, 1, 2, 3, 4, 5]))

    }

    func testAtStartOfSuperList() {

        XCTAssertEqual(SublistKind.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [0, 1, 2]))

    }

    func testInMiddleOfSuperList() {

        XCTAssertEqual(SublistKind.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [2, 3]))
    }

    func testAtEndOfSuperList() {

        XCTAssertEqual(SublistKind.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [3, 4, 5]))
    }

    func testFirstListMissingElementFromSecondList() {

        XCTAssertEqual(SublistKind.unequal, classifier(listOne: [1, 3], listTwo: [1, 2, 3]))

    }

    func testSecondListMissingElementFromFirstList() {

        XCTAssertEqual(SublistKind.unequal, classifier(listOne: [1, 2, 3], listTwo: [1, 3]))
    }

    func testOrderMattersToAList() {

        XCTAssertEqual(SublistKind.unequal, classifier(listOne: [1, 2, 3], listTwo: [3, 2, 1]))

    }

    func testSameDigitsButDifferentNumbers() {

        XCTAssertEqual(SublistKind.unequal, classifier(listOne: [1, 0, 1], listTwo: [10, 1]))
    }
}
