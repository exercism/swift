import XCTest
@testable import ListOps

class ListOpsTests: XCTestCase {

    func testAppendEmptyLists() {
        XCTAssertEqual(ListOps.append([Int](), []), [])
    }

    func testAppendEmptyListToList() {
        XCTAssertEqual(ListOps.append([], [1, 2, 3, 4]), [1, 2, 3, 4])
    }

    func testAppendNonemptyLists() {
        XCTAssertEqual(ListOps.append([1, 2], [2, 3, 4, 5]), [1, 2, 2, 3, 4, 5])
    }

    func testConcatEmptyList() {
        XCTAssertEqual(ListOps.concat([Int]()), [])
    }

    func testConcatListOfLists() {
        XCTAssertEqual(ListOps.concat([1, 2], [3], [], [4, 5, 6]), [1, 2, 3, 4, 5, 6])
    }

    func testFilterEmptyList() {
        XCTAssertEqual(ListOps.filter([]) { $0 % 2 == 1 }, [])
    }

    func testFilterNonemptyList() {
        XCTAssertEqual(ListOps.filter([1, 2, 3, 4, 5]) { $0 % 2 == 1 }, [1, 3, 5])
    }

    func testLengthEmptyList() {
        XCTAssertEqual(ListOps.length([]), 0)
    }

    func testLengthNonemptyList() {
        XCTAssertEqual(ListOps.length([1, 2, 3, 4]), 4)
    }

    func testMapEmptyList() {
        XCTAssertEqual(ListOps.map([]) { $0 + 1 }, [])
    }

    func testMapNonemptyList() {
        XCTAssertEqual(ListOps.map([1, 3, 5, 7]) { $0 + 1 }, [2, 4, 6, 8])
    }

    func testFoldLeftEmptyList() {
        XCTAssertEqual(ListOps.foldLeft([], accumulated: 2, combine: +), 2)
    }

    func testFoldLeftNonemptyListAddition() {
        XCTAssertEqual(ListOps.foldLeft([1, 2, 3, 4], accumulated: 5, combine: +), 15)
    }

    func testFoldLeftNonemptyListDivision() {
        XCTAssertEqual(ListOps.foldLeft([2, 5], accumulated: 5, combine: /), 0)
    }

    func testFoldRightEmptyList() {
        XCTAssertEqual(ListOps.foldRight([], accumulated: 2, combine: *), 2)
    }

    func testFoldRightNonemptyListAddition() {
        XCTAssertEqual(ListOps.foldRight([1, 2, 3, 4], accumulated: 5, combine: +), 15)
    }

    func testFoldRightNonemptyListDivision() {
        XCTAssertEqual(ListOps.foldRight([2, 5], accumulated: 5, combine: /), 2)
    }

    func testFoldRightAddString() {
        XCTAssertEqual(ListOps.foldRight(["e", "x", "e", "r", "c", "i", "s", "m"], accumulated: "!", combine: +), "exercism!")
    }

    func testReverseEmptyList() {
        XCTAssertEqual(ListOps.reverse([Int]()), [])
    }

    func testReverseNonemptyList() {
        XCTAssertEqual(ListOps.reverse([1, 3, 5, 7]), [7, 5, 3, 1])
    }

    static var allTests: [(String, (ListOpsTests) -> () throws -> Void)] {
        return [
            ("testAppendEmptyLists", testAppendEmptyLists),
            ("testAppendEmptyListToList", testAppendEmptyListToList),
            ("testAppendNonemptyLists", testAppendNonemptyLists),
            ("testConcatEmptyList", testConcatEmptyList),
            ("testConcatListOfLists", testConcatListOfLists),
            ("testFilterEmptyList", testFilterEmptyList),
            ("testFilterNonemptyList", testFilterNonemptyList),
            ("testLengthEmptyList", testLengthEmptyList),
            ("testLengthNonemptyList", testLengthNonemptyList),
            ("testMapEmptyList", testMapEmptyList),
            ("testMapNonemptyList", testMapNonemptyList),
            ("testFoldLeftEmptyList", testFoldLeftEmptyList),
            ("testFoldLeftNonemptyListAddition", testFoldLeftNonemptyListAddition),
            ("testFoldLeftNonemptyListDivision", testFoldLeftNonemptyListDivision),
            ("testFoldRightEmptyList", testFoldRightEmptyList),
            ("testFoldRightNonemptyListAddition", testFoldRightNonemptyListAddition),
            ("testFoldRightNonemptyListDivision", testFoldRightNonemptyListDivision),
            ("testFoldRightAddString", testFoldRightAddString),
            ("testReverseEmptyList", testReverseEmptyList),
            ("testReverseNonemptyList", testReverseNonemptyList),
        ]
    }
}
