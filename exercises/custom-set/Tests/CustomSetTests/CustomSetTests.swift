import XCTest
@testable import CustomSet

class CustomSetTests: XCTestCase {
    let emptyTypedArray = [Int]()

    func testEqual() {
        XCTAssertEqual(CustomSet([1, 3]), CustomSet([3, 1]))
        XCTAssertNotEqual(CustomSet([1, 3]), CustomSet([3, 1, 5]))
        XCTAssertNotEqual(CustomSet([1, 3, 5]), CustomSet([3, 1]))
        XCTAssertNotEqual(CustomSet([1, 3]), CustomSet([2, 1]))
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

    func testDisjoint() {
        XCTAssertTrue(CustomSet([1, 2]).isDisjoint(CustomSet([3, 4])))
        XCTAssertFalse(CustomSet([1, 2]).isDisjoint(CustomSet([2, 3])))
        XCTAssertFalse(CustomSet([1.0, 2.0]).isDisjoint(CustomSet([2.0, 3.0])))
    }

    func testEmptyMethod() {
        var expected1 = CustomSet([1, 2])
        expected1.removeAll()
        XCTAssertEqual(CustomSet(emptyTypedArray ), expected1 )

        var expected2 = CustomSet(emptyTypedArray )
        expected2.removeAll()
        XCTAssertEqual(CustomSet(emptyTypedArray ), expected2 )
    }
    func testIntersection() {
        XCTAssertEqual(CustomSet(["a", "c"]),
                       CustomSet(["a", "b", "c"]).intersection(CustomSet(["a", "c", "d"])))

        XCTAssertEqual(CustomSet([3.0]),
                       CustomSet([1.0, 2.0, 3.0]).intersection(CustomSet([3.0])))
    }

    func testMember() {
        XCTAssertTrue(CustomSet([1, 2, 3]).containsMember(2))
        XCTAssertTrue(CustomSet([1, 2, 3]).containsMember(3))
        XCTAssertFalse(CustomSet([1, 2, 3]).containsMember(4))
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

    func testSubsetMethod() {
        XCTAssertTrue(CustomSet([1, 2, 3]).isSupersetOf(CustomSet([1, 2, 3])))
        XCTAssertTrue(CustomSet([4, 1, 2, 3]).isSupersetOf(CustomSet([1, 2, 3])))
        XCTAssertFalse(CustomSet([4, 1, 3]).isSupersetOf(CustomSet([1, 2, 3])))
        XCTAssertFalse(CustomSet([1, 2, 3, 4]).isSupersetOf(CustomSet([1, 2, 5])))
        XCTAssertTrue(CustomSet([4, 1, 3]).isSupersetOf(CustomSet(emptyTypedArray)))
        XCTAssertTrue(CustomSet(emptyTypedArray).isSupersetOf(CustomSet(emptyTypedArray)))
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
            ("testEqual", testEqual),
            ("testNoDuplicates", testNoDuplicates),
            ("testDeleteMethod", testDeleteMethod),
            ("testDifference", testDifference),
            ("testDisjoint", testDisjoint),
            ("testEmptyMethod", testEmptyMethod),
            ("testIntersection", testIntersection),
            ("testMember", testMember),
            ("testPutMethod", testPutMethod),
            ("testSize", testSize),
            ("testSubsetMethod", testSubsetMethod),
            ("testToA", testToA),
            ("testUnion", testUnion),
        ]
    }
}
