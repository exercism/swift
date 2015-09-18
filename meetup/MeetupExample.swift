import Foundation

// Apple Swift version 2.0

extension NSDate{
    var dateString:String {
        
        var toReturn = ""
        
        for (idx, each) in description.characters.enumerate() where idx < 10{
            toReturn.append(each)
        }
        return toReturn
    }
    
}

func == (lhs: String, rhs: NSDate) -> Bool {
    return lhs == rhs.dateString
}


struct Meetup{
    private var dateStart:NSDate
    private var dateEnd:NSDate = NSDate()
    private var dateComponentsStart:NSDateComponents
    private var dateComponentsEnd:NSDateComponents
    private var dateMonthWeekDays = [[Int(),Int()]]
    private var dateWeekDays = [Int()]
    
    func newDate(input:String) -> NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() 
    }
    
    mutating func day(day_of_the_week:Int, which:String) -> NSDate{
        let starDay = dateComponentsStart.weekday
        var month = Array(dateComponentsStart.day...dateComponentsEnd.day).map({(($0 + 5 + starDay) % 7) + 1  })
        
        for (index , eachDay) in month.enumerate(){
            dateMonthWeekDays.append([index + 1,eachDay])
            dateWeekDays.append(eachDay)}
        
        func which2date(dateInput:String)->NSDate{
            
            if which == "teenth" {
                let teenthRange = Array(dateMonthWeekDays[13...19])
                let teenth = teenthRange.filter({$0[1] == day_of_the_week })[0][0]
                return newDate("\(dateComponentsStart.year)-\(dateComponentsStart.month)-\(teenth)")
                
            }
            let count =  dateMonthWeekDays.filter({$0[1] == day_of_the_week }).count
            var dayIndex:Int = 0
            switch dateInput{
            case "1st": dayIndex = 0
            case "2nd": dayIndex = 1
            case "3rd": dayIndex = 2
            case "4th": dayIndex = 3
            case "5th": dayIndex = 4
            case "last": dayIndex = (count - 1)
            default: dayIndex = -1
            }
            
            let first2last = dateMonthWeekDays.filter({$0[1] == day_of_the_week })[dayIndex][0] ?? 0
            
            return newDate("\(dateComponentsStart.year)-\(dateComponentsStart.month)-\(first2last)")
        }
        
        return which2date(which)
    }
    
    init(year:Int, month:Int){
        let calendar = NSCalendar.currentCalendar()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let meetDate1 = (dateFormatter.dateFromString("\(year)-\(month)-\(1)") ?? NSDate())
        var meetDate2 = (dateFormatter.dateFromString("\(year)-\(month+1)-\(1)") ?? NSDate())
        
        meetDate2 = meetDate2.dateByAddingTimeInterval(-1*24*60*60)
        let componetCalendarUnits: NSCalendarUnit = [NSCalendarUnit.Era, NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Weekday]
        
        let components1 = calendar.components(componetCalendarUnits
            , fromDate: meetDate1)
        
        let components2 = calendar.components(componetCalendarUnits            , fromDate: meetDate2)
        
        self.dateComponentsStart = components1
        self.dateComponentsEnd = components2
        self.dateStart = meetDate1
        self.dateEnd = meetDate2
        
    }
}
