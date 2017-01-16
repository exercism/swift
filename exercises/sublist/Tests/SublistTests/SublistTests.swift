import XCTest
@testable import Sublist

class SublistTests: XCTestCase {
    func testEmptyLists() {

        XCTAssertEqual(.equal, classifier(listOne: [], listTwo: []) )
    }

    func testEmptyListWithinNonEmptyList() {

        XCTAssertEqual(.sublist, classifier(listOne: [], listTwo: [1, 2, 3]))
    }

    func testNonEmptyListContainingEmptyList() {

        XCTAssertEqual(.superlist, classifier(listOne: [1, 2, 3], listTwo: []))
    }

    func testEqualLists() {

        XCTAssertEqual(.equal, classifier(listOne: [1, 2, 3], listTwo: [1, 2, 3]))
    }

    func testDifferentLists() {

        XCTAssertEqual(.unequal, classifier(listOne: [1, 2, 3], listTwo: [2, 3, 4]))
    }

    func testFalseStart() {

        XCTAssertEqual(.sublist, classifier(listOne: [1, 2, 5], listTwo: [0, 1, 2, 3, 1, 2, 5, 6]))
    }

    func testConsecutive() {

        XCTAssertEqual(.sublist, classifier(listOne: [1, 1, 2], listTwo: [0, 1, 1, 1, 2, 1, 2]))

    }

    func testSublistAtStart() {

        XCTAssertEqual(.sublist, classifier(listOne: [0, 1, 2], listTwo: [0, 1, 2, 3, 4, 5]))
    }

    func testSublistInMiddle() {

        XCTAssertEqual(.sublist, classifier(listOne: [2, 3, 4], listTwo: [0, 1, 2, 3, 4, 5]))

    }

    func testSublistAtEnd() {

        XCTAssertEqual(.sublist, classifier(listOne: [3, 4, 5], listTwo: [0, 1, 2, 3, 4, 5]))

    }

    func testAtStartOfSuperList() {

        XCTAssertEqual(.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [0, 1, 2]))

    }

    func testInMiddleOfSuperList() {

        XCTAssertEqual(.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [2, 3]))
    }

    func testAtEndOfSuperList() {

        XCTAssertEqual(.superlist, classifier(listOne: [0, 1, 2, 3, 4, 5], listTwo: [3, 4, 5]))
    }

    func testFirstListMissingElementFromSecondList() {

        XCTAssertEqual(.unequal, classifier(listOne: [1, 3], listTwo: [1, 2, 3]))

    }

    func testSecondListMissingElementFromFirstList() {

        XCTAssertEqual(.unequal, classifier(listOne: [1, 2, 3], listTwo: [1, 3]))
    }

    func testOrderMattersToAList() {

        XCTAssertEqual(.unequal, classifier(listOne: [1, 2, 3], listTwo: [3, 2, 1]))

    }

    func testSameDigitsButDifferentNumbers() {

        XCTAssertEqual(.unequal, classifier(listOne: [1, 0, 1], listTwo: [10, 1]))
    }

    static var allTests: [(String, (SublistTests) -> () throws -> Void)] {
        return [
            ("testEmptyLists", testEmptyLists),
            ("testEmptyListWithinNonEmptyList", testEmptyListWithinNonEmptyList),
            ("testNonEmptyListContainingEmptyList", testNonEmptyListContainingEmptyList),
            ("testEqualLists", testEqualLists),
            ("testDifferentLists", testDifferentLists),
            ("testFalseStart", testFalseStart),
            ("testConsecutive", testConsecutive),
            ("testSublistAtStart", testSublistAtStart),
            ("testSublistInMiddle", testSublistInMiddle),
            ("testSublistAtEnd", testSublistAtEnd),
            ("testAtStartOfSuperList", testAtStartOfSuperList),
            ("testInMiddleOfSuperList", testInMiddleOfSuperList),
            ("testAtEndOfSuperList", testAtEndOfSuperList),
            ("testFirstListMissingElementFromSecondList", testFirstListMissingElementFromSecondList),
            ("testSecondListMissingElementFromFirstList", testSecondListMissingElementFromFirstList),
            ("testOrderMattersToAList", testOrderMattersToAList),
            ("testSameDigitsButDifferentNumbers", testSameDigitsButDifferentNumbers),
        ]
    }
}
