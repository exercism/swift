import Foundation

private extension tm {

    var year: Int32 { return tm_year + 1900 }

    var month: Int32 { return tm_mon + 1 }

    var day: Int32 { return tm_mday }

    var time:(hour: Int32, mins: Int32, secs: Int32) {
        return (hour: tm_hour, mins: tm_min, secs:tm_sec)
    }

    init(year: Int32, month: Int32, day: Int32, hour: Int32 = 0, mins: Int32 = 0, secs: Int32 = 0) {
        self.init()
        self.tm_year = year - 1900
        self.tm_mon = month - 1
        self.tm_mday = day
        self.tm_hour = hour
        self.tm_min = mins
        self.tm_sec = secs

    }

    mutating func dateByAddingSeconds(_ seconds: Int) -> tm {
        var d1 = timegm(&self) + seconds
        return gmtime(&d1).pointee
    }

    private func addLeadingZero(_ input: Int32) -> String {
        var addZero = false
        (0...9).forEach {
            if $0 == Int(input) {
                addZero = true
            }
        }
        if addZero {
            return "0\(input)"
        } else { return String(input) }

    }

    var description: String {

        let date = [year, month, day, time.hour, time.mins, time.secs].map { addLeadingZero($0) }

        return date[0] + "-" + date[1] + "-" + date[2] + "T" + date[3] + ":" + date[4] + ":" + date[5]
    }
}

func == (lhs: Gigasecond, rhs: Gigasecond) -> Bool {
    return lhs.description == rhs.description
}

func == (lhs: String, rhs: Gigasecond) -> Bool {
    return lhs == rhs.description
}
struct Gigasecond: Equatable, CustomStringConvertible {

    private var startDate: tm!
    private var gigasecondDate: tm!

    init?(from: String) {
        if let result = parse(from) {
            var start = result
            self.startDate = start
            self.gigasecondDate = start.dateByAddingSeconds(1_000_000_000)
        } else {
            return nil
        }
    }
    private func parse(_ input: String) -> tm? {

        let dateTime = input.split(separator: "T").map { String($0) }
        if dateTime.count > 1 {
            let date = dateTime[0].split(separator: "-").map { String($0) }
            let time = dateTime[1].split(separator: ":").map { String($0) }
            if date.count == 3 && time.count == date.count {

                let year = Int32(date[0]) ?? 0
                let month = Int32(date[1]) ?? 0
                let day = Int32(date[2]) ?? 0
                let hour = Int32(time[0]) ?? 0
                let minute = Int32(time[1]) ?? 0
                let second = Int32(time[2]) ?? 0

                return tm(year: year, month: month, day: day, hour: hour, mins: minute, secs: second)
            }
        }
        return nil
    }
    var description: String {
        return gigasecondDate.description
    }
}
