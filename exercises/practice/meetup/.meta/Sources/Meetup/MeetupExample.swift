import Foundation

class Meetup {
  var date: Date

  init(year: Int, month: Int, week: String, weekday: String) {
    var components = DateComponents()
    components.year = year
    components.month = month
    components.weekday =
      ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"].firstIndex(
        of: weekday)! + 1
    components.weekdayOrdinal = [
      "first": 1, "second": 2, "third": 3, "fourth": 4, "last": -1, "teenth": 3,
    ][week]!

    self.date = Calendar.current.date(from: components)!

    if week == "teenth" && Calendar.current.component(.day, from: self.date) > 19 {
      components.weekdayOrdinal = 2
      self.date = Calendar.current.date(from: components)!
    }
  }

  var description: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
  }
}
