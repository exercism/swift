import XCTest


class GigasecondTest: XCTestCase {
    
    func newDateWithTime(input:String) -> NSDate{
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() as NSDate
    }
    
    
    func test_1 (){
        var gs = Gigasecond.from("2011-4-25T00:00:00")
            XCTAssertEqual(newDateWithTime("2043-01-01T01:46:40"), gs)
    }
    
    func test_2 (){
        var gs = Gigasecond.from("1977-6-13T00:00:00")
            XCTAssertEqual(newDateWithTime("2009-02-19T01:46:40"), gs)
    }
    
    func test_3 (){
        var gs = Gigasecond.from("1959-7-19T00:00:00")
            XCTAssertEqual(newDateWithTime("1991-03-27T01:46:40"), gs)
    }
    
    func test_time_with_seconds (){
        var gs = Gigasecond.from("1959-7-20T00:00:00").dateByAddingTimeInterval(-1)
        XCTAssertEqual(newDateWithTime("1991-3-28T01:46:39"), gs)
    }
    
 }

