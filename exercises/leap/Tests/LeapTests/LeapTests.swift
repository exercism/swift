import XCTest
@testable import Leap

class LeapTests: XCTestCase {

    func testVanillaLeapYear() {
        let year = Year(calendarYear: 1996)
        XCTAssertTrue(year.isLeapYear)
    }

    func testAnyOldYear() {
        let year = Year(calendarYear: 1997)
        XCTAssertFalse(year.isLeapYear)
    }

    func testCentury() {
        let year = Year(calendarYear: 1900)
        XCTAssertFalse(year.isLeapYear)
    }

    func testExceptionalCentury() {
        let year = Year(calendarYear: 2400)
        XCTAssertTrue(year.isLeapYear)
    }

    static var allTests: [(String, (LeapTests) -> () throws -> Void)] {
        return [
            ("testVanillaLeapYear", testVanillaLeapYear),
            ("testAnyOldYear", testAnyOldYear),
            ("testCentury", testCentury),
            ("testExceptionalCentury", testExceptionalCentury),
        ]
    }
}
