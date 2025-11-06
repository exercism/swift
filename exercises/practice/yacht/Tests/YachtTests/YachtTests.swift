import Foundation
import Testing

@testable import Yacht

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct YachtTests {

  @Test("Yacht")
  func testYacht() {
    #expect(score([5, 5, 5, 5, 5], category: category("yacht")) == 50)
  }

  @Test("Not Yacht", .enabled(if: RUNALL))
  func testNotYacht() {
    #expect(score([1, 3, 3, 2, 5], category: category("yacht")) == 0)
  }

  @Test("Ones", .enabled(if: RUNALL))
  func testOnes() {
    #expect(score([1, 1, 1, 3, 5], category: category("ones")) == 3)
  }

  @Test("Ones, out of order", .enabled(if: RUNALL))
  func testOnesOutOfOrder() {
    #expect(score([3, 1, 1, 5, 1], category: category("ones")) == 3)
  }

  @Test("No ones", .enabled(if: RUNALL))
  func testNoOnes() {
    #expect(score([4, 3, 6, 5, 5], category: category("ones")) == 0)
  }

  @Test("Twos", .enabled(if: RUNALL))
  func testTwos() {
    #expect(score([2, 3, 4, 5, 6], category: category("twos")) == 2)
  }

  @Test("Fours", .enabled(if: RUNALL))
  func testFours() {
    #expect(score([1, 4, 1, 4, 1], category: category("fours")) == 8)
  }

  @Test("Yacht counted as threes", .enabled(if: RUNALL))
  func testYachtCountedAsThrees() {
    #expect(score([3, 3, 3, 3, 3], category: category("threes")) == 15)
  }

  @Test("Yacht of 3s counted as fives", .enabled(if: RUNALL))
  func testYachtOf3SCountedAsFives() {
    #expect(score([3, 3, 3, 3, 3], category: category("fives")) == 0)
  }

  @Test("Fives", .enabled(if: RUNALL))
  func testFives() {
    #expect(score([1, 5, 3, 5, 3], category: category("fives")) == 10)
  }

  @Test("Sixes", .enabled(if: RUNALL))
  func testSixes() {
    #expect(score([2, 3, 4, 5, 6], category: category("sixes")) == 6)
  }

  @Test("Full house two small, three big", .enabled(if: RUNALL))
  func testFullHouseTwoSmallThreeBig() {
    #expect(score([2, 2, 4, 4, 4], category: category("full house")) == 16)
  }

  @Test("Full house three small, two big", .enabled(if: RUNALL))
  func testFullHouseThreeSmallTwoBig() {
    #expect(score([5, 3, 3, 5, 3], category: category("full house")) == 19)
  }

  @Test("Two pair is not a full house", .enabled(if: RUNALL))
  func testTwoPairIsNotAFullHouse() {
    #expect(score([2, 2, 4, 4, 5], category: category("full house")) == 0)
  }

  @Test("Four of a kind is not a full house", .enabled(if: RUNALL))
  func testFourOfAKindIsNotAFullHouse() {
    #expect(score([1, 4, 4, 4, 4], category: category("full house")) == 0)
  }

  @Test("Yacht is not a full house", .enabled(if: RUNALL))
  func testYachtIsNotAFullHouse() {
    #expect(score([2, 2, 2, 2, 2], category: category("full house")) == 0)
  }

  @Test("Four of a Kind", .enabled(if: RUNALL))
  func testFourOfAKind() {
    #expect(score([6, 6, 4, 6, 6], category: category("four of a kind")) == 24)
  }

  @Test("Yacht can be scored as Four of a Kind", .enabled(if: RUNALL))
  func testYachtCanBeScoredAsFourOfAKind() {
    #expect(score([3, 3, 3, 3, 3], category: category("four of a kind")) == 12)
  }

  @Test("Full house is not Four of a Kind", .enabled(if: RUNALL))
  func testFullHouseIsNotFourOfAKind() {
    #expect(score([3, 3, 3, 5, 5], category: category("four of a kind")) == 0)
  }

  @Test("Little Straight", .enabled(if: RUNALL))
  func testLittleStraight() {
    #expect(score([3, 5, 4, 1, 2], category: category("little straight")) == 30)
  }

  @Test("Little Straight as Big Straight", .enabled(if: RUNALL))
  func testLittleStraightAsBigStraight() {
    #expect(score([1, 2, 3, 4, 5], category: category("big straight")) == 0)
  }

  @Test("Four in order but not a little straight", .enabled(if: RUNALL))
  func testFourInOrderButNotALittleStraight() {
    #expect(score([1, 1, 2, 3, 4], category: category("little straight")) == 0)
  }

  @Test("No pairs but not a little straight", .enabled(if: RUNALL))
  func testNoPairsButNotALittleStraight() {
    #expect(score([1, 2, 3, 4, 6], category: category("little straight")) == 0)
  }

  @Test("Minimum is 1, maximum is 5, but not a little straight", .enabled(if: RUNALL))
  func testMinimumIs1MaximumIs5ButNotALittleStraight() {
    #expect(score([1, 1, 3, 4, 5], category: category("little straight")) == 0)
  }

  @Test("Big Straight", .enabled(if: RUNALL))
  func testBigStraight() {
    #expect(score([4, 6, 2, 5, 3], category: category("big straight")) == 30)
  }

  @Test("Big Straight as little straight", .enabled(if: RUNALL))
  func testBigStraightAsLittleStraight() {
    #expect(score([6, 5, 4, 3, 2], category: category("little straight")) == 0)
  }

  @Test("No pairs but not a big straight", .enabled(if: RUNALL))
  func testNoPairsButNotABigStraight() {
    #expect(score([6, 5, 4, 3, 1], category: category("big straight")) == 0)
  }

  @Test("Choice", .enabled(if: RUNALL))
  func testChoice() {
    #expect(score([3, 3, 5, 6, 6], category: category("choice")) == 23)
  }

  @Test("Yacht as choice", .enabled(if: RUNALL))
  func testYachtAsChoice() {
    #expect(score([2, 2, 2, 2, 2], category: category("choice")) == 10)
  }
}

func category(_ raw: String) -> YachtCategory {
  guard let category = YachtCategory(rawValue: raw) else {
    #expect(Bool(false), "Invalid test category: \(raw)")
    return .ones
  }
  return category
}
