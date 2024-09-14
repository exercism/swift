import XCTest

@testable import Knapsack

class KnapsackTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testNoItems() {

    let items: [Item] = []
    XCTAssertEqual(Knapsack.maximumValue(items, 100), 0)
  }

  func testOneItemTooHeavy() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test

    let items: [Item] = [
      Item(weight: 100, value: 1)
    ]
    XCTAssertEqual(Knapsack.maximumValue(items, 10), 0)
  }

  func testFiveItemsCannotBeGreedyByWeight() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test

    let items: [Item] = [
      Item(weight: 2, value: 5),
      Item(weight: 2, value: 5),
      Item(weight: 2, value: 5),
      Item(weight: 2, value: 5),
      Item(weight: 10, value: 21),
    ]
    XCTAssertEqual(Knapsack.maximumValue(items, 10), 21)
  }

  func testFiveItemsCannotBeGreedyByValue() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test

    let items: [Item] = [
      Item(weight: 2, value: 20),
      Item(weight: 2, value: 20),
      Item(weight: 2, value: 20),
      Item(weight: 2, value: 20),
      Item(weight: 10, value: 50),
    ]
    XCTAssertEqual(Knapsack.maximumValue(items, 10), 80)
  }

  func testExampleKnapsack() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test

    let items: [Item] = [
      Item(weight: 5, value: 10),
      Item(weight: 4, value: 40),
      Item(weight: 6, value: 30),
      Item(weight: 4, value: 50),
    ]
    XCTAssertEqual(Knapsack.maximumValue(items, 10), 90)
  }

  func test8Items() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test

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
    XCTAssertEqual(Knapsack.maximumValue(items, 104), 900)
  }

  func test15Items() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test

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
    XCTAssertEqual(Knapsack.maximumValue(items, 750), 1458)
  }
}
