
enum YachtCategory: String {
    case ones
    case twos
    case threes
    case fours
    case fives
    case sixes
    case fullHouse = "full house"
    case fourOfAKind = "four of a kind"
    case littleStraight = "little straight"
    case bigStraight = "big straight"
    case choice
    case yacht
}

func score(_ scores: [Int], category: YachtCategory) -> Int {
    switch category {
    case .ones: return simple(scores, category: 1)
    case .twos: return simple(scores, category: 2)
    case .threes: return simple(scores, category: 3)
    case .fours: return simple(scores, category: 4)
    case .fives: return simple(scores, category: 5)
    case .sixes: return simple(scores, category: 6)
    case .fullHouse: return fullHouse(scores)
    case .fourOfAKind: return fourOfAKind(scores)
    case .littleStraight: return littleStraight(scores)
    case .bigStraight: return bigStraight(scores)
    case .choice: return choice(scores)
    case .yacht: return yacht(scores)
    }
}

fileprivate func simple(_ scores: [Int], category: Int) -> Int {
    return category * scores.count { $0 == category }
}

fileprivate func fullHouse(_ scores: [Int]) -> Int {
    let counts = scores.reduce(into: [Int: Int]()) { result, element in
        result[element, default: 0] += 1
    }
    if counts.count == 2 && (counts.values.contains(2) && counts.values.contains(3)) {
        return scores.reduce(0, +)
    }
    return 0
}

fileprivate func fourOfAKind(_ scores: [Int]) -> Int {
    let counts = scores.reduce(into: [Int: Int]()) { result, element in
        result[element, default: 0] += 1
    }
    return counts.first { $0.value >= 4 }.map { $0.key * 4 } ?? 0
}

fileprivate func littleStraight(_ scores: [Int]) -> Int {
    return Set(scores) == [1, 2, 3, 4, 5] ? 30 : 0
}

fileprivate func bigStraight(_ scores: [Int]) -> Int {
    return Set(scores) == [2, 3, 4, 5, 6] ? 30 : 0
}

fileprivate func choice(_ scores: [Int]) -> Int {
    return scores.reduce(0, +)
}

fileprivate func yacht(_ scores: [Int]) -> Int {
    return scores.allSatisfy { $0 == scores.first } ? 50 : 0
}