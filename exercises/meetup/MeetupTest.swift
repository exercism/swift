import XCTest



class  MeetupTest: XCTestCase {
    
    let dayOfWeek = (Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Thursday:5, Friday:6, Saturday:7)
    
    let whichOptions = (first:"1st", second:"2nd", third:"3rd", fourth:"4th", last:"last",teenth:"teenth")
    
    
    func testMonteenthOfMay2013() {
        let meetUp = Meetup(year: 2013, month: 5)
        XCTAssertEqual("2013-05-13",  meetUp.day(dayOfWeek.Monday, which: whichOptions.teenth).description)
    }
    
    func testSaturteenthOfFebruary2013() {
        let meetUp = Meetup(year: 2013, month: 2)
        XCTAssertEqual ("2013-02-16", meetUp.day(dayOfWeek.Saturday, which: whichOptions.teenth).description)
    }
    
    func testFirstTuesdayOfMay2013() {
        let meetUp = Meetup(year: 2013, month: 5)
        XCTAssertEqual("2013-05-07", meetUp.day(dayOfWeek.Tuesday, which: whichOptions.first).description)
    }
    
    func testSecondMondayOfApril2013() {
        let meetUp = Meetup(year: 2013, month: 4)
        XCTAssertEqual("2013-04-08", meetUp.day(dayOfWeek.Monday, which: whichOptions.second).description)
    }
    
    func testThirdThursdayOfSeptember2013() {
        let meetUp = Meetup(year: 2013, month: 9)
        XCTAssertEqual("2013-09-19", meetUp.day(dayOfWeek.Thursday, which: whichOptions.third).description)
    }
    
    func testFourthSundayOfMarch2013() {
        let meetUp = Meetup(year: 2013, month: 3)
        XCTAssertEqual("2013-03-24", meetUp.day(dayOfWeek.Sunday, which: whichOptions.fourth).description)
    }
    
    func testLastThursdayOfOctober2013() {
        let meetUp = Meetup(year: 2013, month: 10)
        XCTAssertEqual("2013-10-31", meetUp.day(dayOfWeek.Thursday, which: whichOptions.last).description)
    }
    
    func testLastWednesdayOfFebruary2012() {
        let meetUp = Meetup(year: 2012, month: 2)
        XCTAssertEqual("2012-02-29", meetUp.day(dayOfWeek.Wednesday, which: whichOptions.last).description)
    }
    
    func testFirstFridayOfDecember2012() {
        let meetUp = Meetup(year: 2012, month: 12)
        XCTAssertEqual("2012-12-07", meetUp.day(dayOfWeek.Friday, which: whichOptions.first).description)
    }
    
    
}
