import XCTest

//Test for Protocols: Printable, Equatable, Comparable

class ClockTest: XCTestCase {
    
    func testOnTheHour() {
        XCTAssertEqual("08:00", Clock(hours: 8).description)
        XCTAssertEqual("09:00", Clock(hours: 9).description)
    }
    
    func testPastTheHour() {
        XCTAssertEqual("11:09", Clock(hours: 11, minutes: 9).description)
    }
    
    func testAddAFewMinutes() {
        var clock = Clock(hours: 10).add(minutes: 3)
        XCTAssertEqual("10:03", clock.description)
    }
    
    func testAddOverAnHour() {
        var clock = Clock(hours: 10).add(minutes: 61)
        XCTAssertEqual("11:01", String(clock))
    }
    
    func testWrapAroundAtMidnight() {
        var clock = Clock(hours: 23, minutes: 30).add(minutes:60)
        XCTAssertEqual("00:30", String(clock))
    }
    
    func testSubtractMinutes() {
        var clock = Clock(hours: 10).subtract(minutes: 90)
        XCTAssertEqual("08:30", String(clock))
    }
    
    func testEquivalentClocks() {
        var clock1 = Clock(hours: 15, minutes: 37)
        var clock2 = Clock(hours: 15, minutes: 36).add(minutes: 2).subtract(minutes: 1)
        XCTAssertEqual(clock1, clock2 )
    }
    
    func testLessThanClocks() {
        var clock1 = Clock(hours: 15, minutes: 37)
        var clock2 = Clock(hours: 15, minutes: 36)
        var clock3 = Clock(hours: 14, minutes: 37)
        XCTAssertLessThan(clock2, clock1)
        XCTAssertLessThan(clock3, clock2)
    }
    
    
    func testGreaterThanClocks() {
        var clock1 = Clock(hours: 15, minutes: 37)
        var clock2 = Clock(hours: 15, minutes: 36)
        var clock3 = Clock(hours: 14, minutes: 37)
        XCTAssertGreaterThan(clock1, clock2)
        XCTAssertGreaterThan(clock2, clock3)
    }
    
    
    func testWrapAroundBackwards() {
        var clock = Clock(hours: 0, minutes: 30).subtract(minutes: 60)
        XCTAssertEqual("23:30", String(clock))
    }
    
}
