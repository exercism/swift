import Foundation
import Testing

@testable import ListOps

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ListOpsTests {

  @Test("empty lists")
  func testEmptyLists1() {
    let list = ListOps.append([Int](), [Int]())
    let expected = [Int]()
    #expect(list == expected)
  }

  @Test("list to empty list", .enabled(if: RUNALL))
  func testListToEmptyList1() {
    let list = ListOps.append([Int](), [1, 2, 3, 4])
    let expected = [1, 2, 3, 4]
    #expect(list == expected)
  }

  @Test("empty list to list", .enabled(if: RUNALL))
  func testEmptyListToList1() {
    let list = ListOps.append([1, 2, 3, 4], [Int]())
    let expected = [1, 2, 3, 4]
    #expect(list == expected)
  }

  @Test("non-empty lists", .enabled(if: RUNALL))
  func testNonEmptyLists1() {
    let list = ListOps.append([1, 2], [2, 3, 4, 5])
    let expected = [1, 2, 2, 3, 4, 5]
    #expect(list == expected)
  }

  @Test("empty list", .enabled(if: RUNALL))
  func testEmptyList2() {
    let list = ListOps.concat([[Int]]())
    let expected = [Int]()
    #expect(list == expected)
  }

  @Test("list of lists", .enabled(if: RUNALL))
  func testListOfLists2() {
    let list = ListOps.concat([[1, 2], [3], [], [4, 5, 6]])
    let expected = [1, 2, 3, 4, 5, 6]
    #expect(list == expected)
  }

  @Test("list of nested lists", .enabled(if: RUNALL))
  func testListOfNestedLists2() {
    let list = ListOps.concat([[[1], [2]], [[3]], [[]], [[4, 5, 6]]])
    let expected = [[1], [2], [3], [], [4, 5, 6]]
    #expect(list == expected)
  }

  @Test("empty list", .enabled(if: RUNALL))
  func testEmptyList3() {
    let list = ListOps.filter([Int]()) { $0 % 2 == 1 }
    let expected = [Int]()
    #expect(list == expected)
  }

  @Test("non-empty list", .enabled(if: RUNALL))
  func testNonEmptyList3() {
    let list = ListOps.filter([1, 2, 3, 5]) { $0 % 2 == 1 }
    let expected = [1, 3, 5]
    #expect(list == expected)
  }

  @Test("empty list", .enabled(if: RUNALL))
  func testEmptyList4() {
    let length = ListOps.length([])
    let expected = 0
    #expect(length == expected)
  }

  @Test("non-empty list", .enabled(if: RUNALL))
  func testNonEmptyList4() {
    let length = ListOps.length([1, 2, 3, 4])
    let expected = 4
    #expect(length == expected)
  }

  @Test("empty list", .enabled(if: RUNALL))
  func testEmptyList5() {
    let list = ListOps.map([Int]()) { $0 + 1 }
    let expected = [Int]()
    #expect(list == expected)
  }

  @Test("non-empty list", .enabled(if: RUNALL))
  func testNonEmptyList5() {
    let list = ListOps.map([1, 3, 5, 7]) { $0 + 1 }
    let expected = [2, 4, 6, 8]
    #expect(list == expected)
  }

  @Test("empty list", .enabled(if: RUNALL))
  func testEmptyList6() {
    let value = ListOps.foldLeft([], accumulated: 2.0) { $0 * $1 }
    let expected = 2.0
    #expect(value == expected)
  }

  @Test("direction independent function applied to non-empty list", .enabled(if: RUNALL))
  func testDirectionIndependentFunctionAppliedToNonEmptyList6() {
    let value = ListOps.foldLeft([1, 2, 3, 4], accumulated: 5.0) { $0 + $1 }
    let expected = 15.0
    #expect(value == expected)
  }

  @Test("direction dependent function applied to non-empty list", .enabled(if: RUNALL))
  func testDirectionDependentFunctionAppliedToNonEmptyList6() {
    let value = ListOps.foldLeft([1, 2, 3, 4], accumulated: 24.0) { $0 / $1 }
    let expected = 1.0
    #expect(value == expected)
  }

  @Test("empty list", .enabled(if: RUNALL))
  func testEmptyList7() {
    let value = ListOps.foldRight([], accumulated: 2.0) { $0 * $1 }
    let expected = 2.0
    #expect(value == expected)
  }

  @Test("direction independent function applied to non-empty list", .enabled(if: RUNALL))
  func testDirectionIndependentFunctionAppliedToNonEmptyList7() {
    let value = ListOps.foldRight([1, 2, 3, 4], accumulated: 5.0) { $0 + $1 }
    let expected = 15.0
    #expect(value == expected)
  }

  @Test("direction dependent function applied to non-empty list", .enabled(if: RUNALL))
  func testDirectionDependentFunctionAppliedToNonEmptyList7() {
    let value = ListOps.foldRight([1, 2, 3, 4], accumulated: 24.0) { $0 / $1 }
    let expected = 9.0
    #expect(value == expected)
  }

  @Test("empty list", .enabled(if: RUNALL))
  func testEmptyList8() {
    let list = ListOps.reverse([Int]())
    let expected = [Int]()
    #expect(list == expected)
  }

  @Test("non-empty list", .enabled(if: RUNALL))
  func testNonEmptyList8() {
    let list = ListOps.reverse([1, 3, 5, 7])
    let expected = [7, 5, 3, 1]
    #expect(list == expected)
  }

  @Test("list of lists is not flattened", .enabled(if: RUNALL))
  func testListOfListsIsNotFlattened8() {
    let list = ListOps.reverse([[1, 2], [3], [], [4, 5, 6]])
    let expected = [[4, 5, 6], [], [3], [1, 2]]
    #expect(list == expected)
  }
}
