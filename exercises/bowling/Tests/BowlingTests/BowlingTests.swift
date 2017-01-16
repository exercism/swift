import XCTest
@testable import Bowling

class BowlingTests: XCTestCase {
    var game: Bowling!

    override func setUp() {
        game = Bowling()
    }

    func roll(_ seriesOfPins: [Int]) throws {
        for pins in seriesOfPins {
            try game.roll(pins: pins)
        }
    }

    func testAllZeros() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])

        XCTAssertEqual(try? game.score(), 0)
    }

    func testNoStrikesOrSpares() {
        try? roll([3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6])

        XCTAssertEqual(try? game.score(), 90)
    }

    func testSpareFollowedByZeros() {
        try? roll([6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])

        XCTAssertEqual(try? game.score(), 10)
    }

    func testPointsScoredInRollAfterSpare() {
        try? roll([6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])

        XCTAssertEqual(try? game.score(), 16)
    }

    func testConsecutiveSpares() {
        try? roll([5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])

        XCTAssertEqual(try? game.score(), 31)
    }

    func testSpareInLastFrame() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7])

        XCTAssertEqual(try? game.score(), 17)
    }

    func testStrikeWithSingleRoll() {
        try? roll([10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])

        XCTAssertEqual(try? game.score(), 10)
    }

    func testTwoRollsAfterAStrike() {
        try? roll([10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])

        XCTAssertEqual(try? game.score(), 26)
    }

    func testConsecutiveStrikes() {
        try? roll([10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])

        XCTAssertEqual(try? game.score(), 81)
    }

    func testStrikeInLastFrame() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1])

        XCTAssertEqual(try? game.score(), 18)
    }

    func testSpareWithTwoRollBonus() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3])

        XCTAssertEqual(try? game.score(), 20)
    }

    func testStrikesWithTwoRollBonus() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10])

        XCTAssertEqual(try? game.score(), 30)
    }

    func testStrikeAfterSpareInLastFrame() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10])

        XCTAssertEqual(try? game.score(), 20)
    }

    func testAllStrikes() {
        try? roll([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10])

        XCTAssertEqual(try? game.score(), 300)
    }

    func testNegativePoints() {
        XCTAssertThrowsError(try roll([-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .invalidNumberOfPins)
        }
    }

    func testNoMoreThan10PinsPerRoll() {
        XCTAssertThrowsError(try roll([11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .invalidNumberOfPins)
        }
    }

    func testTwoRollsGreaterThan10() {
        XCTAssertThrowsError(try roll([5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .tooManyPinsInFrame)
        }
    }

    func testTwoBonusRollsAfterStrike() {
        XCTAssertThrowsError(try roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5, 6])) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .tooManyPinsInFrame)
        }
    }

    func testUnstartedGameCanNotBeScored() {
        XCTAssertThrowsError(try game.score()) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameInProgress)
        }
    }

    func testIncompleteGameCanNotBeScored() {
        try? roll([0, 0])

        XCTAssertThrowsError(try game.score()) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameInProgress)
        }
    }

    func testMoreThanTenFrames() {
        XCTAssertThrowsError(try roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameIsOver)
        }
    }

    func testBonusRollsNotRolled() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10])

        XCTAssertThrowsError(try game.score()) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameInProgress)
        }
    }

    func testSecondBonusRollNotRolled() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10])

        XCTAssertThrowsError(try game.score()) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameInProgress)
        }
    }

    func testBonusRollForSpareNotRolled() {
        try? roll([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3])

        XCTAssertThrowsError(try game.score()) { error in
            XCTAssertEqual(error as? Bowling.BowlingError, .gameInProgress)
        }
    }

    static var allTests: [(String, (BowlingTests) -> () throws -> Void)] {
        return [
            ("testAllZeros", testAllZeros),
            ("testNoStrikesOrSpares", testNoStrikesOrSpares),
            ("testSpareFollowedByZeros", testSpareFollowedByZeros),
            ("testPointsScoredInRollAfterSpare", testPointsScoredInRollAfterSpare),
            ("testConsecutiveSpares", testConsecutiveSpares),
            ("testSpareInLastFrame", testSpareInLastFrame),
            ("testStrikeWithSingleRoll", testStrikeWithSingleRoll),
            ("testTwoRollsAfterAStrike", testTwoRollsAfterAStrike),
            ("testConsecutiveStrikes", testConsecutiveStrikes),
            ("testStrikeInLastFrame", testStrikeInLastFrame),
            ("testSpareWithTwoRollBonus", testSpareWithTwoRollBonus),
            ("testStrikesWithTwoRollBonus", testStrikesWithTwoRollBonus),
            ("testStrikeAfterSpareInLastFrame", testStrikeAfterSpareInLastFrame),
            ("testAllStrikes", testAllStrikes),
            ("testNegativePoints", testNegativePoints),
            ("testNoMoreThan10PinsPerRoll", testNoMoreThan10PinsPerRoll),
            ("testTwoRollsGreaterThan10", testTwoRollsGreaterThan10),
            ("testTwoBonusRollsAfterStrike", testTwoBonusRollsAfterStrike),
            ("testUnstartedGameCanNotBeScored", testUnstartedGameCanNotBeScored),
            ("testIncompleteGameCanNotBeScored", testIncompleteGameCanNotBeScored),
            ("testMoreThanTenFrames", testMoreThanTenFrames),
            ("testBonusRollsNotRolled", testBonusRollsNotRolled),
            ("testSecondBonusRollNotRolled", testSecondBonusRollNotRolled),
            ("testBonusRollForSpareNotRolled", testBonusRollForSpareNotRolled),
        ]
    }
}
