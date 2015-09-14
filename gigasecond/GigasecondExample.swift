import Foundation

// Apple Swift version 2.0

struct Gigasecond{
    
    static func newDate(input:String, format:String = "yyyy-MM-dd'T'HH:mm:ss" ) -> NSDate{
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() 
    }
    
    static func from(dateInString:String) -> NSDate{
        
        let dateIn = newDate(dateInString)
        
        return dateIn.dateByAddingTimeInterval(1_000_000_000)
        
    }
    
}