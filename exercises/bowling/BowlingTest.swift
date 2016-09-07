#if swift(>=3.0)
    import XCTest
#endif

// swiftlint:disable force_try
class BowlingTest: XCTestCase {

    var game: Bowling!

    override func setUp() {
        game = Bowling()
    }

    func testOpenFrame() {
        try! game.roll(pins: 3)
        try! game.roll(pins: 4)
        rollNTimes(rolls: 18, pins: 0)
        XCTAssertEqual(try? game.score(), 7)
    }

    func testMultipleFrames() {
        [3, 4, 2, 3, 5, 2].forEach {
            try? game.roll(pins: $0)
        }
        rollNTimes(rolls: 14, pins: 0)
        XCTAssertEqual(try? game.score(), 19)
    }

    func testAllGutterballs() {
        rollNTimes(rolls: 20, pins: 0)
        XCTAssertEqual(try? game.score(), 0)
    }

    func testAllSinglePinRolls() {
        rollNTimes(rolls: 20, pins: 1)
        XCTAssertEqual(try? game.score(), 20)
    }

    func testAllOpenFrames() {
        rollNTimes(rolls: 10, pins: 3, 6)
        XCTAssertEqual(try? game.score(), 90)
    }

    func testStrikeNotLastFrame() {
        try? game.roll(pins: 10)
        try? game.roll(pins: 5)
        try? game.roll(pins: 3)
        rollNTimes(rolls: 16, pins: 0)

        XCTAssertEqual(try? game.score(), 26)
    }

    func testSpareNotLastFrame() {
        try? game.roll(pins: 5)
        try? game.roll(pins: 5)
        try? game.roll(pins: 3)
        try? game.roll(pins: 4)
        rollNTimes(rolls: 16, pins: 0)

        XCTAssertEqual(try? game.score(), 20)
    }

    func testMultipleStrikesInARow() {
        try? game.roll(pins: 10)
        try? game.roll(pins: 10)
        try? game.roll(pins: 10)
        try? game.roll(pins: 5)
        try? game.roll(pins: 3)
        rollNTimes(rolls: 12, pins: 0)

        XCTAssertEqual(try? game.score(), 81)
    }

    func testMultipleSparesInARow() {
        try? game.roll(pins: 5)
        try? game.roll(pins: 5)
        try? game.roll(pins: 3)
        try? game.roll(pins: 7)
        try? game.roll(pins: 4)
        try? game.roll(pins: 1)
        rollNTimes(rolls: 14, pins: 0)

        XCTAssertEqual(try? game.score(), 32)
    }

    func testStrikeInFinalFrame() {
        rollNTimes(rolls: 18, pins: 0)
        try? game.roll(pins: 10)
        try? game.roll(pins: 7)
        try? game.roll(pins: 1)

        XCTAssertEqual(try? game.score(), 18)
    }

    func testSpareInFinalFrame() {
        rollNTimes(rolls: 18, pins: 0)
        try? game.roll(pins: 9)
        try? game.roll(pins: 1)
        try? game.roll(pins: 7)

        XCTAssertEqual(try? game.score(), 17)
    }

    func testFillBallsStrikes() {
        rollNTimes(rolls: 18, pins: 0)
        try? game.roll(pins: 10)
        try? game.roll(pins: 10)
        try? game.roll(pins: 10)

        XCTAssertEqual(try? game.score(), 30)
    }

    func testPerfectGame() {
        rollNTimes(rolls: 12, pins: 10)
        XCTAssertEqual(try? game.score(), 300)
    }

    func testNegativePins() {
        XCTAssertThrowsError(try game.roll(pins: -1)) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .invalidNumberOfPins)
        }
    }

    func testRollsBetterThanStrike() {
        XCTAssertThrowsError(try game.roll(pins: 11)) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .invalidNumberOfPins)
        }
    }

    func testTwoNormalRollsBetterThanStrike() {
        try? game.roll(pins: 5)
        XCTAssertThrowsError(try game.roll(pins: 6)) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .tooManyPinsInFrame)
        }
    }

    func testTwoNormalRollsBetterThanStrikeInLastFrame() {
        rollNTimes(rolls: 18, pins: 0)
        try? game.roll(pins: 10)
        try? game.roll(pins: 5)
        XCTAssertThrowsError(try game.roll(pins: 6)) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .tooManyPinsInFrame)
        }
    }

    func testTakeScoreAtBeginning() {
        XCTAssertThrowsError(try game.score()) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameInProgress)
        }
    }

    func testTakeScoreBeforeGameHasEnded() {
        rollNTimes(rolls: 19, pins: 5)
        XCTAssertThrowsError(try game.score()) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameInProgress)
        }
    }

    func testRollsAfterTheTenthFrame() {
        rollNTimes(rolls: 20, pins: 0)
        XCTAssertThrowsError(try game.roll(pins: 0)) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameIsOver)
        }
    }

    func testCalculateScoreBeforeFillBallsHaveBeenPlayed() {
        rollNTimes(rolls: 10, pins: 10)
        XCTAssertThrowsError(try game.score()) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameInProgress)
        }
    }

    private func rollNTimes(rolls: Int, pins: Int...) {
        for _ in 1...rolls {
            pins.forEach {
                try? game.roll(pins: $0)
            }
        }
    }

}
