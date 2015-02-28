import XCTest

//Test for Protocols: Printable, Equatable, Comparable

class ClockTest: XCTestCase {
    
    func test_on_the_hour(){
    XCTAssertEqual("08:00", Clock(hours: 8).description )
    XCTAssertEqual("09:00", Clock(hours: 9).description )}
    
    func test_past_the_hour(){
    XCTAssertEqual("11:09", Clock(hours: 11, minutes: 9).description )}
    
    func test_add_a_few_minutes(){
    var clock = Clock(hours: 10).add(minutes: 3)
    XCTAssertEqual("10:03", clock.description )}
    
    func test_add_over_an_hour(){
    var clock = Clock(hours: 10).add(minutes: 61)
    XCTAssertEqual("11:01", String(clock) )}
    
    func test_wrap_around_at_midnight(){
    var clock = Clock(hours: 23, minutes: 30).add(minutes:60)
    XCTAssertEqual("00:30", String(clock) )}
    
    func test_subtract_minutes(){
    var clock = Clock(hours: 10).subtract(minutes: 90)
    XCTAssertEqual("08:30", String(clock) )}
    
    func test_equivalent_clocks(){
    var clock1 = Clock(hours: 15, minutes: 37)
    var clock2 = Clock(hours: 15, minutes: 36).add(minutes: 2).subtract(minutes: 1)
    XCTAssertEqual(clock1, clock2 )}
    
    func test_lessThan_clocks(){
    var clock1 = Clock(hours: 15, minutes: 37)
    var clock2 = Clock(hours: 15, minutes: 36)
    var clock3 = Clock(hours: 14, minutes: 37)
        XCTAssertLessThan(clock2, clock1)
        XCTAssertLessThan(clock3, clock2) }
    
    
    func test_greaterThan_clocks(){
        var clock1 = Clock(hours: 15, minutes: 37)
        var clock2 = Clock(hours: 15, minutes: 36)
        var clock3 = Clock(hours: 14, minutes: 37)
        XCTAssertGreaterThan(clock1, clock2)
        XCTAssertGreaterThan(clock2, clock3) }
    
    
    func test_wrap_around_backwards(){
    var clock = Clock(hours: 0, minutes: 30).subtract(minutes: 60)
    XCTAssertEqual("23:30", String(clock) )}
    
    
}
