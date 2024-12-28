import Testing
import Foundation

@testable import MagicianInTraining

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "true"]) ?? false

@Suite struct MagicianInTrainingTest {
  @Test("Can get the first card")
  func testGetFirstCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(getCard(at: 0, from: stack) == 1)
  }

  @Test("Can get a middle card", .enabled(if: RUNALL))
  func testGetMiddleCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(getCard(at: 2, from: stack) == 3)
  }

  @Test("Can get the last card", .enabled(if: RUNALL))
  func testGetLastCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(getCard(at: 4, from: stack) == 5)
  }

  @Test("Can set the first card", .enabled(if: RUNALL))
  func testSetFirstCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(setCard(at: 0, in: stack, to: 10) == [10, 2, 3, 4, 5])
  }

  @Test("Can set a middle card", .enabled(if: RUNALL))
  func testSetMiddleCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(setCard(at: 2, in: stack, to: 10) == [1, 2, 10, 4, 5])
  }

  @Test("Can set the last card", .enabled(if: RUNALL))
  func testSetLastCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(setCard(at: 4, in: stack, to: 10) == [1, 2, 3, 4, 10])
  }

  @Test("Cannot set a card index out of bounds", .enabled(if: RUNALL))
  func testSetCardIndexOutOfBounds() {
    let stack = [1, 2, 3, 4, 5]
    #expect(setCard(at: 5, in: stack, to: 10) == stack)
  }

  @Test("Can insert a card at the top", .enabled(if: RUNALL))
  func testInsertAtTop() {
    let stack = [1, 2, 3, 4, 5]
    #expect(insert(10, atTopOf: stack) == [1, 2, 3, 4, 5, 10])
  }

  @Test("Can insert another card at the top", .enabled(if: RUNALL))
  func testInsertAnotherAtTop() {
    let stack = [6, 7, 8, 9, 10]
    #expect(insert(5, atTopOf: stack) == [6, 7, 8, 9, 10, 5])
  }

  @Test("Can insert a card at the top of an empty stack", .enabled(if: RUNALL))
  func testInsertAtTopOfEmptyStack() {
    let stack = [Int]()
    #expect(insert(5, atTopOf: stack) == [5])
  }

  @Test("Can remove the first card", .enabled(if: RUNALL))
  func testRemoveFirstCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(removeCard(at: 0, from: stack) == [2, 3, 4, 5])
  }

  @Test("Can remove a middle card", .enabled(if: RUNALL))
  func testRemoveMiddleCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(removeCard(at: 2, from: stack) == [1, 2, 4, 5])
  }

  @Test("Can remove the last card", .enabled(if: RUNALL))
  func testRemoveLastCard() {
    let stack = [1, 2, 3, 4, 5]
    #expect(removeCard(at: 4, from: stack) == [1, 2, 3, 4])
  }

  @Test("Cannot remove a card index out of bounds", .enabled(if: RUNALL))
  func testRemoveCardIndexOutOfBounds() {
    let stack = [1, 2, 3, 4, 5]
    #expect(removeCard(at: 5, from: stack) == stack)
  }

  @Test("Can insert a card at a specific index", .enabled(if: RUNALL))
  func testInsertAt() {
    let stack = [1, 2, 3, 4, 5]
    #expect(insert(10, at: 2, from: stack) == [1, 2, 10, 3, 4, 5])
  }

  @Test("Can insert another card at a specific index", .enabled(if: RUNALL))
  func testInsertAnotherAt() {
    let stack = [6, 7, 8, 9, 10]
    #expect(insert(5, at: 3, from: stack) == [6, 7, 8, 5, 9, 10])
  }

  @Test("Can insert a card at a specific index of an empty stack", .enabled(if: RUNALL))
  func testInsertAtOfEmptyStack() {
    let stack = [Int]()
    #expect(insert(5, at: 0, from: stack) == [5])
  }

  @Test("Cannot insert a card at an index out of bounds", .enabled(if: RUNALL))
  func testInsertAtIndexOutOfBounds() {
    let stack = [1, 2, 3, 4, 5]
    #expect(insert(10, at: 6, from: stack) == stack)
  }

  @Test("Can check the size of a stack", .enabled(if: RUNALL))
  func testCheckSizeOfStackTrue() {
    let stack = [1, 2, 3, 4, 5]
    #expect(checkSizeOfStack(stack, 5) == true)
  }

  @Test("Can check the size of a stack", .enabled(if: RUNALL))
  func testCheckSizeOfStackFalse() {
    let stack = [1, 2, 3, 4, 5]
    #expect(checkSizeOfStack(stack, 4) == false)
  }
}
