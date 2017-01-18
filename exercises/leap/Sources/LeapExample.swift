struct Year {
    var year = 1900
    init(calendarYear: Int) {
        year = calendarYear
    }
    var isLeapYear: Bool {
        return (year % 4 == 0 && year % 100 != 0 ) || year % 400 == 0
    }
}
