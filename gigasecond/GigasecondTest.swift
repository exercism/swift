import XCTest


class GigasecondTest: XCTestCase {
    
    func newDateWithTime(input:String) -> NSDate{
        var dateFormatter = NSDateFormatter()
        let Z = ( NSTimeZone.defaultTimeZone().secondsFromGMT / 60 / 60)
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.\(Z)"
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() as NSDate
    }
    
    
    func test_1 (){
        var gs = Gigasecond.from("2011-4-25")
            XCTAssertTrue(newDateWithTime("2043-01-01T10:46:40") == gs)
    }
    
    func test_2 (){
        var gs = Gigasecond.from("1977-6-13")
            XCTAssertTrue(newDateWithTime("2009-02-19T10:46:40") == gs)
    }
    
    func test_3 (){
        var gs = Gigasecond.from("1959-7-19")
            XCTAssertTrue(newDateWithTime("1991-03-27T10:46:40") == gs)
    }
    
    func test_time_with_seconds (){
        var gs = Gigasecond.from("1959-7-20").dateByAddingTimeInterval(-1)
        XCTAssertTrue(newDateWithTime("1991-3-28T00:46:39") == gs)
    }
    
 }

