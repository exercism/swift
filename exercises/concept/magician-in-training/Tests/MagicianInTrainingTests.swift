import XCTest

@testable import MagicianInTraining

let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

class TaskGetCardTests: XCTestCase {
  func testGetFirstCard() {
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(getCard(at: 0, from: stack), 1)
  }

  func testGetMiddleCard() {
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(getCard(at: 2, from: stack), 3)
  }

  func testGetLastCard() {
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(getCard(at: 4, from: stack), 5)
  }
}

class TaskSetCardTests: XCTestCase {
  func testSetFirstCard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(setCard(at: 0, in: stack, to: 10), [10, 2, 3, 4, 5])
  }

  func testSetMiddleCard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(setCard(at: 2, in: stack, to: 10), [1, 2, 10, 4, 5])
  }

  func testSetLastCard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(setCard(at: 4, in: stack, to: 10), [1, 2, 3, 4, 10])
  }

  func testSetCardIndexOutOfBounds() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(setCard(at: 5, in: stack, to: 10), stack)
  }
}

class TaskInsertAtTopTests: XCTestCase {
  func testInsertAtTop() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(insert(10, atTopOf: stack), [1, 2, 3, 4, 5, 10])
  }

  func testInsertAnotherAtTop() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [6, 7, 8, 9, 10]
    XCTAssertEqual(insert(5, atTopOf: stack), [6, 7, 8, 9, 10, 5])
  }

  func testInsertAtTopOfEmptyStack() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [Int]()
    XCTAssertEqual(insert(5, atTopOf: stack), [5])
  }
}

class TaskRemoveCardTests: XCTestCase {
  func testRemoveFirstCard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(removeCard(at: 0, from: stack), [2, 3, 4, 5])
  }

  func testRemoveMiddleCard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(removeCard(at: 2, from: stack), [1, 2, 4, 5])
  }

  func testRemoveLastCard() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(removeCard(at: 4, from: stack), [1, 2, 3, 4])
  }

  func testRemoveCardIndexOutOfBounds() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1, 2, 3, 4, 5]
    XCTAssertEqual(removeCard(at: 5, from: stack), stack)
  }
}

class TaskInsertAtTask: XCTestCase{
  func testInsertAtTask() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1,2,3,4,5]
    XCTAssertEqual(insert(10, at: 2, from: stack), [1,2,10,3,4,5])
  }

  func testInsertAnotherAtTask() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [6,7,8,9,10]
    XCTAssertEqual(insert(5, at: 3, from: stack), [6,7,8,5,9,10])
  }

  func testInsertAtTaskOfEmptyStack() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [Int]()
    XCTAssertEqual(insert(5, at: 0, from: stack), [5])
  }

  func testInsertAtTaskIndexOutOfBounds() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1,2,3,4,5]
    XCTAssertEqual(insert(10, at: 6, from: stack), stack)
  }
}

class TaskCheckSizeOfStackTests: XCTestCase {
  func testCheckSizeOfStackTrue() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1,2,3,4,5]
    XCTAssertTrue(checkSizeOfStack(stack, 5))
  }

  func testCheckSizeOfStackFalse() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let stack = [1,2,3,4,5]
    XCTAssertFalse(checkSizeOfStack(stack, 4))
  }
}
0