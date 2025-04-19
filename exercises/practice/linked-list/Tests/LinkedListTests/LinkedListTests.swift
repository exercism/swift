import Foundation
import Testing

@testable import LinkedList

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct LinkedListTests {

  @Test("pop gets element from the list")
  func testPopGetsElementFromTheList() {
    let deque = Deque<Int>()
    deque.push(7)
    #expect(deque.pop() == 7)
  }

  @Test("push/pop respectively add/remove at the end of the list", .enabled(if: RUNALL))
  func testPushpopRespectivelyAddremoveAtTheEndOfTheList() {
    let deque = Deque<Int>()
    deque.push(11)
    deque.push(13)
    #expect(deque.pop() == 13)
    #expect(deque.pop() == 11)
  }

  @Test("shift gets an element from the list", .enabled(if: RUNALL))
  func testShiftGetsAnElementFromTheList() {
    let deque = Deque<Int>()
    deque.push(17)
    #expect(deque.shift() == 17)
  }

  @Test("shift gets first element from the list", .enabled(if: RUNALL))
  func testShiftGetsFirstElementFromTheList() {
    let deque = Deque<Int>()
    deque.push(23)
    deque.push(5)
    #expect(deque.shift() == 23)
    #expect(deque.shift() == 5)
  }

  @Test("unshift adds element at start of the list", .enabled(if: RUNALL))
  func testUnshiftAddsElementAtStartOfTheList() {
    let deque = Deque<Int>()
    deque.unshift(23)
    deque.unshift(5)
    #expect(deque.shift() == 5)
    #expect(deque.shift() == 23)
  }

  @Test("pop, push, shift, and unshift can be used in any order", .enabled(if: RUNALL))
  func testPopPushShiftAndUnshiftCanBeUsedInAnyOrder() {
    let deque = Deque<Int>()
    deque.push(1)
    deque.push(2)
    #expect(deque.pop() == 2)
    deque.push(3)
    #expect(deque.shift() == 1)
    deque.unshift(4)
    deque.push(5)
    #expect(deque.shift() == 4)
    #expect(deque.pop() == 5)
    #expect(deque.shift() == 3)
  }

  @Test("count an empty list", .enabled(if: RUNALL))
  func testCountAnEmptyList() {
    let deque = Deque<Int>()
    #expect(deque.count == 0)
  }

  @Test("count a list with items", .enabled(if: RUNALL))
  func testCountAListWithItems() {
    let deque = Deque<Int>()
    deque.push(37)
    deque.push(1)
    #expect(deque.count == 2)
  }

  @Test("count is correct after mutation", .enabled(if: RUNALL))
  func testCountIsCorrectAfterMutation() {
    let deque = Deque<Int>()
    deque.push(31)
    #expect(deque.count == 1)
    deque.unshift(43)
    #expect(deque.count == 2)
    deque.shift()
    #expect(deque.count == 1)
    deque.pop()
    #expect(deque.count == 0)
  }

  @Test("popping to empty doesn't break the list", .enabled(if: RUNALL))
  func testPoppingToEmptyDoesntBreakTheList() {
    let deque = Deque<Int>()
    deque.push(41)
    deque.push(59)
    deque.pop()
    deque.pop()
    deque.push(47)
    #expect(deque.count == 1)
    #expect(deque.pop() == 47)
  }

  @Test("shifting to empty doesn't break the list", .enabled(if: RUNALL))
  func testShiftingToEmptyDoesntBreakTheList() {
    let deque = Deque<Int>()
    deque.push(41)
    deque.push(59)
    deque.shift()
    deque.shift()
    deque.push(47)
    #expect(deque.count == 1)
    #expect(deque.shift() == 47)
  }

  @Test("deletes the only element", .enabled(if: RUNALL))
  func testDeletesTheOnlyElement() {
    let deque = Deque<Int>()
    deque.push(61)
    deque.delete(61)
    #expect(deque.count == 0)
  }

  @Test("deletes the element with the specified value from the list", .enabled(if: RUNALL))
  func testDeletesTheElementWithTheSpecifiedValueFromTheList() {
    let deque = Deque<Int>()
    deque.push(71)
    deque.push(83)
    deque.push(79)
    deque.delete(83)
    #expect(deque.count == 2)
    #expect(deque.pop() == 79)
    #expect(deque.shift() == 71)
  }

  @Test(
    "deletes the element with the specified value from the list, re-assigns tail",
    .enabled(if: RUNALL))
  func testDeletesTheElementWithTheSpecifiedValueFromTheListReAssignsTail() {
    let deque = Deque<Int>()
    deque.push(71)
    deque.push(83)
    deque.push(79)
    deque.delete(83)
    #expect(deque.count == 2)
    #expect(deque.pop() == 79)
    #expect(deque.pop() == 71)
  }

  @Test(
    "deletes the element with the specified value from the list, re-assigns head",
    .enabled(if: RUNALL))
  func testDeletesTheElementWithTheSpecifiedValueFromTheListReAssignsHead() {
    let deque = Deque<Int>()
    deque.push(71)
    deque.push(83)
    deque.push(79)
    deque.delete(83)
    #expect(deque.count == 2)
    #expect(deque.shift() == 71)
    #expect(deque.shift() == 79)
  }

  @Test("deletes the first of two elements", .enabled(if: RUNALL))
  func testDeletesTheFirstOfTwoElements() {
    let deque = Deque<Int>()
    deque.push(97)
    deque.push(101)
    deque.delete(97)
    #expect(deque.count == 1)
    #expect(deque.pop() == 101)
  }

  @Test("deletes the second of two elements", .enabled(if: RUNALL))
  func testDeletesTheSecondOfTwoElements() {
    let deque = Deque<Int>()
    deque.push(97)
    deque.push(101)
    deque.delete(101)
    #expect(deque.count == 1)
    #expect(deque.pop() == 97)
  }

  @Test("delete does not modify the list if the element is not found", .enabled(if: RUNALL))
  func testDeleteDoesNotModifyTheListIfTheElementIsNotFound() {
    let deque = Deque<Int>()
    deque.push(89)
    deque.delete(103)
    #expect(deque.count == 1)
  }

  @Test("deletes only the first occurrence", .enabled(if: RUNALL))
  func testDeletesOnlyTheFirstOccurrence() {
    let deque = Deque<Int>()
    deque.push(73)
    deque.push(9)
    deque.push(9)
    deque.push(107)
    deque.delete(9)
    #expect(deque.count == 3)
    #expect(deque.pop() == 107)
    #expect(deque.pop() == 9)
    #expect(deque.pop() == 73)
  }
}
