import XCTest
@testable import FlattenArray

class FlattenArrayTests: XCTestCase {

    func testFlattenIntegerArray() {

        let result: [Int] = flattenArray([1, [2, 3, 4, 5, 6, 7], 8])
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8], result)
    }

    func testFlattenForFiveLevelDeepNestedList() {

        let result: [Int] = flattenArray([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])
        XCTAssertEqual([0, 2, 2, 3, 8, 100, 4, 50, -2], result)
    }

    func testFlattenForSixLevelDeepNestedList() {

        let result: [Int] = flattenArray([1, [2, [[3]], [4, [[5]]], 6, 7], 8])
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8], result)
    }

    func testFlattenForSixLevelDeepNestedListWithNullValues() {

        let nilValue: Any? = nil
        let result: [Int] = flattenArray([0, 2, [[2, 3], 8, [[100]], nilValue, [[nilValue]]], -2])
        XCTAssertEqual([0, 2, 2, 3, 8, 100, -2], result)
    }

    func testFlattenForAllNullDeepNestedList() {

        let nilValue: Any? = nil
        let result: [Int] = flattenArray([nilValue, [[[nilValue]]], nilValue, nilValue, [[nilValue, nilValue], nilValue], nilValue])
        XCTAssertEqual([], result)
    }

    func testFlattenForStringValuesInSixLevelDeepNestedList() {

        let nilValue: Any? = nil
        let result: [String] = flattenArray(["Zero", "two", [["Two", "three"], "Eight", [["ONE HUNDRED"]], nilValue, [[nilValue]]], "minus two"])
        XCTAssertEqual(["Zero", "two", "Two", "three", "Eight", "ONE HUNDRED", "minus two"], result)

    }

    func testFlattenForDoubleValuesInFiveLevelDeepNestedList() {

        let nilValue: Any? = nil
        let result: [Double] = flattenArray([0.74896463547850123, 2.18, [[nilValue, 3.6], nilValue, 100.0, nilValue, [[[50.2]]]], -2.5])
        XCTAssertEqual([0.74896463547850123, 2.1800000000000002, 3.6000000000000001, 100.0, 50.200000000000003, -2.5], result)

    }

    static var allTests: [(String, (FlattenArrayTests) -> () throws -> Void)] {
        return [
            ("testFlattenIntegerArray", testFlattenIntegerArray),
            ("testFlattenForFiveLevelDeepNestedList", testFlattenForFiveLevelDeepNestedList),
            ("testFlattenForSixLevelDeepNestedList", testFlattenForSixLevelDeepNestedList),
            ("testFlattenForSixLevelDeepNestedListWithNullValues", testFlattenForSixLevelDeepNestedListWithNullValues),
            ("testFlattenForAllNullDeepNestedList", testFlattenForAllNullDeepNestedList),
            ("testFlattenForStringValuesInSixLevelDeepNestedList", testFlattenForStringValuesInSixLevelDeepNestedList),
            ("testFlattenForDoubleValuesInFiveLevelDeepNestedList", testFlattenForDoubleValuesInFiveLevelDeepNestedList),
        ]
    }
}
