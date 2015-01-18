import Foundation


struct Meetup{
    
    private var dateStart:NSDate
    private var dateEnd:NSDate = NSDate()
    private var dateComponentsStart:NSDateComponents
    private var dateComponentsEnd:NSDateComponents
    private var dateMonthWeekDays = [[Int(),Int()]]
    private var dateWeekDays = [Int()]
    
    
    mutating func day(day_of_the_week:Int, which:String) -> String{
        let starDay = dateComponentsStart.weekday
        var month = Array(dateComponentsStart.day...dateComponentsEnd.day).map({(($0 + 5 + starDay) % 7) + 1  })
        
        for (index , eachDay) in enumerate(month){
            dateMonthWeekDays.append([index + 1,eachDay])
            dateWeekDays.append(eachDay)
        }
        
        
        
        if which == "1st"{
            return "\(dateComponentsStart.year)-\(dateComponentsStart.month)-\((find(dateWeekDays, day_of_the_week ) ?? 0 ))"
        }
        
        if which == "2nd"{
            let second = dateMonthWeekDays.filter({$0[1] == day_of_the_week })[1][0]
             return "\(dateComponentsStart.year)-\(dateComponentsStart.month)-\(second )"
        }
        
        if which == "3rd"{
            let third = dateMonthWeekDays.filter({$0[1] == day_of_the_week })[2][0]
            return "\(dateComponentsStart.year)-\(dateComponentsStart.month)-\(third )"
        }
        
        if which == "4th"{
            let forth = dateMonthWeekDays.filter({$0[1] == day_of_the_week })[3][0]
            return "\(dateComponentsStart.year)-\(dateComponentsStart.month)-\(forth )"
        }
        
        
        if which == "last"{
            
            let count =  dateMonthWeekDays.filter({$0[1] == day_of_the_week }).count
            
            let last = dateMonthWeekDays.filter({$0[1] == day_of_the_week })[count-1][0]
            return "\(dateComponentsStart.year)-\(dateComponentsStart.month)-\(last )"
        }
        
        if which == "teenth"{

            let teenthRange = Array(dateMonthWeekDays[13...19])

            let last = teenthRange.filter({$0[1] == day_of_the_week })[0][0]
            
            return "\(dateComponentsStart.year)-\(dateComponentsStart.month)-\(last )"
        }
        
        
        
        return ""
        
    }

    
    init(year:Int, month:Int){
        
        var calendar = NSCalendar.currentCalendar()
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        var meetDate1 = (dateFormatter.dateFromString("\(year)-\(month)-\(1)") ?? NSDate())
        var meetDate2 = (dateFormatter.dateFromString("\(year)-\(month+1)-\(1)") ?? NSDate())
        meetDate2 = meetDate2.dateByAddingTimeInterval(-1*24*60*60)
        
        let componetCalendarUnits = NSCalendarUnit.CalendarUnitEra |
            NSCalendarUnit.CalendarUnitYear |
            NSCalendarUnit.CalendarUnitMonth |
            NSCalendarUnit.CalendarUnitDay |
            NSCalendarUnit.CalendarUnitHour |
            NSCalendarUnit.CalendarUnitMinute |
            NSCalendarUnit.CalendarUnitSecond |
            NSCalendarUnit.CalendarUnitWeekday |
            NSCalendarUnit.CalendarUnitWeekdayOrdinal |
            NSCalendarUnit.CalendarUnitQuarter |
            NSCalendarUnit.CalendarUnitWeekOfMonth |
            NSCalendarUnit.CalendarUnitWeekOfYear |
            NSCalendarUnit.CalendarUnitYearForWeekOfYear |
            NSCalendarUnit.CalendarUnitNanosecond |
            NSCalendarUnit.CalendarUnitCalendar |
            NSCalendarUnit.CalendarUnitTimeZone
        
        var components1 = calendar.components(componetCalendarUnits
            , fromDate: meetDate1)
        
        var components2 = calendar.components(componetCalendarUnits            , fromDate: meetDate2)
        

        
        self.dateComponentsStart = components1
        self.dateComponentsEnd = components2
        self.dateStart = meetDate1
        self.dateEnd = meetDate2
        

    }
}

// Not used Function
//    private func int2weekday(input:Int)->String {
//        if contains(lazy(1...7), input) {
//           return (NSDateFormatter().weekdaySymbols as [String])[input-1]
//        }
//
//       return "Invalid"
//    }

// Not used function

//    static func stringToDate(input:String) -> NSDate?{
//        var dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "YYYY-MM-dd"
//        return dateFormatter.dateFromString(input)
//    }