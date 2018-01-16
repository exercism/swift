import XCTest
@testable import SimpleMinHeap

class SimpleMinHeapTests: XCTestCase {
    func testSingleRoot() {
        var heap = SimpleMinHeap<Int>()
        heap.push(4)
        XCTAssertEqual(4, heap.pop())
    }

    func testMultiplePush() {
        var heap = SimpleMinHeap<Int>()
        heap.push(4)
        heap.push(1)
        heap.push(7)
        heap.push(9)
        heap.push(2)
        XCTAssertEqual(heap.arrayView(), [1, 2, 7, 9, 4])
    }

    func testMultiplePushAndPop() {
        var heap = SimpleMinHeap<Int>()
        heap.push(4)
        heap.push(1)
        heap.push(7)
        heap.push(9)
        heap.push(2)
        XCTAssertEqual(heap.arrayView(), [1, 2, 7, 9, 4])
        XCTAssertEqual(1, heap.pop())
        XCTAssertEqual(heap.arrayView(), [2, 4, 7, 9])
        XCTAssertEqual(2, heap.pop())
        XCTAssertEqual(heap.arrayView(), [4, 9, 7])
    }

    func testMultipleValues() {
        var heap = SimpleMinHeap<Int>()
        heap.push(4)
        heap.push(1)
        heap.push(20)
        heap.push(7)
        heap.push(9)
        heap.push(2)
        XCTAssertEqual(1, heap.pop())
        XCTAssertEqual(2, heap.pop())
        XCTAssertEqual(4, heap.pop())
        XCTAssertEqual(7, heap.pop())
        XCTAssertEqual(9, heap.pop())
        XCTAssertEqual(20, heap.pop())
    }

    func testMultipleStringValues() {
        var heap = SimpleMinHeap<String>()
        heap.push("Z")
        heap.push("C")
        heap.push("M")
        heap.push("A")
        heap.push("B")
        heap.push("D")

        XCTAssertEqual("A", heap.pop())
        XCTAssertEqual("B", heap.pop())
        XCTAssertEqual("C", heap.pop())
        XCTAssertEqual("D", heap.pop())
        XCTAssertEqual("M", heap.pop())
        XCTAssertEqual("Z", heap.pop())
    }

    func testHeapify() {
        var heap = SimpleMinHeap<String>()
        heap.heapify(["Z", "C", "M", "A", "B", "D"])
        XCTAssertEqual("A", heap.pop())
        XCTAssertEqual("B", heap.pop())
        XCTAssertEqual("C", heap.pop())
        XCTAssertEqual("D", heap.pop())
        XCTAssertEqual("M", heap.pop())
        XCTAssertEqual("Z", heap.pop())
    }

    static var allTests = [
        ("testEmpty", testSingleRoot),
        ("testMultiplePush", testMultiplePush),
        ("testMultipleValues", testMultipleValues),
        ("testMultiplePushAndPop", testMultiplePushAndPop),
        ("testMultipleStringValues", testMultipleStringValues),
        ("testHeapify", testHeapify)
    ]
}
