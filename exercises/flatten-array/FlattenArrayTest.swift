import XCTest

class FlattenArrayTest: XCTestCase {

    func testFlattenIntegerArray() {

        let result = flattenArray(list: [1, [2, 3, 4, 5, 6, 7], 8])
        let intResult = result as? [Int]
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8], intResult!)
    }

    func testFlattenForFiveLevelDeepNestedList() {

        let result = flattenArray(list: [0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
        let intResult = result as? [Int]
        XCTAssertEqual([0, 2, 2, 3, 8, 100, 4, 50, -2], intResult!)
    }

    func testFlattenForSixLevelDeepNestedList() {

        let result = flattenArray(list: [1, [2, [[3]], [4, [[5]]], 6, 7], 8])
        let intResult = result as? [Int]
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8], intResult!)
    }

    func testFlattenForSixLevelDeepNestedListWithNullValues() {

        let nilValue: Any? = nil
        let result = flattenArray(list: [0, 2, [[2, 3], 8, [[100]], nilValue, [[nilValue]]], -2])
        let intResult = result as? [Int]
        XCTAssertEqual([0, 2, 2, 3, 8, 100, -2], intResult!)
    }

    func testFlattenForAllNullDeepNestedList() {

        let nilValue: Any? = nil
        let result = flattenArray(list: [nilValue, [[[nilValue]]], nilValue, nilValue, [[nilValue, nilValue], nilValue], nilValue])
        let intResult = result as? [Int]
        XCTAssertEqual([], intResult!)
    }

}
