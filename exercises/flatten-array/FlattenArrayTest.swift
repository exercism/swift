import XCTest

class FlattenArrayTest: XCTestCase {

    func testFlattenIntegerArray() {

        let result: [Int] = flattenArray(constructList(elements: 1, constructList(elements:2, 3, 4, 5, 6, 7), 8))
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8], result)
    }

    func testFlattenForFiveLevelDeepNestedList() {

        let result: [Int] = flattenArray(constructList(elements: 0, 2, constructList(elements:constructList(elements: 2, 3), 8, 100, 4, constructList(elements: constructList(elements: constructList(elements: 50)))), -2))
        XCTAssertEqual([0, 2, 2, 3, 8, 100, 4, 50, -2], result)
    }

    func testFlattenForSixLevelDeepNestedList() {

        let result: [Int] = flattenArray(constructList(elements: 1, constructList(elements:2, constructList(elements:constructList(elements:3)), constructList(elements: 4, constructList(elements: constructList(elements: constructList(elements:5))), 6, 7)), 8))
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8], result)
    }

    func testFlattenForSixLevelDeepNestedListWithNullValues() {

        let nilValue: Any? = nil
        let result: [Int] = flattenArray(constructList(elements: 0, 2, constructList(elements:constructList(elements:2, 3), 8, constructList(elements:constructList(elements:100)), nilValue, constructList(elements:constructList(elements:nilValue))), -2))
        XCTAssertEqual([0, 2, 2, 3, 8, 100, -2], result)
    }

    func testFlattenForAllNullDeepNestedList() {

        let nilValue: Any? = nil
        let result: [Int] = flattenArray(constructList(elements: nilValue, constructList(elements: constructList(elements:constructList(elements: nilValue))), nilValue, nilValue, constructList(elements:constructList(elements:nilValue, nilValue), nilValue), nilValue))
        XCTAssertEqual([], result)
    }

}
