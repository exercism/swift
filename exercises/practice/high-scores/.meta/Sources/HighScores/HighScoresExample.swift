import Foundation

struct HighScores {

    let scores: [Int]
    let latest: Int?
    let personalBest: Int?
    let topThree: [Int]

    init(scores: [Int]) {
        self.scores = scores
        self.latest = scores.last
        self.personalBest = scores.max()
        self.topThree = Array(scores.sorted(by: >).prefix(3))
    }

}