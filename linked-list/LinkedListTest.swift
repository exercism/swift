
import XCTest

// Apple Swift version 2.0

// Use Optionals and Generic Classes

class LinkedListTest: XCTestCase {
    
    func testPushPop() {
        let deque = Deque<Int>()
        deque.push(10)
        deque.push(20)
        XCTAssertEqual(20, deque.pop()! )
        XCTAssertEqual(10, deque.pop()! )
    }
    
    func testPushShift() {
        let deque = Deque<Int>()
        deque.push(10)
        deque.push(20)
        XCTAssertEqual(10, deque.shift()! )
        XCTAssertEqual(20, deque.shift()! )
    }
    
    func testUnshiftShift() {
        let deque = Deque<Int>()
        deque.unshift(10)
        deque.unshift(20)
        XCTAssertEqual(20, deque.shift()! )
        XCTAssertEqual(10, deque.shift()! )
    }
    
    func testUnshiftPop() {
        let deque = Deque<Int>()
        deque.unshift(10)
        deque.unshift(20)
        XCTAssertEqual(10, deque.pop()! )
        XCTAssertEqual(20, deque.pop()! )
    }
    
    func testExampleMethodLength() {
        let deque = Deque<Int>()
        deque.push(10)
        deque.push(20)
        XCTAssertEqual(20, deque.pop()! )
        deque.push(30)
        XCTAssertEqual(10, deque.shift()! )
        deque.unshift(40)
        deque.push(50)
        XCTAssertEqual(40, deque.shift()! )
        XCTAssertEqual(50, deque.pop()! )
        XCTAssertEqual(30, deque.shift()! )
    }
    
}
