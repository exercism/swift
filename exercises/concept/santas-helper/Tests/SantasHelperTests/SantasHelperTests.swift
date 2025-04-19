import Testing
import Foundation

@testable import SantasHelper

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "true"]) ?? false

@Suite struct SantasHelperTests {
  func compareItems(_ items: [(name: String, amount: Int)], _ expected: [(name: String, amount: Int)]) -> Bool {
    if items.count != expected.count {
      return false
    }
    for i in 0..<items.count {
      if items[i].name != expected[i].name || items[i].amount != expected[i].amount {
        return false
      }
    }
    return true
  }

  func compareItemsWithCategory(_ items: [(name: String, amount: Int, category: String)], _ expected: [(name: String, amount: Int, category: String)]) -> Bool {
    if items.count != expected.count {
      return false
    }
    for i in 0..<items.count {
      if items[i].name != expected[i].name || items[i].amount != expected[i].amount || items[i].category != expected[i].category {
        return false
      }
    }
    return true
  }


  @Test("Can get the name of a toy")
  func testGetName() {
    let toy = (name: "Doll", amount: 5)
    #expect(getName(toy) == "Doll")
  }

  @Test("Can get the name of another toy", .enabled(if: RUNALL))
  func testGetName2() {
    let toy = (name: "Train", amount: 3)
    #expect(getName(toy) == "Train")
  }

  @Test("Can create a toy", .enabled(if: RUNALL))
  func testCreateToy() {
    let toy = createToy(name: "Doll", amount: 5)
    #expect(toy == (name: "Doll", amount: 5))
  }

  @Test("Should allow toys to have zero amount", .enabled(if: RUNALL))
  func testCreateToyWithZeroAmount() {
    let toy = createToy(name: "Doll", amount: 0)
    #expect(toy == (name: "Doll", amount: 0))
  }

  @Test("Can update the quantity of a toy", .enabled(if: RUNALL))
  func testUpdateQuantity() {
    let items = [(name: "Doll", amount: 5), (name: "Train", amount: 3)]
    let updatedItems = updateQuantity(items, toy: "Doll", amount: 10)
    let expected = [(name: "Doll", amount: 10), (name: "Train", amount: 3)]
    #expect(compareItems(updatedItems, expected))
  }

  @Test("Can update the quantity of another toy", .enabled(if: RUNALL))
  func testUpdateQuantity2() {
    let items = [(name: "Doll", amount: 5), (name: "Train", amount: 3)]
    let updatedItems = updateQuantity(items, toy: "Train", amount: 5)
    let expected = [(name: "Doll", amount: 5), (name: "Train", amount: 5)]
    #expect(compareItems(updatedItems, expected))
  }

  @Test("If the toy is not found, the list should remain the same", .enabled(if: RUNALL))
  func testUpdateQuantityNotFound() {
    let items = [(name: "Doll", amount: 5), (name: "Train", amount: 3)]
    let updatedItems = updateQuantity(items, toy: "Car", amount: 5)
    let expected = [(name: "Doll", amount: 5), (name: "Train", amount: 3)]
    #expect(compareItems(updatedItems, expected))
  }

  @Test("Can add a category to a toy", .enabled(if: RUNALL))
  func testAddCategory() {
    let items = [(name: "Car", amount: 5), (name: "Train", amount: 3)]
    let updatedItems = addCategory(items, category: "Vehicle")
    let expected = [(name: "Car", amount: 5, "Vehicle"), (name: "Train", amount: 3, "Vehicle")]
    #expect(compareItemsWithCategory(updatedItems, expected))
  }

  @Test("Can add a category to another toy", .enabled(if: RUNALL))
  func testAddCategory2() {
    let items = [(name: "Doll", amount: 5), (name: "Doll house", amount: 3)]
    let updatedItems = addCategory(items, category: "Doll")
    let expected = [(name: "Doll", amount: 5, "Doll"), (name: "Doll house", amount: 3, "Doll")]
    #expect(compareItemsWithCategory(updatedItems, expected))
  }

  @Test("If there are no toys it should do nothing", .enabled(if: RUNALL))
  func testAddCategoryNotFound() {
    let items: [(name: String, amount: Int)] = []
    let updatedItems = addCategory(items, category: "Doll")
    let expected: [(name: String, amount: Int, category: String)] = []
    #expect(compareItemsWithCategory(updatedItems, expected))
  }
}
