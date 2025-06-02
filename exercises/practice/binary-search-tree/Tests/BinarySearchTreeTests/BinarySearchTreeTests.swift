import Foundation
import Testing

@testable import BinarySearchTree

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL"] ?? "fa,se") ?? false

@Suite struct BinarySearchTreeTests {

  @Test("Data is retained")
  func testDataIsRetained() {
    #expect(4 == BinarySearchTree(4).data)
  }

  @Test("Inserting less", .enabled(if: RUNALL))
  func testInsertingLess() {
    var four = BinarySearchTree(4)
    four.insert(2)
    #expect(4 == four.data)
    #expect(2 == four.left?.data)
  }

  @Test("Inserting same", .enabled(if: RUNALL))
  func testInsertingSame() {
    var four = BinarySearchTree(4)
    four.insert(4)
    #expect(4 == four.data)
    #expect(4 == four.left?.data)
  }

  @Test("Inserting right", .enabled(if: RUNALL))
  func testInsertingRight() {
    var four = BinarySearchTree(4)
    four.insert(5)
    #expect(4 == four.data)
    #expect(5 == four.right?.data)
  }

  @Test("Complex tree", .enabled(if: RUNALL))
  func testComplexTree() {
    var four = BinarySearchTree(4)
    four.insert(2)
    four.insert(6)
    four.insert(1)
    four.insert(3)
    four.insert(7)
    four.insert(5)
    #expect(4 == four.data)
    #expect(2 == four.left?.data)
    #expect(1 == four.left?.left?.data)
    #expect(3 == four.left?.right?.data)
    #expect(6 == four.right?.data)
    #expect(5 == four.right?.left?.data)
    #expect(7 == four.right?.right?.data)
  }

  @Test("All data for one element", .enabled(if: RUNALL))
  func testAllDataForOneElement() {
    #expect([4] == BinarySearchTree(4).allData())
  }

  @Test("All data for smaller element", .enabled(if: RUNALL))
  func testAllDataForSmallerElement() {
    var four = BinarySearchTree(4)
    four.insert(2)
    #expect([2, 4] == four.allData())
  }

  @Test("All data for larger element", .enabled(if: RUNALL))
  func testAllDataForLargerElement() {
    var four = BinarySearchTree(4)
    four.insert(5)
    #expect([4, 5] == four.allData())
  }

  @Test("All data for complex tree", .enabled(if: RUNALL))
  func testAllDataForComplexTree() {
    var four = BinarySearchTree(4)
    four.insert(2)
    four.insert(1)
    four.insert(3)
    four.insert(6)
    four.insert(7)
    four.insert(5)
    #expect([1, 2, 3, 4, 5, 6, 7] == four.allData())
  }
}
