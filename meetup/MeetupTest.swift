import XCTest
import UIKit

class  MeetupTest: XCTestCase {
    
    func newDate(input:String) -> NSDate{
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() as NSDate
    }
    
    
    let dayOfWeek = (Sunday:1, Monday:2,Tuesday:3,Wednesday:4,Thursday:5,Friday:6,Saturday:7)
    
    let whichOptions = (first:"1st", second:"2nd", third:"3rd", forth:"4th", last:"last",teenth:"teenth")
    
    
    func test_monteenth_of_may_2013(){
        var meetUp = Meetup(year: 2013, month: 5)
        XCTAssertEqual(newDate("2013-5-13"),  meetUp.day(dayOfWeek.Monday, which: whichOptions.teenth))
    }
    
    
    func test_saturteenth_of_february_2013(){
        var meetUp = Meetup(year: 2013, month: 2)
        XCTAssertEqual(newDate("2013-2-16"), meetUp.day(dayOfWeek.Saturday, which: whichOptions.teenth))
    }
    
    
    func test_first_tuesday_of_may_2013(){
        var meetUp = Meetup(year: 2013, month: 5)
        XCTAssertEqual(newDate("2013-5-7"), meetUp.day(dayOfWeek.Tuesday, which: whichOptions.first))
    }
    
    
    func test_second_monday_of_april_2013(){
        var meetUp = Meetup(year: 2013, month: 4)
        XCTAssertEqual(newDate("2013-4-8"), meetUp.day(dayOfWeek.Monday, which: whichOptions.second))
    }
    
    
    func test_third_thursday_of_september_2013(){
        var meetUp = Meetup(year: 2013, month: 9)
        XCTAssertEqual(newDate("2013-9-19"), meetUp.day(dayOfWeek.Thursday, which: whichOptions.third))
    }
    
    
    func test_fourth_sunday_of_march_2013(){
        var meetUp = Meetup(year: 2013, month: 3)
        XCTAssertEqual(newDate("2013-3-24"), meetUp.day(dayOfWeek.Sunday, which: whichOptions.forth))
    }
    
    
    func test_last_thursday_of_october_2013(){
        var meetUp = Meetup(year: 2013, month: 10)
        XCTAssertEqual(newDate("2013-10-31"), meetUp.day(dayOfWeek.Thursday, which: whichOptions.last))
    }
    
    
    func test_last_wednesday_of_february_2012(){
        var meetUp = Meetup(year: 2012, month: 2)
        XCTAssertEqual(newDate("2012-2-29"), meetUp.day(dayOfWeek.Wednesday, which: whichOptions.last))}
    
    func test_first_friday_of_december_2012(){
        var meetUp = Meetup(year: 2012, month: 12)
        XCTAssertEqual(newDate("2012-12-7"), meetUp.day(dayOfWeek.Friday, which: whichOptions.first)
        )}
    
    
}
