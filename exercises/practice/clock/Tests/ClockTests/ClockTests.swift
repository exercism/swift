import XCTest
@testable import Clock

// Test for Protocols: CustomStringConvertible, Equatable

class ClockTests: XCTestCase {

    // MARK: - Create: Test creating a new clock with an initial time.

    func testOnTheHour() {
        XCTAssertEqual("08:00", Clock(hours: 8).description)
    }

    func testPastTheHour() {
        XCTAssertEqual("11:09", Clock(hours: 11, minutes: 9).description)
    }

    func testMidnightIsZeroHours() {
        XCTAssertEqual("00:00", Clock(hours: 24).description)
    }

    func testHourRollsOver() {
        XCTAssertEqual("01:00", Clock(hours: 25).description)
    }

    func testHourRollsOverContinuously() {
        XCTAssertEqual("04:00", Clock(hours: 100).description)
    }

    func testSixtyMinutesIsNextHour() {
        XCTAssertEqual("02:00", Clock(hours: 1, minutes: 60).description)
    }

    func testMinutesRollOver() {
        XCTAssertEqual("02:40", Clock(hours: 0, minutes: 160).description)
    }

    func testMinutesRollOverContinuously() {
        XCTAssertEqual("04:43", Clock(hours: 0, minutes: 1723).description)
    }

    func testHoursAndMinutesRollOver() {
        XCTAssertEqual("11:01", Clock(hours: 201, minutes: 3001).description)
    }

    func testHoursAndMinutesRollOverToExactlyMidnight() {
        XCTAssertEqual("00:00", Clock(hours: 72, minutes: 8640).description)
    }

    func testNegativeHour() {
        XCTAssertEqual("23:15", Clock(hours: -1, minutes: 15).description)
    }

    func testNegativeHourRollsOver() {
        XCTAssertEqual("23:00", Clock(hours: -25).description)
    }

    func testNegativeHourRollsOverContinuously() {
        XCTAssertEqual("05:00", Clock(hours: -91).description)
    }

    func testNegativeMinutes() {
        XCTAssertEqual("00:20", Clock(hours: 1, minutes: -40).description)
    }

    func testNegativeMinutesRollOver() {
        XCTAssertEqual("22:20", Clock(hours: 1, minutes: -160).description)
    }

    func testNegativeMinutesRollOverContinuously() {
        XCTAssertEqual("16:40", Clock(hours: 1, minutes: -4820).description)
    }

    func testNegativeHoursAndMinutesBothRollOverContinuously() {
        XCTAssertEqual("22:10", Clock(hours: -121, minutes: -5810).description)
    }

    // MARK: - Add: Test adding and subtracting minutes.

    func testAddMinutes() {
        let clock = Clock(hours: 10).add(minutes: 3)
        XCTAssertEqual("10:03", clock.description)
    }

    func testAddNoMinutes() {
        let clock = Clock(hours: 6, minutes: 41).add(minutes: 0)
        XCTAssertEqual("06:41", clock.description)
    }

    func testAddToNextHour() {
        let clock = Clock(hours: 0, minutes: 45).add(minutes: 40)
        XCTAssertEqual("01:25", clock.description)
    }

    func testAddMoreThanOneHour() {
        let clock = Clock(hours: 10).add(minutes: 61)
        XCTAssertEqual("11:01", String(describing: clock))
    }

    func testAddMoreThanTwoHoursWithCarry() {
        let clock = Clock(hours: 0, minutes: 45).add(minutes: 160)
        XCTAssertEqual("03:25", clock.description)
    }

    func testAddAcrossMidnight() {
        let clock = Clock(hours: 23, minutes: 59).add(minutes: 2)
        XCTAssertEqual("00:01", String(describing: clock))
    }

    func testAddMoreThanOneDay() {
        // (1500 min = 25 hrs)
        let clock = Clock(hours: 5, minutes: 32).add(minutes: 1500)
        XCTAssertEqual("06:32", String(describing: clock))
    }

    func testAddMoreThanTwoDays() {
        let clock = Clock(hours: 1, minutes: 1).add(minutes: 3500)
        XCTAssertEqual("11:21", String(describing: clock))
    }

    func testSubtractMinutes() {
        let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 3)
        XCTAssertEqual("10:00", String(describing: clock))
    }

    func testSubtractToPreviousHour() {
        let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 30)
        XCTAssertEqual("09:33", String(describing: clock))
    }

    func testSubtractMoreThanAnHour() {
        let clock = Clock(hours: 10, minutes: 3).subtract(minutes: 70)
        XCTAssertEqual("08:53", String(describing: clock))
    }

    func testSubtractAcrossMidnight() {
        let clock = Clock(hours: 0, minutes: 3).subtract(minutes: 4)
        XCTAssertEqual("23:59", String(describing: clock))
    }

    func testSubtractMoreThanTwoHours() {
        let clock = Clock(hours: 0, minutes: 0).subtract(minutes: 160)
        XCTAssertEqual("21:20", String(describing: clock))
    }

    func testSubtractMoreTHanTwoHoursWithBorrow() {
        let clock = Clock(hours: 6, minutes: 15).subtract(minutes: 160)
        XCTAssertEqual("03:35", String(describing: clock))
    }

    func testSubtractMoreThanOneDay() {
        // (1500 min = 25 hrs)
        let clock = Clock(hours: 5, minutes: 32).subtract(minutes: 1500)
        XCTAssertEqual("04:32", String(describing: clock))
    }

    func testSubtractMoreThanTwoDays() {
        let clock = Clock(hours: 2, minutes: 20).subtract(minutes: 3000)
        XCTAssertEqual("00:20", String(describing: clock))
    }

    // MARK: - Equal: Construct two separate clocks, set times, test if they are equal.

    func testClocksWithSameTime() {
        let clock1 = Clock(hours: 15, minutes: 37)
        let clock2 = Clock(hours: 15, minutes: 37)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksAMinuteApart() {
        let clock1 = Clock(hours: 15, minutes: 36)
        let clock2 = Clock(hours: 15, minutes: 37)
        XCTAssertNotEqual(clock1, clock2)
    }

    func testClocksAnHourApart() {
        let clock1 = Clock(hours: 14, minutes: 37)
        let clock2 = Clock(hours: 15, minutes: 37)
        XCTAssertNotEqual(clock1, clock2)
    }

    func testClocksWithHourOverflow() {
        let clock1 = Clock(hours: 10, minutes: 37)
        let clock2 = Clock(hours: 34, minutes: 37)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithHourOverflowBySeveralDays() {
        let clock1 = Clock(hours: 3, minutes: 11)
        let clock2 = Clock(hours: 99, minutes: 11)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithNegativeHour() {
        let clock1 = Clock(hours: 22, minutes: 40)
        let clock2 = Clock(hours: -2, minutes: 40)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithNegativeHourThatWraps() {
        let clock1 = Clock(hours: 17, minutes: 3)
        let clock2 = Clock(hours: -31, minutes: 3)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithNegativeHourThatWrapsMultipleTimes() {
        let clock1 = Clock(hours: 13, minutes: 49)
        let clock2 = Clock(hours: -83, minutes: 49)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithMinuteOverflow() {
        let clock1 = Clock(hours: 0, minutes: 1)
        let clock2 = Clock(hours: 0, minutes: 1441)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithMinuteOverflowBySeveralDays() {
        let clock1 = Clock(hours: 2, minutes: 2)
        let clock2 = Clock(hours: 2, minutes: 4322)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithNegativeMinute() {
        let clock1 = Clock(hours: 2, minutes: 40)
        let clock2 = Clock(hours: 3, minutes: -20)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithNegativeMinuteThatWraps() {
        let clock1 = Clock(hours: 4, minutes: 10)
        let clock2 = Clock(hours: 5, minutes: -1490)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithNegativeMinuteThatWrapsMultipleTimes() {
        let clock1 = Clock(hours: 6, minutes: 15)
        let clock2 = Clock(hours: 6, minutes: -4305)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithNegativeHoursAndMinutes() {
        let clock1 = Clock(hours: 7, minutes: 32)
        let clock2 = Clock(hours: -12, minutes: -268)
        XCTAssertEqual(clock1, clock2)
    }

    func testClocksWithNegativeHoursAndMinutesThatWrap() {
        let clock1 = Clock(hours: 18, minutes: 7)
        let clock2 = Clock(hours: -54, minutes: -11513)
        XCTAssertEqual(clock1, clock2)
    }

    static var allTests: [(String, (ClockTests) -> () throws -> Void)] {
        return [
            ("testOnTheHour", testOnTheHour),
            ("testPastTheHour", testPastTheHour),
            ("testMidnightIsZeroHours", testMidnightIsZeroHours),
            ("testHourRollsOver", testHourRollsOver),
            ("testHourRollsOverContinuously", testHourRollsOverContinuously),
            ("testSixtyMinutesIsNextHour", testSixtyMinutesIsNextHour),
            ("testMinutesRollOver", testMinutesRollOver),
            ("testMinutesRollOverContinuously", testMinutesRollOverContinuously),
            ("testHoursAndMinutesRollOver", testHoursAndMinutesRollOver),
            ("testHoursAndMinutesRollOverToExactlyMidnight", testHoursAndMinutesRollOverToExactlyMidnight),
            ("testNegativeHour", testNegativeHour),
            ("testNegativeHourRollsOver", testNegativeHourRollsOver),
            ("testNegativeHourRollsOverContinuously", testNegativeHourRollsOverContinuously),
            ("testNegativeMinutes", testNegativeMinutes),
            ("testNegativeMinutesRollOver", testNegativeMinutesRollOver),
            ("testNegativeMinutesRollOverContinuously", testNegativeMinutesRollOverContinuously),
            ("testNegativeHoursAndMinutesBothRollOverContinuously", testNegativeHoursAndMinutesBothRollOverContinuously),
            ("testAddMinutes", testAddMinutes),
            ("testAddNoMinutes", testAddNoMinutes),
            ("testAddToNextHour", testAddToNextHour),
            ("testAddMoreThanOneHour", testAddMoreThanOneHour),
            ("testAddMoreThanTwoHoursWithCarry", testAddMoreThanTwoHoursWithCarry),
            ("testAddAcrossMidnight", testAddAcrossMidnight),
            ("testAddMoreThanOneDay", testAddMoreThanOneDay),
            ("testAddMoreThanTwoDays", testAddMoreThanTwoDays),
            ("testSubtractMinutes", testSubtractMinutes),
            ("testSubtractToPreviousHour", testSubtractToPreviousHour),
            ("testSubtractMoreThanAnHour", testSubtractMoreThanAnHour),
            ("testSubtractAcrossMidnight", testSubtractAcrossMidnight),
            ("testSubtractMoreThanTwoHours", testSubtractMoreThanTwoHours),
            ("testSubtractMoreTHanTwoHoursWithBorrow", testSubtractMoreTHanTwoHoursWithBorrow),
            ("testSubtractMoreThanOneDay", testSubtractMoreThanOneDay),
            ("testSubtractMoreThanTwoDays", testSubtractMoreThanTwoDays),
            ("testClocksWithSameTime", testClocksWithSameTime),
            ("testClocksAMinuteApart", testClocksAMinuteApart),
            ("testClocksAnHourApart", testClocksAnHourApart),
            ("testClocksWithHourOverflow", testClocksWithHourOverflow),
            ("testClocksWithHourOverflowBySeveralDays", testClocksWithHourOverflowBySeveralDays),
            ("testClocksWithNegativeHour", testClocksWithNegativeHour),
            ("testClocksWithNegativeHourThatWraps", testClocksWithNegativeHourThatWraps),
            ("testClocksWithNegativeHourThatWrapsMultipleTimes", testClocksWithNegativeHourThatWrapsMultipleTimes),
            ("testClocksWithMinuteOverflow", testClocksWithMinuteOverflow),
            ("testClocksWithMinuteOverflowBySeveralDays", testClocksWithMinuteOverflowBySeveralDays),
            ("testClocksWithNegativeMinute", testClocksWithNegativeMinute),
            ("testClocksWithNegativeMinuteThatWraps", testClocksWithNegativeMinuteThatWraps),
            ("testClocksWithNegativeMinuteThatWrapsMultipleTimes", testClocksWithNegativeMinuteThatWrapsMultipleTimes),
            ("testClocksWithNegativeHoursAndMinutes", testClocksWithNegativeHoursAndMinutes),
            ("testClocksWithNegativeHoursAndMinutesThatWrap", testClocksWithNegativeHoursAndMinutesThatWrap),
        ]
    }
}
