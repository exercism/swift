import XCTest



class BinarySearchTreeTest: XCTestCase {
    
    func testDataIsRetained() {
        XCTAssertEqual(4, BinarySearchTree(4).data)
    }
    
    func testInsertingLess() {
        let four = BinarySearchTree(4)
        four.insert(2)
        XCTAssertEqual(4, four.data)
        XCTAssertEqual(2, four.left?.data)
    }
    
    func testInsertingSame() {
        let four = BinarySearchTree(4)
        four.insert(4)
        XCTAssertEqual(4, four.data)
        XCTAssertEqual(4, four.left?.data)
    }
    
    func testInsertingRight() {
        let four = BinarySearchTree(4)
        four.insert(5)
        XCTAssertEqual(4, four.data)
        XCTAssertEqual(5, four.right?.data)
    }
    
    func testComplexTree() {
        let four = BinarySearchTree(4)
        four.insert(2)
        four.insert(6)
        four.insert(1)
        four.insert(3)
        four.insert(7)
        four.insert(5)
        XCTAssertEqual(4, four.data)
        XCTAssertEqual(2, four.left?.data)
        XCTAssertEqual(1, four.left?.left?.data)
        XCTAssertEqual(3, four.left?.right?.data)
        XCTAssertEqual(6, four.right?.data)
        XCTAssertEqual(5, four.right?.left?.data)
        XCTAssertEqual(7, four.right?.right?.data)
    }
    
    func testAllDataForOneElement() {
        XCTAssertEqual([4], BinarySearchTree(4).allData())
    }
    
    func testAllDataForSmallerElement() {
        let four = BinarySearchTree(4)
        four.insert(2)
        XCTAssertEqual([2, 4], four.allData())
    }
    
    func testAllDataForLargerElement() {
        let four = BinarySearchTree(4)
        four.insert(5)
        XCTAssertEqual([4, 5], four.allData())
    }

    func testAllDataForComplexTree() {
        let four = BinarySearchTree(4)
        four.insert(2)
        four.insert(1)
        four.insert(3)
        four.insert(6)
        four.insert(7)
        four.insert(5)
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7], four.allData())
    }
    
}
