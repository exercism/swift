import Foundation
import Testing

@testable import SimpleLinkedList

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SimpleLinkedListTests {
  @Test("Test if the constructor works correctly")
  func testConstructorA() {
    let one = Element(1, nil)
    let two = Element(2, one)
    #expect(1 == one.value!)
    #expect(one.next == nil)
    #expect(2 == two.value!)
  }

  @Test("Test if same value can be retrieved from the element", .enabled(if: RUNALL))
  func testConstructorB() {
    let one = Element(1, nil)
    let two = Element(2, one)
    let result = one.value
    let result2 = two.next?.value
    #expect(result! == result2!)
  }

  @Test("Test if the next element can be retrieved from the element", .enabled(if: RUNALL))
  func testToA() {
    let elementNil = Element<Int>()
    let elementOne = Element(1, nil)
    let elementTwo = Element(2, elementOne)
    let elementThree = Element(3, elementTwo)
    #expect([] == elementNil.toArray())
    #expect([1] == elementOne.toArray())
    #expect([2, 1] == elementTwo.toArray())
    #expect([3, 2, 1] == elementThree.toArray())
  }

  @Test("Test if reverse with size 1 is the same", .enabled(if: RUNALL))
  func testReverseOne() {
    let one = Element(1, nil)
    let oneR = one.reverseElements()
    #expect(1 == oneR.value!)
    #expect(oneR.next?.value == nil)

  }

  @Test("Test if reverse with size 2 is correct", .enabled(if: RUNALL))
  func testReverseTwo() {
    let one = Element(1, nil)
    let two = Element(2, one)
    let twoR = two.reverseElements()
    #expect(1 == twoR.value!)
    let expect = twoR.next?.value
    #expect(2 == expect!)
  }

  @Test("Test if a linked list can be created from an array", .enabled(if: RUNALL))
  func testFromAOne() {
    #expect(Element<Int>.fromArray([]).value == nil)
    let oneA = Element.fromArray([1])
    #expect(1 == oneA.value!)
    #expect(oneA.next?.value == nil)

  }

  @Test(
    "Test if a linked list can be created from an array with two elements", .enabled(if: RUNALL)
  )
  func testFromATwo() {
    let twoA = Element.fromArray([2, 1])
    #expect(2 == twoA.value!)
    let expected = twoA.next?.value
    #expect(1 == expected!)
    #expect(twoA.next?.next?.value == nil)
  }

  @Test(
    "Test if a linked list can be created from an array with ten elements", .enabled(if: RUNALL)
  )
  func testFromATen() {
    let oneToTen = Element.fromArray(Array(1...10))
    let expected10 = oneToTen.next?.next?.next?.next?.next?.next?.next?.next?.next?.value
    #expect(10 == expected10!)
  }

  @Test(
    "Test if a linked list can be created from an array and then converted back to an array",
    .enabled(if: RUNALL))
  func testRoundtrip() {
    #expect([1] == Element.fromArray([1]).toArray())
    #expect([2, 1] == Element.fromArray([2, 1]).toArray())
    #expect(Array(1...10) == Element.fromArray(Array(1...10)).toArray())
  }
}
