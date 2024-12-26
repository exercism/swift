import Foundation

enum HandRank: Int, Comparable {
  case highCard, onePair, twoPair, threeOfAKind, straight, flush, fullHouse, fourOfAKind,
    straightFlush

  static func < (lhs: HandRank, rhs: HandRank) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
}

class Poker {
  var hands: [[String]]

  init(_ hands: [String]) {
    self.hands = hands.map { $0.components(separatedBy: " ") }
  }

  func bestHands() -> String {
    var bestRank: HandRank = .highCard
    var bestRankedHands: [[String]] = []

    for hand in hands {
      let rank = evaluateHand(hand)
      if rank > bestRank {
        bestRank = rank
        bestRankedHands = [hand]
      } else if rank == bestRank {
        bestRankedHands.append(hand)
      }
    }
    let bestHand = breakTies(between: bestRankedHands, for: bestRank)
    return bestHand.joined(separator: " ")
  }

  private func convertValue(_ value: String, _ flush: Bool = false) -> Int {
    let value = String(value.prefix(value.count - 1))

    if flush == true && value == "A" {
      return 1
    }

    switch value {
    case "J": return 11
    case "Q": return 12
    case "K": return 13
    case "A": return 14
    default: return Int(value)!
    }
  }

  private func evaluateHand(_ hand: [String]) -> HandRank {

    // This method evaluates the rank of the hand
    // For simplicity, this example returns a high card rank.
    // You need to implement full hand ranking logic here.

    let sortedHand = hand.sorted { card1, card2 in
      let value1 = convertValue(card1)
      let value2 = convertValue(card2)
      return value1 < value2
    }

    // Check for flush
    let flush = sortedHand.allSatisfy { $0.last == sortedHand[0].last }

    var sortedHandFlush = sortedHand

    if sortedHand.last?.prefix(1) == "A" && sortedHand.first?.prefix(1) == "2" {
      sortedHandFlush.removeLast()
    }

    let straight = sortedHandFlush.enumerated().allSatisfy { index, card in
      if index == 0 {
        return true
      }

      let value1 = convertValue(sortedHandFlush[index - 1])
      let value2 = convertValue(card)
      return value2 - value1 == 1
    }

    let fullHouse = sortedHand.enumerated().contains { index, card in
      if index + 4 < sortedHand.count {
        return sortedHand[index].prefix(sortedHand[index].count - 1)
          == sortedHand[index + 1].prefix(sortedHand[index + 1].count - 1)
          && sortedHand[index].prefix(sortedHand[index].count - 1)
            == sortedHand[index + 2].prefix(sortedHand[index + 2].count - 1)
          && sortedHand[index + 3].prefix(sortedHand[index + 3].count - 1)
            == sortedHand[index + 4].prefix(sortedHand[index + 4].count - 1)
      }
      return false
    }

    let cardCounts = Dictionary(grouping: hand, by: { convertValue($0) })
    let twoPair = cardCounts.values.filter { $0.count == 2 }.count == 2
    let onePair = cardCounts.values.contains { $0.count == 2 }
    let threeOfAKind = cardCounts.values.contains { $0.count == 3 }
    let fourOfAKind = cardCounts.values.contains { $0.count == 4 }

    if flush && straight {
      return .straightFlush
    } else if fourOfAKind {
      return .fourOfAKind
    } else if fullHouse {
      return .fullHouse
    } else if flush {
      return .flush
    } else if straight {
      return .straight
    } else if threeOfAKind {
      return .threeOfAKind
    } else if twoPair {
      return .twoPair
    } else if onePair {
      return .onePair
    }
    return .highCard
  }

  private func breakTies(between hands: [[String]], for rank: HandRank) -> [String] {
    // This method resolves ties between hands of the same rank
    // For simplicity, this example returns the hands as-is.
    // You need to implement tie-breaking logic here.

    if rank == .highCard || rank == .straightFlush || rank == .straight || rank == .flush {
      return hands.max { hand1, hand2 in
        let isFlush = rank == .straight || rank == .straightFlush
        
        func highestCard(_ hand: [String]) -> String {
          return hand.max { card1, card2 in
            convertValue(card1, isFlush) < convertValue(card2, isFlush)
          }!
        }

        var hand1High = highestCard(hand1)
        var hand2High = highestCard(hand2)

        var hand1 = hand1
        var hand2 = hand2      

        while convertValue(hand1High) == convertValue(hand2High) {
          hand1 = hand1.filter { $0 != hand1High }
          hand2 = hand2.filter { $0 != hand2High }
          if hand1.isEmpty {
            return false
          }
          hand1High = highestCard(hand1)
          hand2High = highestCard(hand2)
        }

        return convertValue(hand1High) < convertValue(hand2High)
      }!
    } else if rank == .onePair {

      let bestHand = hands.max { left, right in
        func pairValue(_ hand: [String]) -> Int {
          for i in 0..<hand.count {
            for j in i + 1..<hand.count {
              if convertValue(hand[i]) == convertValue(hand[j]) {
                return convertValue(hand[i])
              }
            }
          }
          return 0
        }
        return pairValue(left) < pairValue(right)
      }!
      return bestHand

    } else if rank == .twoPair {
      let bestHand = hands.max { left, right in
        func pairValue(_ hand: [String]) -> Int {
          var counts = [Int: Int]()
          for card in hand {
            let value = convertValue(card)
            counts[value, default: 0] += 1
          }
          return counts.filter { $0.value == 2 }.max(by: { $0.key < $1.key })!.key
        }
        if pairValue(left) == pairValue(right) {
          let leftHighest = pairValue(left.filter { convertValue($0) != pairValue(left) })
          let rightHighest = pairValue(
            right.filter { convertValue($0) != pairValue(right) })
          return leftHighest < rightHighest
        }
        return pairValue(left) < pairValue(right)
      }!
      return bestHand

    } else if rank == .threeOfAKind || rank == .fullHouse {
      let bestHand = hands.max { left, right in
        func tripValue(_ hand: [String]) -> Int {
          var counts = [Int: Int]()
          for card in hand {
            let value = convertValue(card)
            counts[value, default: 0] += 1
          }
          return counts.first(where: { $0.value == 3 })?.key ?? 0
        }
        if tripValue(left) == tripValue(right) {
          let rightHighest = right.filter { convertValue($0) != tripValue(right) }.max(
            by: { convertValue($0) < convertValue($1) })!
          let leftHighest = left.filter { convertValue($0) != tripValue(left) }.max(by: {
            convertValue($0) < convertValue($1)
          })!
          return convertValue(leftHighest) < convertValue(rightHighest)
        }

        return tripValue(left) < tripValue(right)
      }!
      return bestHand
    } else if rank == .fourOfAKind {
      let bestHand = hands.max { left, right in
        func quadValue(_ hand: [String]) -> Int {
          var counts = [Int: Int]()
          for card in hand {
            let value = convertValue(card)
            counts[value, default: 0] += 1
          }
          return counts.first(where: { $0.value == 4 })?.key ?? 0
        }
        if quadValue(left) == quadValue(right) {
          let rightHighest = right.filter { convertValue($0) != quadValue(right) }
          let leftHighest = left.filter { convertValue($0) != quadValue(left) }
          return convertValue(leftHighest[0]) < convertValue(rightHighest[0])
        }
        return quadValue(left) < quadValue(right)
      }!
      return bestHand

    } else {
      return hands[0]
    }
  }
}
