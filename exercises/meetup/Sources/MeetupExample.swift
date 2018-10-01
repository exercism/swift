import Foundation

func == (lhs: String, rhs: Date) -> Bool {
    return lhs == rhs.description
}

func == (lhs: Date, rhs: Date) -> Bool {
    return lhs.description == rhs.description
}
struct Date {

    enum DateFormatingOption {
        case yyyyMMdd
        case yyyyMMddTHHmmss
    }

    var descriptionStyle: DateFormatingOption = .yyyyMMdd

    fileprivate var tmDateBacking: tm = tm()

    var year: Int32 { return tmDateBacking.tm_year + 1900 }
    var month: Int32 { return tmDateBacking.tm_mon + 1 }
    var day: Int32 { return tmDateBacking.tm_mday }
    var hour: Int32 { return tmDateBacking.tm_hour }
    var mins: Int32 { return tmDateBacking.tm_min }
    var secs: Int32 { return tmDateBacking.tm_sec }
    var weekday: Int32 { return tmDateBacking.tm_wday + 1 }

    @discardableResult
    init(_ input: tm) {
        self.tmDateBacking = input
    }

    init() {
        let temp = tm()
        Date.init(temp)
    }

    init(year: Int32, month: Int32, day: Int32, hour: Int32 = 0, mins: Int32 = 0, secs: Int32 = 0) {
        var date = tm()
        date.tm_year = year - 1900
        date.tm_mon = month - 1
        date.tm_mday = day
        date.tm_hour = hour
        date.tm_min = mins
        date.tm_sec = secs

        // Automaticly sets the week day
        var d1 = timegm(&date)
        self.tmDateBacking = gmtime(&d1).pointee
    }

    mutating func dateByAddingSeconds(_ seconds: Int) -> Date {
        var d1 = timegm(&tmDateBacking) + seconds
        let d2 = gmtime(&d1).pointee
        return Date.init(d2)
    }

}

extension Date: CustomStringConvertible {
    private func addLeadingZero(_ input: Int32) -> String {

        if (0...9).contains(input) {
            return "0\(input)" } else { return String(input) }
    }

    var description: String {

        let date = [year, month, day, hour, mins, secs].map { addLeadingZero($0) }

        let dateOnly = date[0] + "-" + date[1] + "-" + date[2]
        let dateTime = dateOnly + "T" + date[3] + ":" + date[4] + ":" + date[5]

        switch descriptionStyle {
        case .yyyyMMdd            : return dateOnly
        case .yyyyMMddTHHmmss : return dateTime
        }
    }
}

extension Date {

    init?(from: String) {
        guard let date = Date.dateFromString(from) else { return nil }
        tmDateBacking = date.tmDateBacking
        if from.count > 10 {
            self.descriptionStyle = .yyyyMMddTHHmmss
        }
    }

    static func dateFromString(_ input: String) -> Date? {
        var year = Int32()
        var month = Int32()
        var day = Int32()
        var hour = Int32()
        var minute = Int32()
        var second = Int32()

        let dateTime = input.split(separator: "T").map { String($0) }
        let date = dateTime[0].split(separator: "-").map { String($0) }
        if date.count == 3 {
            year = Int32(date[0]) ?? 0
            month = Int32(date[1]) ?? 0
            day = Int32(date[2]) ?? 0
        }

        if dateTime.count == 2 {
            let time = dateTime[1].split(separator: ":").map { String($0) }
            if time.count == 3 {
                hour = Int32(time[0]) ?? 0
                minute = Int32(time[1]) ?? 0
                second = Int32(time[2]) ?? 0

            } }
        if year + month + day >= 3 {
            return Date(year: year, month: month, day: day, hour: hour, mins: minute, secs: second)

        } else { return nil }
    }
}

struct Meetup {
    private var dateStart = Date()
    private var dateEnd = Date()
    func newDate(_ input: String) -> Date {

        return Date(from: input) ?? Date()
    }

    func day(_ dayOfTheWeek: Int, which: String) -> Date {
        var dateMonthWeekDays = [[Int32(), Int32()]]
        var dateWeekDays = [Int32()]

        let starDay = dateStart.weekday
        var month = Array(dateStart.day ... dateEnd.day)
        month =  month.map { (($0 + 5 + starDay) % 7) + 1 }

        for (index, eachDay) in month.enumerated() {
            dateMonthWeekDays.append([Int32(index + 1), eachDay])
            dateWeekDays.append(eachDay)}

        func which2date(_ dateInput: String) -> Date {

            if which == "teenth" {
                let teenthRange = Array(dateMonthWeekDays[13...19])
                let teenth = teenthRange.filter({ $0[1] == Int32(dayOfTheWeek) })[0][0]
                return Date(from: "\(dateStart.year)-\(dateStart.month)-\(teenth)") ?? Date()

            }
            let count =  dateMonthWeekDays.filter({ $0[1] == Int32(dayOfTheWeek) }).count
            var dayIndex: Int = 0
            switch dateInput {
            case "1st": dayIndex = 0
            case "2nd": dayIndex = 1
            case "3rd": dayIndex = 2
            case "4th": dayIndex = 3
            case "5th": dayIndex = 4
            case "last": dayIndex = (count - 1)
            default: dayIndex = -1
            }

            let first2last = dateMonthWeekDays.filter({ $0[1] == Int32(dayOfTheWeek) })[dayIndex][0]

            return Date(from:"\(dateStart.year)-\(dateStart.month)-\(first2last)") ?? Date()
        }

        return which2date(which)
    }

    init(year: Int, month: Int) {
        let meetDate1 = Date(from: "\(year)-\(month)-\(1)") ?? Date()
        var meetDate2 = Date(from: "\(year)-\(month+1)-\(1)") ?? Date()
        meetDate2 = meetDate2.dateByAddingSeconds(-1*24*60*60)
        self.dateStart = meetDate1
        self.dateEnd = meetDate2

    }
}
