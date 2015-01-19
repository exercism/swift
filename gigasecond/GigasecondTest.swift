import XCTest


class GigasecondTest: XCTestCase {
    
    func newDate(input:String) -> NSDate{
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() as NSDate
    }
    
    func dateString(input:NSDate) ->String{
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.stringFromDate(input) ?? "4001-01-01"
    }
    
    
    func test_1 (){
        var gs = Gigasecond.from(newDate("2011-4-25"))
            XCTAssertTrue(dateString(newDate("2043-1-1")) == dateString(gs))
    }
    
    func test_2 (){
        var gs = Gigasecond.from(newDate("1977-6-13"))
            XCTAssertTrue(dateString(newDate("2009-2-19")) == dateString(gs))
    }
    
    func test_3 (){
        var gs = Gigasecond.from(newDate("1959-7-19"))
            XCTAssertTrue(dateString(newDate("1991-3-27")) == dateString(gs))
    }
    
    func test_time_with_seconds (){
        var date = newDate("1959-7-20").dateByAddingTimeInterval(-1)
        var gs = Gigasecond.from(date)
        XCTAssertTrue(dateString(newDate("1991-3-28")) == dateString(gs))
    }
    
 }

