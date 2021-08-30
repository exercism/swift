struct Bowling {

    enum BowlingError: Error {
        case invalidNumberOfPins
        case tooManyPinsInFrame
        case gameIsOver
        case gameInProgress
    }

    private let minPins = 0
    private let maxPins = 10
    private var scoreCard = [Int: [Int]]()

    private var currentFrame: Int {
        return scoreCard.keys.max() ?? 1
    }

    private var isLastFrame: Bool {
        return currentFrame == 10
    }

    mutating func roll(pins: Int) throws {
        try validate(pins: pins)
        var currentValue = scoreCard[currentFrame] ?? []
        currentValue.append(pins)
        scoreCard[currentFrame] = currentValue
        if frameComplete() && !isLastFrame {
            scoreCard[currentFrame + 1] = []
        }
    }

    func score() throws -> Int {
        guard gameIsComplete() else {
            throw BowlingError.gameInProgress
        }

        var result = 0

        for index in 1...10 {
            if let frame = scoreCard[index] {
                result += scoreFrame(frame, index: index)
            }
        }

        return result
    }

    private func scoreFrame(_ frame: [Int], index: Int) -> Int {
        let strikeOrSpare = [frame.first, frame.reduce(0, +)]
            .compactMap { $0 }
            .contains(maxPins)

        if strikeOrSpare {
            let scores = [scoreCard[index], scoreCard[index + 1], scoreCard[index + 2]].compactMap { $0 }.flatMap { $0 }
            let firstThree = scores[0...2]

            return firstThree.reduce(0, +)
        } else {
            return frame.reduce(0, +)
        }
    }

    private func validate(pins: Int) throws {
        guard minPins...maxPins ~= pins else {
            throw BowlingError.invalidNumberOfPins
        }

        guard validFrame(pins: pins) else {
            throw BowlingError.tooManyPinsInFrame
        }

        guard !gameIsComplete() else {
            throw BowlingError.gameIsOver
        }
    }

    private func validFrame(pins: Int) -> Bool {
        if isLastFrame {
            let lastRollWasStrike = scoreCard[currentFrame]?.last == 10

            if lastRollWasStrike || isSpare() {
                return true
            }
        }

        let lastRoll = scoreCard[currentFrame]?.last ?? 0

        return lastRoll + pins <= maxPins
    }

    private func gameIsComplete() -> Bool {
        return isLastFrame && frameComplete()
    }

    private func frameComplete() -> Bool {
        if isLastFrame {
            return isOpenFrame() && frameFilled() || frameFilled(rolls: 3)
        }

        return frameFilled() || isStrike()
    }

    private func frameFilled(rolls: Int = 2) -> Bool {
        return scoreCard[currentFrame]?.count == rolls
    }

    private func isStrike() -> Bool {
        return scoreCard[currentFrame]?.first == 10
    }

    private func isSpare() -> Bool {
        guard let rolls = scoreCard[currentFrame] else { return false }
        let total = rolls.reduce(0, +)

        return total == 10
    }

    private func isOpenFrame() -> Bool {
        return !isSpare() && !isStrike()
    }
}
