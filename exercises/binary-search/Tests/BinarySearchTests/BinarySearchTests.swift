import XCTest
@testable import BinarySearch

class BinarySearchTests: XCTestCase {

    func testHasListData() {
        let binary = try! BinarySearch([1, 3, 4, 6, 8, 9, 11])
        XCTAssertEqual([1, 3, 4, 6, 8, 9, 11], binary.list)
    }

    func testThrowsErrorForUnsortedList() {
        XCTAssertThrowsError(_ = try BinarySearch([2, 1, 4, 3, 6])) { error in
            XCTAssertEqual(error as? BinarySearchError, BinarySearchError.unsorted)
        }
    }

    func testNilForDataNotInList() {
        XCTAssertNil(try! BinarySearch([1, 3, 6]).searchFor(2))
    }

    func testFindsPositionOfMiddleItem() {
        let binary = try! BinarySearch([1, 3, 4, 6, 8, 9, 11])
        XCTAssertEqual(3, binary.middle)
    }

    func testFindsPositionOfSearchData() {
        let binary = try! BinarySearch([1, 3, 4, 6, 8, 9, 11])
        XCTAssertEqual(5, binary.searchFor(9))
    }

    func testFindsPositionInALargerList() {
        let binary = try! BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144])
        XCTAssertEqual(1, binary.searchFor(3))
        XCTAssertEqual(7, binary.searchFor(55))
    }

    func testFindsCorrectPositionInAListWithAnEvenNumberOfElements() {
        let binary = try! BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377])
        XCTAssertEqual(5, binary.searchFor(21))
        XCTAssertEqual(6, binary.searchFor(34))
    }

    static var allTests: [(String, (BinarySearchTests) -> () throws -> Void)] {
        return [
            ("testHasListData", testHasListData),
            ("testThrowsErrorForUnsortedList", testThrowsErrorForUnsortedList),
            ("testNilForDataNotInList", testNilForDataNotInList),
            ("testFindsPositionOfMiddleItem", testFindsPositionOfMiddleItem),
            ("testFindsPositionOfSearchData", testFindsPositionOfSearchData),
            ("testFindsPositionInALargerList", testFindsPositionInALargerList),
            ("testFindsCorrectPositionInAListWithAnEvenNumberOfElements", testFindsCorrectPositionInAListWithAnEvenNumberOfElements),
        ]
    }
}
