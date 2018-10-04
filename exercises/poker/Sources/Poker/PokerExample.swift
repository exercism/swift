import Foundation

private extension String {

    func split(_ input: String) -> [String] {
        return self.components(separatedBy: input)
    }
    // Returns the Rank part of the card
    func head() -> String {
        return String(self[..<index(before: endIndex)])
    }
    // Return the Suit part of the card
    func tail() -> String {
        return String(self[index(before: endIndex)..<endIndex])
    }
}

struct Poker {

    static func bestHand(_ hands: [String]) -> String? {

        var pokerHandsParsed: [PokerHand] = []

        for each in hands {
            guard let pokerHand = PokerHand(each) else { return nil }
            pokerHandsParsed.append(pokerHand)
        }

        guard let topHand = (pokerHandsParsed.sorted(by: >)).first,
            let indexTop = pokerHandsParsed.index(of: topHand) else { return nil }

        return hands[indexTop]

    }
}

enum HandRank {
    case highCard(PlayingCard)
    case onePair(Rank, card1:Rank, card2:Rank, card3:Rank )
    case twoPair(high:Rank, low:Rank, highCard:PlayingCard)
    case threeOfAKind(three:Rank)
    case straight(high:Rank)
    case flush(Rank, Suit)
    case fullHouse(three:Rank)
    case fourOfAKind(four:Rank)
    case straightFlush(Rank, Suit)

    func order() -> Int {
        switch self {
        case .highCard: return 1
        case .onePair: return 2
        case .twoPair: return 3
        case .threeOfAKind: return 4
        case .straight: return 5
        case .flush: return 6
        case .fullHouse: return 7
        case .fourOfAKind: return 8
        case .straightFlush: return 9
        }
    }

    static func parsePairs(_ inputHand: PokerHand) -> [(rank: Rank, count: Int)] {
        let ranks = inputHand.hand.map({ $0.rank })
        let rankSet = Set(ranks)
        var toReturn = [Rank: Int]()
        for each in ranks {
            if rankSet.contains(each) {
                toReturn[each] = (toReturn[each] ?? 0) + 1
            }
        }
        let preresult = toReturn.map({ key, value in return (rank:key, count:value) })
        return preresult.sorted(by: { (one, two) in
            return one.count == two.count ? one.rank > two.rank : one.count > two.count
        })
    }

    static func isFlush(_ inputHand: PokerHand) -> (bool: Bool, suit: Suit) {
        let suits = inputHand.hand.map({ $0.suit })
        let first = suits[0]
        for each in suits {
            guard first == each else { return (false, .none) }
        }
        return (true, first)
    }

    static func isStraight(_ inputHand: PokerHand) -> (bool: Bool, highest: Rank) {
        let sorted = inputHand.hand.sorted(by: { $0.rank < $1.rank })
        let first = sorted[0].rank.rawValue
        for (index, each) in sorted.enumerated() {
            guard each.rank.rawValue != index + first else { continue }
            // checks for Ace as the lowest card
            guard let aceIndex = inputHand.hand.index(where: { $0.rank.rawValue == 14 })else { return (false, .ace) }
            var replacedAced = inputHand.hand.map({ $0.rank.rawValue })
            replacedAced[aceIndex] = 1 // swaps ace value to lowest
            replacedAced.sort()
            let firstVal = replacedAced[0]
            for (idx, eachVal) in replacedAced.enumerated() {
                guard eachVal == firstVal + idx else { return (false, .ace) }
            }
        }
        let last = sorted[sorted.count - 1].rank
        return (true, last)
    }

    init(_ pokerHand: PokerHand) {
        let pairs = HandRank.parsePairs(pokerHand)
        let (flush, flushSuit) = HandRank.isFlush(pokerHand)
        let (straight, straightRank) = HandRank.isStraight(pokerHand)

        //straightFlush
        if flush && straight {
            self = .straightFlush(straightRank, flushSuit)
            //fourOfAKind
        } else if pairs[0].count == 4 {
            self = .fourOfAKind(four: (pairs[0]).rank)
            //fullHouse
        } else if pairs[0].count == 3 && pairs.count == 2 {
            self = .fullHouse(three: (pairs[0]).rank)
            //flush
        } else if flush {
            let r = (pairs[0]).rank
            self = .flush(r, flushSuit)
            //straight
        } else if straight {
            self = .straight(high: straightRank)
            //theeOfAKind
        } else if pairs[0].count == 3 && pairs.count == 3 {
            self = .threeOfAKind(three: (pairs[0]).rank)
            //twoPair
        } else if pairs[0].count == 2 && pairs.count == 3 {
            let r = (pairs[2]).rank
            let s = pokerHand.hand[4].suit
            self = .twoPair(high: (pairs[0]).rank, low: (pairs[1]).rank,
                            highCard:PlayingCard.init(rank: r, suit: s))
            //onePair
        } else if pairs[0].count == 2 && pairs.count == 4 {
            self = .onePair((pairs[0]).rank, card1: (pairs[1]).rank, card2: (pairs[2]).rank, card3: (pairs[3]).rank)
            //highCard
        } else {
            let r = (pairs[0]).rank
            let s = pokerHand.hand[0].suit
            self = .highCard(PlayingCard(rank:r, suit:s ))
        }
    }
}

extension HandRank: Equatable {
    static func == (lhs: HandRank, rhs: HandRank) -> Bool {
        switch (lhs, rhs) {
        //straightFlush(Rank,Suit)
        case (HandRank.straightFlush(let lRank, let lSuit), HandRank.straightFlush(let rRank, let rSuit)):
            return lRank == rRank && lSuit == rSuit
        //fourOfAKind(four:Rank)
        case (HandRank.fourOfAKind(four: let lFour),
              HandRank.fourOfAKind(four: let rFour)):
            return lFour == rFour
        //fullHouse(three:Rank)
        case (HandRank.fullHouse(three: let lThree),
              HandRank.fullHouse(three: let rThree)):
            return lThree == rThree
        //flush(Suit)
        case (HandRank.flush(let lRank, let lSuit), HandRank.flush(let rRank, let rSuit)):
            return lSuit == rSuit && lRank == rRank
        //straight(high:Rank)
        case (HandRank.straight(high: let lRank),
              HandRank.straight(high: let rRank)):
            return lRank == rRank
        //threeOfAKind(three:Rank)
        case (HandRank.threeOfAKind(three: let lRank),
              HandRank.threeOfAKind(three: let rRank)):
            return lRank == rRank
        //twoPair(high:Rank,low:Rank, highCard:PlayingCard)
        case (HandRank.twoPair(high: let lHigh, low: let lLow, highCard: let lCard), HandRank.twoPair(high: let rHigh, low: let rLow, highCard: let rCard)):
            return lHigh == rHigh && lLow == rLow && lCard == rCard
        //onePair(Rank)
        case (HandRank.onePair(let lPairRank, card1: let lCard1, card2: let lCard2, card3: let lCard3),
              HandRank.onePair(let rPairRank, card1: let rCard1, card2: let rCard2, card3: let rCard3)):
            return lPairRank == rPairRank && lCard1 == rCard1 && lCard2 == rCard2 && lCard3 == rCard3
        //highCard(PlayingCard)
        case (HandRank.highCard(let lCard), HandRank.highCard(let rCard)):
            return lCard == rCard
        default:
            return false
        }
    }
}

extension HandRank: Comparable {
    // swiftlint:disable cyclomatic_complexity
    static func < (lhs: HandRank, rhs: HandRank) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false

        //straightFlush(Rank,Suit)
        case (HandRank.straightFlush(let lRank, let lSuit), HandRank.straightFlush(let rRank, let rSuit)):
            return lRank == rRank ? lSuit < rSuit : lRank < rRank

        //fourOfAKind(four:Rank)
        case (HandRank.fourOfAKind(four: let lFour),
              HandRank.fourOfAKind(four: let rFour)):
            return lFour < rFour

        //fullHouse(three:Rank)
        case (HandRank.fullHouse(three: let lRank),
              HandRank.fullHouse(three: let rRank)):
            return lRank < rRank

        //flush(Suit)
        case (HandRank.flush(let lRank, let lSuit), HandRank.flush(let rRank, let rSuit)):
            return lRank == rRank ? lSuit < rSuit : lRank < rRank

        //straight(high:Rank)
        case (HandRank.straight(high: let lRank),
              HandRank.straight(high: let rRank)):
            return lRank < rRank

        //threeOfAKind(three:Rank)
        case (HandRank.threeOfAKind(three: let lRank),
              HandRank.threeOfAKind(three: let rRank)):
            return lRank < rRank

        //twoPair(high:Rank,low:Rank, highCard:PlayingCard)
        case (HandRank.twoPair(high: let lHigh, low: let lLow, highCard: let lCard), HandRank.twoPair(high: let rHigh, low: let rLow, highCard: let rCard)):
            if lHigh == rHigh && lLow == rLow {
                return lCard < rCard
            } else {
                return lHigh < rHigh
            }

        //onePair(Rank)
        case (HandRank.onePair(let lPairRank, card1: let lCard1, card2: let lCard2, card3: let lCard3),
              HandRank.onePair(let rPairRank, card1: let rCard1, card2: let rCard2, card3: let rCard3)):
            return lPairRank == rPairRank ? (lCard1 == rCard1 ? (lCard2 == rCard2 ? lCard3 < rCard3 :lCard2 < rCard2):lCard1 < rCard1):lPairRank < rPairRank

        //highCard(PlayingCard)
        case (HandRank.highCard(let lCard), HandRank.highCard(let rCard)):
            return lCard < rCard

        default:
            return lhs.order() < rhs.order()
        }
    }
}

struct PokerHand {
    let hand: [PlayingCard]

    func handRank() -> HandRank {
        return HandRank(self)
    }

    init?(_ stringHand: String) {

        var handParsed: [PlayingCard] = []

        for each in stringHand.split(" ") {
            guard let card = PlayingCard(each) else { return nil }
            handParsed.append(card)
        }

        if handParsed.count == 5 { self.hand = handParsed } else { return nil }
    }
}

extension PokerHand: Equatable {
    static func == (lhs: PokerHand, rhs: PokerHand) -> Bool {
        return lhs.hand == rhs.hand
    }
}

extension PokerHand: Comparable {
    static func < (lhs: PokerHand, rhs: PokerHand) -> Bool {
        return lhs.handRank() < rhs.handRank()
    }
}

struct PlayingCard {
    let rank: Rank
    let suit: Suit

    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }

    init?(_ stringInput: String) {

        guard let rank = Rank(stringInput.head()),
            let suit = Suit(stringInput.tail()) else { return nil }

        self.rank = rank
        self.suit = suit
    }
}

extension PlayingCard: Equatable {
    static func == (lhs: PlayingCard, rhs: PlayingCard) -> Bool {
        return lhs.rank == rhs.rank && lhs.suit == rhs.suit
    }
}

extension PlayingCard: Comparable {
    static func < (lhs: PlayingCard, rhs: PlayingCard) -> Bool {
        return lhs.rank == rhs.rank ? lhs.suit < rhs.suit : lhs.rank < rhs.rank
    }
}

enum Rank: Int {
    case two = 2
    case three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace

    init?(_ rank: String) {
        var rankInt = 0
        switch rank {
        case "A": rankInt = 14
        case "J": rankInt = 11
        case "Q": rankInt = 12
        case "K": rankInt = 13
        default : rankInt = Int(rank) ?? 0
        }
        self.init(rawValue: rankInt)
    }
}

enum Suit: String {
    case spades, hearts, diamonds, clubs
    case none

    init?(_ suit: String) {

        switch suit {
        case "♡": self = .hearts
        case "♢": self = .diamonds
        case "♧": self = .clubs
        case "♤": self = .spades
        case _  : return nil
        }
    }
}

extension Rank: Comparable {
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false
        default:
            return lhs.rawValue < rhs.rawValue
        }
    }
}

extension Suit: Comparable {
    static func < (lhs: Suit, rhs: Suit) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false
        case (.spades, _),
             (.hearts, .diamonds), (.hearts, .clubs),
             (.diamonds, .clubs):
            return false
        default:
            return true
        }
    }
}
