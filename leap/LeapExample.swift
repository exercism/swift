// Foundation not needed

// Apple Swift version 2.1

class Year {
    var year = 1900
    init(calendarYear: Int) {
        year = calendarYear
    }
    var isLeapYear: Bool {
    get {
        return (year%4 == 0 && year%100 != 0 ) || year%400 == 0
    }
    }
}