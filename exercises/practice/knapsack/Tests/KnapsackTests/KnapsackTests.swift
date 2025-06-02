import Foundation
import Testing

@testable import Knapsack

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct KnapsackTests {

  @Test("no items")
  func testNoItems() {
    let items: [Item] = []
    #expect(Knapsack.maximumValue(items, 100) == 0)
  }

  @Test("one item, too heavy", .enabled(if: RUNALL))
  func testOneItemTooHeavy() {
    let items: [Item] = [
      Item(weight: 100, value: 1)
    ]
    #expect(Knapsack.maximumValue(items, 10) == 0)
  }

  @Test("five items (cannot be greedy by weight)", .enabled(if: RUNALL))
  func testFiveItemsCannotBeGreedyByWeight() {
    let items: [Item] = [
      Item(weight: 2, value: 5),
      Item(weight: 2, value: 5),
      Item(weight: 2, value: 5),
      Item(weight: 2, value: 5),
      Item(weight: 10, value: 21),
    ]
    #expect(Knapsack.maximumValue(items, 10) == 21)
  }

  @Test("five items (cannot be greedy by value)", .enabled(if: RUNALL))
  func testFiveItemsCannotBeGreedyByValue() {
    let items: [Item] = [
      Item(weight: 2, value: 20),
      Item(weight: 2, value: 20),
      Item(weight: 2, value: 20),
      Item(weight: 2, value: 20),
      Item(weight: 10, value: 50),
    ]
    #expect(Knapsack.maximumValue(items, 10) == 80)
  }

  @Test("example knapsack", .enabled(if: RUNALL))
  func testExampleKnapsack() {
    let items: [Item] = [
      Item(weight: 5, value: 10),
      Item(weight: 4, value: 40),
      Item(weight: 6, value: 30),
      Item(weight: 4, value: 50),
    ]
    #expect(Knapsack.maximumValue(items, 10) == 90)
  }

  @Test("8 items", .enabled(if: RUNALL))
  func test8Items() {
    let items: [Item] = [
      Item(weight: 25, value: 350),
      Item(weight: 35, value: 400),
      Item(weight: 45, value: 450),
      Item(weight: 5, value: 20),
      Item(weight: 25, value: 70),
      Item(weight: 3, value: 8),
      Item(weight: 2, value: 5),
      Item(weight: 2, value: 5),
    ]
    #expect(Knapsack.maximumValue(items, 104) == 900)
  }

  @Test("15 items", .enabled(if: RUNALL))
  func test15Items() {
    let items: [Item] = [
      Item(weight: 70, value: 135),
      Item(weight: 73, value: 139),
      Item(weight: 77, value: 149),
      Item(weight: 80, value: 150),
      Item(weight: 82, value: 156),
      Item(weight: 87, value: 163),
      Item(weight: 90, value: 173),
      Item(weight: 94, value: 184),
      Item(weight: 98, value: 192),
      Item(weight: 106, value: 201),
      Item(weight: 110, value: 210),
      Item(weight: 113, value: 214),
      Item(weight: 115, value: 221),
      Item(weight: 118, value: 229),
      Item(weight: 120, value: 240),
    ]
    #expect(Knapsack.maximumValue(items, 750) == 1458)
  }
}
