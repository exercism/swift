#if swift(>=3.0)
    import XCTest
#endif

class LinkedListTest: XCTestCase {

    func testPushPop() {
        let deque = Deque<Int>()
        deque.push(10)
        deque.push(20)
        XCTAssertEqual(20, deque.pop() ?? 0 )
        XCTAssertEqual(10, deque.pop() ?? 0 )
    }

    func testPushShift() {
        let deque = Deque<Int>()
        deque.push(10)
        deque.push(20)
        XCTAssertEqual(10, deque.shift() ?? 0 )
        XCTAssertEqual(20, deque.shift() ?? 0 )
    }

    func testUnshiftShift() {
        let deque = Deque<Int>()
        deque.unshift(10)
        deque.unshift(20)
        XCTAssertEqual(20, deque.shift() ?? 0 )
        XCTAssertEqual(10, deque.shift() ?? 0 )
    }

    func testUnshiftPop() {
        let deque = Deque<Int>()
        deque.unshift(10)
        deque.unshift(20)
        XCTAssertEqual(10, deque.pop() ?? 0 )
        XCTAssertEqual(20, deque.pop() ?? 0 )
    }

    func testExampleMethodLength() {
        let deque = Deque<Int>()
        deque.push(10)
        deque.push(20)
        XCTAssertEqual(20, deque.pop() ?? 0 )
        deque.push(30)
        XCTAssertEqual(10, deque.shift() ?? 0 )
        deque.unshift(40)
        deque.push(50)
        XCTAssertEqual(40, deque.shift() ?? 0 )
        XCTAssertEqual(50, deque.pop() ?? 0 )
        XCTAssertEqual(30, deque.shift() ?? 0 )
    }

}
