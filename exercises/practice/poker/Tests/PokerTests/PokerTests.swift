import Foundation
import Testing

@testable import Poker

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "true"]) ?? false

@Suite struct PokerTests {

  @Test("single hand always wins")
  func testSingleHandAlwaysWins() {
    let poker = Poker(["4S 5S 7H 8D JC"])
    let bestHand = poker.bestHands()
    let expected = "4S 5S 7H 8D JC"
    #expect(bestHand == expected)
  }

  @Test("highest card out of all hands wins", .enabled(if: RUNALL))
  func testHighestCardOutOfAllHandsWins() {
    let poker = Poker(["4D 5S 6S 8D 3C", "2S 4C 7S 9H 10H", "3S 4S 5D 6H JH"])
    let bestHand = poker.bestHands()
    let expected = "3S 4S 5D 6H JH"
    #expect(bestHand == expected)
  }

  @Test("a tie has multiple winners", .enabled(if: RUNALL))
  func testATieHasMultipleWinners() {
    let poker = Poker(["4D 5S 6S 8D 3C", "2S 4C 7S 9H 10H", "3S 4S 5D 6H JH", "3H 4H 5C 6C JD"])
    let bestHand = poker.bestHands()
    let expected = "3S 4S 5D 6H JH"
    #expect(bestHand == expected)
  }

  @Test(
    "multiple hands with the same high cards, tie compares next highest ranked, down to last card",
    .enabled(if: RUNALL))
  func testMultipleHandsWithTheSameHighCardsTieComparesNextHighestRankedDownToLastCard() {
    let poker = Poker(["3S 5H 6S 8D 7H", "2S 5D 6D 8C 7S"])
    let bestHand = poker.bestHands()
    let expected = "3S 5H 6S 8D 7H"
    #expect(bestHand == expected)
  }

  @Test("winning high card hand also has the lowest card", .enabled(if: RUNALL))
  func testWinningHighCardHandAlsoHasTheLowestCard() {
    let poker = Poker(["2S 5H 6S 8D 7H", "3S 4D 6D 8C 7S"])
    let bestHand = poker.bestHands()
    let expected = "2S 5H 6S 8D 7H"
    #expect(bestHand == expected)
  }

  @Test("one pair beats high card", .enabled(if: RUNALL))
  func testOnePairBeatsHighCard() {
    let poker = Poker(["4S 5H 6C 8D KH", "2S 4H 6S 4D JH"])
    let bestHand = poker.bestHands()
    let expected = "2S 4H 6S 4D JH"
    #expect(bestHand == expected)
  }

  @Test("highest pair wins", .enabled(if: RUNALL))
  func testHighestPairWins() {
    let poker = Poker(["4S 2H 6S 2D JH", "2S 4H 6C 4D JD"])
    let bestHand = poker.bestHands()
    let expected = "2S 4H 6C 4D JD"
    #expect(bestHand == expected)
  }

  @Test("both hands have the same pair, high card wins", .enabled(if: RUNALL))
  func testBothHandsHaveTheSamePairHighCardWins() {
    let poker = Poker(["4H 4S AH JC 3D", "4C 4D AS 5D 6C"])
    let bestHand = poker.bestHands()
    let expected = "4H 4S AH JC 3D"
    #expect(bestHand == expected)
  }

  @Test("two pairs beats one pair", .enabled(if: RUNALL))
  func testTwoPairsBeatsOnePair() {
    let poker = Poker(["2S 8H 6S 8D JH", "4S 5H 4C 8C 5C"])
    let bestHand = poker.bestHands()
    let expected = "4S 5H 4C 8C 5C"
    #expect(bestHand == expected)
  }

  @Test("both hands have two pairs, highest ranked pair wins", .enabled(if: RUNALL))
  func testBothHandsHaveTwoPairsHighestRankedPairWins() {
    let poker = Poker(["2S 8H 2D 8D 3H", "4S 5H 4C 8S 5D"])
    let bestHand = poker.bestHands()
    let expected = "2S 8H 2D 8D 3H"
    #expect(bestHand == expected)
  }

  @Test(
    "both hands have two pairs, with the same highest ranked pair, tie goes to low pair",
    .enabled(if: RUNALL))
  func testBothHandsHaveTwoPairsWithTheSameHighestRankedPairTieGoesToLowPair() {
    let poker = Poker(["2S QS 2C QD JH", "JD QH JS 8D QC"])
    let bestHand = poker.bestHands()
    let expected = "JD QH JS 8D QC"
    #expect(bestHand == expected)
  }

  @Test(
    "both hands have two identically ranked pairs, tie goes to remaining card (kicker)",
    .enabled(if: RUNALL))
  func testBothHandsHaveTwoIdenticallyRankedPairsTieGoesToRemainingCardKicker() {
    let poker = Poker(["JD QH JS 8D QC", "JS QS JC 2D QD"])
    let bestHand = poker.bestHands()
    let expected = "JD QH JS 8D QC"
    #expect(bestHand == expected)
  }

  @Test(
    "both hands have two pairs that add to the same value, win goes to highest pair",
    .enabled(if: RUNALL))
  func testBothHandsHaveTwoPairsThatAddToTheSameValueWinGoesToHighestPair() {
    let poker = Poker(["6S 6H 3S 3H AS", "7H 7S 2H 2S AC"])
    let bestHand = poker.bestHands()
    let expected = "7H 7S 2H 2S AC"
    #expect(bestHand == expected)
  }

  @Test("two pairs first ranked by largest pair", .enabled(if: RUNALL))
  func testTwoPairsFirstRankedByLargestPair() {
    let poker = Poker(["5C 2S 5S 4H 4C", "6S 2S 6H 7C 2C"])
    let bestHand = poker.bestHands()
    let expected = "6S 2S 6H 7C 2C"
    #expect(bestHand == expected)
  }

  @Test("three of a kind beats two pair", .enabled(if: RUNALL))
  func testThreeOfAKindBeatsTwoPair() {
    let poker = Poker(["2S 8H 2H 8D JH", "4S 5H 4C 8S 4H"])
    let bestHand = poker.bestHands()
    let expected = "4S 5H 4C 8S 4H"
    #expect(bestHand == expected)
  }

  @Test("both hands have three of a kind, tie goes to highest ranked triplet", .enabled(if: RUNALL))
  func testBothHandsHaveThreeOfAKindTieGoesToHighestRankedTriplet() {
    let poker = Poker(["2S 2H 2C 8D JH", "4S AH AS 8C AD"])
    let bestHand = poker.bestHands()
    let expected = "4S AH AS 8C AD"
    #expect(bestHand == expected)
  }

  @Test(
    "with multiple decks, two players can have same three of a kind, ties go to highest remaining cards",
    .enabled(if: RUNALL))
  func testWithMultipleDecksTwoPlayersCanHaveSameThreeOfAKindTiesGoToHighestRemainingCards() {
    let poker = Poker(["5S AH AS 7C AD", "4S AH AS 8C AD"])
    let bestHand = poker.bestHands()
    let expected = "4S AH AS 8C AD"
    #expect(bestHand == expected)
  }

  @Test("a straight beats three of a kind", .enabled(if: RUNALL))
  func testAStraightBeatsThreeOfAKind() {
    let poker = Poker(["4S 5H 4C 8D 4H", "3S 4D 2S 6D 5C"])
    let bestHand = poker.bestHands()
    let expected = "3S 4D 2S 6D 5C"
    #expect(bestHand == expected)
  }

  @Test("aces can end a straight (10 J Q K A)", .enabled(if: RUNALL))
  func testAcesCanEndAStraight10JQKA() {
    let poker = Poker(["4S 5H 4C 8D 4H", "10D JH QS KD AC"])
    let bestHand = poker.bestHands()
    let expected = "10D JH QS KD AC"
    #expect(bestHand == expected)
  }

  @Test("aces can start a straight (A 2 3 4 5)", .enabled(if: RUNALL))
  func testAcesCanStartAStraightA2345() {
    let poker = Poker(["4S 5H 4C 8D 4H", "4D AH 3S 2D 5C"])
    let bestHand = poker.bestHands()
    let expected = "4D AH 3S 2D 5C"
    #expect(bestHand == expected)
  }

  @Test("aces cannot be in the middle of a straight (Q K A 2 3)", .enabled(if: RUNALL))
  func testAcesCannotBeInTheMiddleOfAStraightQKA23() {
    let poker = Poker(["2C 3D 7H 5H 2S", "QS KH AC 2D 3S"])
    let bestHand = poker.bestHands()
    let expected = "2C 3D 7H 5H 2S"
    #expect(bestHand == expected)
  }

  @Test("both hands with a straight, tie goes to highest ranked card", .enabled(if: RUNALL))
  func testBothHandsWithAStraightTieGoesToHighestRankedCard() {
    let poker = Poker(["4S 6C 7S 8D 5H", "5S 7H 8S 9D 6H"])
    let bestHand = poker.bestHands()
    let expected = "5S 7H 8S 9D 6H"
    #expect(bestHand == expected)
  }

  @Test(
    "even though an ace is usually high, a 5-high straight is the lowest-scoring straight",
    .enabled(if: RUNALL))
  func testEvenThoughAnAceIsUsuallyHighA5HighStraightIsTheLowestScoringStraight() {
    let poker = Poker(["2H 3C 4D 5D 6H", "4S AH 3S 2D 5H"])
    let bestHand = poker.bestHands()
    let expected = "2H 3C 4D 5D 6H"
    #expect(bestHand == expected)
  }

  @Test("flush beats a straight", .enabled(if: RUNALL))
  func testFlushBeatsAStraight() {
    let poker = Poker(["4C 6H 7D 8D 5H", "2S 4S 5S 6S 7S"])
    let bestHand = poker.bestHands()
    let expected = "2S 4S 5S 6S 7S"
    #expect(bestHand == expected)
  }

  @Test(
    "both hands have a flush, tie goes to high card, down to the last one if necessary",
    .enabled(if: RUNALL))
  func testBothHandsHaveAFlushTieGoesToHighCardDownToTheLastOneIfNecessary() {
    let poker = Poker(["2H 7H 8H 9H 6H", "3S 5S 6S 7S 8S"])
    let bestHand = poker.bestHands()
    let expected = "2H 7H 8H 9H 6H"
    #expect(bestHand == expected)
  }

  @Test("full house beats a flush", .enabled(if: RUNALL))
  func testFullHouseBeatsAFlush() {
    let poker = Poker(["3H 6H 7H 8H 5H", "4S 5H 4C 5D 4H"])
    let bestHand = poker.bestHands()
    let expected = "4S 5H 4C 5D 4H"
    #expect(bestHand == expected)
  }

  @Test("both hands have a full house, tie goes to highest-ranked triplet", .enabled(if: RUNALL))
  func testBothHandsHaveAFullHouseTieGoesToHighestRankedTriplet() {
    let poker = Poker(["4H 4S 4D 9S 9D", "5H 5S 5D 8S 8D"])
    let bestHand = poker.bestHands()
    let expected = "5H 5S 5D 8S 8D"
    #expect(bestHand == expected)
  }

  @Test(
    "with multiple decks, both hands have a full house with the same triplet, tie goes to the pair",
    .enabled(if: RUNALL))
  func testWithMultipleDecksBothHandsHaveAFullHouseWithTheSameTripletTieGoesToThePair() {
    let poker = Poker(["5H 5S 5D 9S 9D", "5H 5S 5D 8S 8D"])
    let bestHand = poker.bestHands()
    let expected = "5H 5S 5D 9S 9D"
    #expect(bestHand == expected)
  }

  @Test("four of a kind beats a full house", .enabled(if: RUNALL))
  func testFourOfAKindBeatsAFullHouse() {
    let poker = Poker(["4S 5H 4D 5D 4H", "3S 3H 2S 3D 3C"])
    let bestHand = poker.bestHands()
    let expected = "3S 3H 2S 3D 3C"
    #expect(bestHand == expected)
  }

  @Test("both hands have four of a kind, tie goes to high quad", .enabled(if: RUNALL))
  func testBothHandsHaveFourOfAKindTieGoesToHighQuad() {
    let poker = Poker(["2S 2H 2C 8D 2D", "4S 5H 5S 5D 5C"])
    let bestHand = poker.bestHands()
    let expected = "4S 5H 5S 5D 5C"
    #expect(bestHand == expected)
  }

  @Test(
    "with multiple decks, both hands with identical four of a kind, tie determined by kicker",
    .enabled(if: RUNALL))
  func testWithMultipleDecksBothHandsWithIdenticalFourOfAKindTieDeterminedByKicker() {
    let poker = Poker(["3S 3H 2S 3D 3C", "3S 3H 4S 3D 3C"])
    let bestHand = poker.bestHands()
    let expected = "3S 3H 4S 3D 3C"
    #expect(bestHand == expected)
  }

  @Test("straight flush beats four of a kind", .enabled(if: RUNALL))
  func testStraightFlushBeatsFourOfAKind() {
    let poker = Poker(["4S 5H 5S 5D 5C", "7S 8S 9S 6S 10S"])
    let bestHand = poker.bestHands()
    let expected = "7S 8S 9S 6S 10S"
    #expect(bestHand == expected)
  }

  @Test("aces can end a straight flush (10 J Q K A)", .enabled(if: RUNALL))
  func testAcesCanEndAStraightFlush10JQKA() {
    let poker = Poker(["KC AH AS AD AC", "10C JC QC KC AC"])
    let bestHand = poker.bestHands()
    let expected = "10C JC QC KC AC"
    #expect(bestHand == expected)
  }

  @Test("aces can start a straight flush (A 2 3 4 5)", .enabled(if: RUNALL))
  func testAcesCanStartAStraightFlushA2345() {
    let poker = Poker(["KS AH AS AD AC", "4H AH 3H 2H 5H"])
    let bestHand = poker.bestHands()
    let expected = "4H AH 3H 2H 5H"
    #expect(bestHand == expected)
  }

  @Test("aces cannot be in the middle of a straight flush (Q K A 2 3)", .enabled(if: RUNALL))
  func testAcesCannotBeInTheMiddleOfAStraightFlushQKA23() {
    let poker = Poker(["2C AC QC 10C KC", "QH KH AH 2H 3H"])
    let bestHand = poker.bestHands()
    let expected = "2C AC QC 10C KC"
    #expect(bestHand == expected)
  }

  @Test("both hands have a straight flush, tie goes to highest-ranked card", .enabled(if: RUNALL))
  func testBothHandsHaveAStraightFlushTieGoesToHighestRankedCard() {
    let poker = Poker(["4H 6H 7H 8H 5H", "5S 7S 8S 9S 6S"])
    let bestHand = poker.bestHands()
    let expected = "5S 7S 8S 9S 6S"
    #expect(bestHand == expected)
  }

  @Test(
    "even though an ace is usually high, a 5-high straight flush is the lowest-scoring straight flush",
    .enabled(if: RUNALL))
  func testEvenThoughAnAceIsUsuallyHighA5HighStraightFlushIsTheLowestScoringStraightFlush() {
    let poker = Poker(["2H 3H 4H 5H 6H", "4D AD 3D 2D 5D"])
    let bestHand = poker.bestHands()
    let expected = "2H 3H 4H 5H 6H"
    #expect(bestHand == expected)
  }
}
