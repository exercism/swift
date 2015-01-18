import XCTest
import UIKit

class  MeetupTest: XCTestCase {
    
    
    enum DayOfWeek:Int{
        case Sunday = 1, Monday,Tuesday,Wednesday,Thursday,Friday,Saturday
    }
    
    let whichOptions = (first:"1st", second:"2nd", third:"3rd", forth:"4th", last:"last",teenth:"teenth")
    
    
//    func stringToDate(input:String) -> NSDate?{
//        var dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "YYYY-MM-dd"
//        return dateFormatter.dateFromString(input)
//    }

    
    
    
//    def test_monteenth_of_may_2013(self):
//    self.assertEqual(date(2013, 5, 13),
//    meetup_day(2013, 5, 'Monday', 'teenth'))
    
    func test_monteenth_of_may_2013(){
        var meetUp = Meetup(year: 2013, month: 5)
      XCTAssertTrue("2013-5-13" ==  meetUp.day(DayOfWeek.Monday.rawValue, which: whichOptions.teenth))
    }
    
//
//    def test_saturteenth_of_february_2013(self):
//    self.assertEqual(date(2013, 2, 16),
//    meetup_day(2013, 2, 'Saturday', 'teenth'))
    
    func test_saturteenth_of_february_2013(){
        var meetUp = Meetup(year: 2013, month: 2)
        XCTAssertTrue("2013-2-16" == meetUp.day(DayOfWeek.Saturday.rawValue, which: whichOptions.teenth))
    }
//    
//    def test_first_tuesday_of_may_2013(self):
//    self.assertEqual(date(2013, 5, 7),
//    meetup_day(2013, 5, 'Tuesday', '1st'))
    
    
    func test_first_tuesday_of_may_2013(){
        var meetUp = Meetup(year: 2013, month: 5)
        XCTAssertTrue("2013-5-7" == meetUp.day(DayOfWeek.Tuesday.rawValue, which: whichOptions.first))
    }
    
//    
//    def test_second_monday_of_april_2013(self):
//    self.assertEqual(date(2013, 4, 8),
//    meetup_day(2013, 4, 'Monday', '2nd'))
    func test_second_monday_of_april_2013(){
        var meetUp = Meetup(year: 2013, month: 4)
        
        XCTAssertTrue("2013-4-8" == meetUp.day(DayOfWeek.Monday.rawValue, which: whichOptions.second))

    }
    
//    
//    def test_third_thursday_of_september_2013(self):
//    self.assertEqual(date(2013, 9, 19),
//    meetup_day(2013, 9, 'Thursday', '3rd'))
    
    func test_third_thursday_of_september_2013(){
        var meetUp = Meetup(year: 2013, month: 9)
         XCTAssertTrue("2013-9-19" == meetUp.day(DayOfWeek.Thursday.rawValue, which: whichOptions.third))
        
    }
//    
//    def test_fourth_sunday_of_march_2013(self):
//    self.assertEqual(date(2013, 3, 24),
//    meetup_day(2013, 3, 'Sunday', '4th'))
    
    func test_fourth_sunday_of_march_2013(){
        var meetUp = Meetup(year: 2013, month: 3)
        XCTAssertTrue("2013-3-24" == meetUp.day(DayOfWeek.Sunday.rawValue, which: whichOptions.forth))
        
    }
//    
//    def test_last_thursday_of_october_2013(self):
//    self.assertEqual(date(2013, 10, 31),
//    meetup_day(2013, 10, 'Thursday', 'last'))
    
    func test_last_thursday_of_october_2013(){
        var meetUp = Meetup(year: 2013, month: 10)
        XCTAssertTrue("2013-10-31" == meetUp.day(DayOfWeek.Thursday.rawValue, which: whichOptions.last))
        
    }
//    
//    def test_last_wednesday_of_february_2012(self):
//    self.assertEqual(date(2012, 2, 29),
//    meetup_day(2012, 2, 'Wednesday', 'last'))
    
    func test_last_wednesday_of_february_2012(){
        var meetUp = Meetup(year: 2012, month: 2)
        XCTAssertTrue("2012-2-29" == meetUp.day(DayOfWeek.Wednesday.rawValue, which: whichOptions.last))}
//    
//    def test_first_friday_of_december_2012(self):
//    self.assertEqual(date(2012, 12, 7),
//    meetup_day(2012, 12, 'Friday', '1st'))
    
    func test_first_friday_of_december_2012(){
        var meetUp = Meetup(year: 2012, month: 12)
        XCTAssertTrue("2012-12-7" == meetUp.day(DayOfWeek.Friday.rawValue, which: whichOptions.first)
        )}


    
}
