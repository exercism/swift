import XCTest

@testable import Meetup

class MeetupTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testWhenTeenthMondayIsThe13ThTheFirstDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 5, week: "teenth", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-05-13")
  }

  func testWhenTeenthMondayIsThe19ThTheLastDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 8, week: "teenth", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-08-19")
  }

  func testWhenTeenthMondayIsSomeDayInTheMiddleOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 9, week: "teenth", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-09-16")
  }

  func testWhenTeenthTuesdayIsThe19ThTheLastDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "teenth", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-03-19")
  }

  func testWhenTeenthTuesdayIsSomeDayInTheMiddleOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "teenth", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-04-16")
  }

  func testWhenTeenthTuesdayIsThe13ThTheFirstDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 8, week: "teenth", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-08-13")
  }

  func testWhenTeenthWednesdayIsSomeDayInTheMiddleOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 1, week: "teenth", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-01-16")
  }

  func testWhenTeenthWednesdayIsThe13ThTheFirstDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 2, week: "teenth", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-02-13")
  }

  func testWhenTeenthWednesdayIsThe19ThTheLastDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 6, week: "teenth", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-06-19")
  }

  func testWhenTeenthThursdayIsSomeDayInTheMiddleOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 5, week: "teenth", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-05-16")
  }

  func testWhenTeenthThursdayIsThe13ThTheFirstDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 6, week: "teenth", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-06-13")
  }

  func testWhenTeenthThursdayIsThe19ThTheLastDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 9, week: "teenth", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-09-19")
  }

  func testWhenTeenthFridayIsThe19ThTheLastDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "teenth", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-04-19")
  }

  func testWhenTeenthFridayIsSomeDayInTheMiddleOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 8, week: "teenth", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-08-16")
  }

  func testWhenTeenthFridayIsThe13ThTheFirstDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 9, week: "teenth", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-09-13")
  }

  func testWhenTeenthSaturdayIsSomeDayInTheMiddleOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 2, week: "teenth", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-02-16")
  }

  func testWhenTeenthSaturdayIsThe13ThTheFirstDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "teenth", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-04-13")
  }

  func testWhenTeenthSaturdayIsThe19ThTheLastDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 10, week: "teenth", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-10-19")
  }

  func testWhenTeenthSundayIsThe19ThTheLastDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 5, week: "teenth", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-05-19")
  }

  func testWhenTeenthSundayIsSomeDayInTheMiddleOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 6, week: "teenth", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-06-16")
  }

  func testWhenTeenthSundayIsThe13ThTheFirstDayOfTheTeenthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 10, week: "teenth", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-10-13")
  }

  func testWhenFirstMondayIsSomeDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "first", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-03-04")
  }

  func testWhenFirstMondayIsThe1StTheFirstDayOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "first", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-04-01")
  }

  func testWhenFirstTuesdayIsThe7ThTheLastDayOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 5, week: "first", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-05-07")
  }

  func testWhenFirstTuesdayIsSomeDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 6, week: "first", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-06-04")
  }

  func testWhenFirstWednesdayIsSomeDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 7, week: "first", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-07-03")
  }

  func testWhenFirstWednesdayIsThe7ThTheLastDayOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 8, week: "first", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-08-07")
  }

  func testWhenFirstThursdayIsSomeDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 9, week: "first", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-09-05")
  }

  func testWhenFirstThursdayIsAnotherDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 10, week: "first", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-10-03")
  }

  func testWhenFirstFridayIsThe1StTheFirstDayOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 11, week: "first", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-11-01")
  }

  func testWhenFirstFridayIsSomeDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 12, week: "first", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-12-06")
  }

  func testWhenFirstSaturdayIsSomeDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 1, week: "first", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-01-05")
  }

  func testWhenFirstSaturdayIsAnotherDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 2, week: "first", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-02-02")
  }

  func testWhenFirstSundayIsSomeDayInTheMiddleOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "first", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-03-03")
  }

  func testWhenFirstSundayIsThe7ThTheLastDayOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "first", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-04-07")
  }

  func testWhenSecondMondayIsSomeDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "second", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-03-11")
  }

  func testWhenSecondMondayIsThe8ThTheFirstDayOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "second", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-04-08")
  }

  func testWhenSecondTuesdayIsThe14ThTheLastDayOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 5, week: "second", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-05-14")
  }

  func testWhenSecondTuesdayIsSomeDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 6, week: "second", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-06-11")
  }

  func testWhenSecondWednesdayIsSomeDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 7, week: "second", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-07-10")
  }

  func testWhenSecondWednesdayIsThe14ThTheLastDayOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 8, week: "second", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-08-14")
  }

  func testWhenSecondThursdayIsSomeDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 9, week: "second", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-09-12")
  }

  func testWhenSecondThursdayIsAnotherDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 10, week: "second", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-10-10")
  }

  func testWhenSecondFridayIsThe8ThTheFirstDayOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 11, week: "second", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-11-08")
  }

  func testWhenSecondFridayIsSomeDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 12, week: "second", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-12-13")
  }

  func testWhenSecondSaturdayIsSomeDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 1, week: "second", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-01-12")
  }

  func testWhenSecondSaturdayIsAnotherDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 2, week: "second", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-02-09")
  }

  func testWhenSecondSundayIsSomeDayInTheMiddleOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "second", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-03-10")
  }

  func testWhenSecondSundayIsThe14ThTheLastDayOfTheSecondWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "second", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-04-14")
  }

  func testWhenThirdMondayIsSomeDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "third", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-03-18")
  }

  func testWhenThirdMondayIsThe15ThTheFirstDayOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "third", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-04-15")
  }

  func testWhenThirdTuesdayIsThe21StTheLastDayOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 5, week: "third", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-05-21")
  }

  func testWhenThirdTuesdayIsSomeDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 6, week: "third", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-06-18")
  }

  func testWhenThirdWednesdayIsSomeDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 7, week: "third", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-07-17")
  }

  func testWhenThirdWednesdayIsThe21StTheLastDayOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 8, week: "third", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-08-21")
  }

  func testWhenThirdThursdayIsSomeDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 9, week: "third", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-09-19")
  }

  func testWhenThirdThursdayIsAnotherDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 10, week: "third", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-10-17")
  }

  func testWhenThirdFridayIsThe15ThTheFirstDayOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 11, week: "third", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-11-15")
  }

  func testWhenThirdFridayIsSomeDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 12, week: "third", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-12-20")
  }

  func testWhenThirdSaturdayIsSomeDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 1, week: "third", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-01-19")
  }

  func testWhenThirdSaturdayIsAnotherDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 2, week: "third", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-02-16")
  }

  func testWhenThirdSundayIsSomeDayInTheMiddleOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "third", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-03-17")
  }

  func testWhenThirdSundayIsThe21StTheLastDayOfTheThirdWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "third", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-04-21")
  }

  func testWhenFourthMondayIsSomeDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "fourth", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-03-25")
  }

  func testWhenFourthMondayIsThe22NdTheFirstDayOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "fourth", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-04-22")
  }

  func testWhenFourthTuesdayIsThe28ThTheLastDayOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 5, week: "fourth", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-05-28")
  }

  func testWhenFourthTuesdayIsSomeDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 6, week: "fourth", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-06-25")
  }

  func testWhenFourthWednesdayIsSomeDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 7, week: "fourth", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-07-24")
  }

  func testWhenFourthWednesdayIsThe28ThTheLastDayOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 8, week: "fourth", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-08-28")
  }

  func testWhenFourthThursdayIsSomeDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 9, week: "fourth", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-09-26")
  }

  func testWhenFourthThursdayIsAnotherDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 10, week: "fourth", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-10-24")
  }

  func testWhenFourthFridayIsThe22NdTheFirstDayOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 11, week: "fourth", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-11-22")
  }

  func testWhenFourthFridayIsSomeDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 12, week: "fourth", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-12-27")
  }

  func testWhenFourthSaturdayIsSomeDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 1, week: "fourth", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-01-26")
  }

  func testWhenFourthSaturdayIsAnotherDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 2, week: "fourth", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-02-23")
  }

  func testWhenFourthSundayIsSomeDayInTheMiddleOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "fourth", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-03-24")
  }

  func testWhenFourthSundayIsThe28ThTheLastDayOfTheFourthWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "fourth", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-04-28")
  }

  func testLastMondayInAMonthWithFourMondays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "last", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-03-25")
  }

  func testLastMondayInAMonthWithFiveMondays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "last", weekday: "Monday")
    XCTAssertEqual(meetUp.description, "2013-04-29")
  }

  func testLastTuesdayInAMonthWithFourTuesdays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 5, week: "last", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-05-28")
  }

  func testLastTuesdayInAnotherMonthWithFourTuesdays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 6, week: "last", weekday: "Tuesday")
    XCTAssertEqual(meetUp.description, "2013-06-25")
  }

  func testLastWednesdayInAMonthWithFiveWednesdays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 7, week: "last", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-07-31")
  }

  func testLastWednesdayInAMonthWithFourWednesdays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 8, week: "last", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2013-08-28")
  }

  func testLastThursdayInAMonthWithFourThursdays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 9, week: "last", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-09-26")
  }

  func testLastThursdayInAMonthWithFiveThursdays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 10, week: "last", weekday: "Thursday")
    XCTAssertEqual(meetUp.description, "2013-10-31")
  }

  func testLastFridayInAMonthWithFiveFridays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 11, week: "last", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-11-29")
  }

  func testLastFridayInAMonthWithFourFridays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 12, week: "last", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2013-12-27")
  }

  func testLastSaturdayInAMonthWithFourSaturdays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 1, week: "last", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-01-26")
  }

  func testLastSaturdayInAnotherMonthWithFourSaturdays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 2, week: "last", weekday: "Saturday")
    XCTAssertEqual(meetUp.description, "2013-02-23")
  }

  func testLastSundayInAMonthWithFiveSundays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 3, week: "last", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-03-31")
  }

  func testLastSundayInAMonthWithFourSundays() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2013, month: 4, week: "last", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2013-04-28")
  }

  func testWhenLastWednesdayInFebruaryInALeapYearIsThe29Th() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2012, month: 2, week: "last", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2012-02-29")
  }

  func testLastWednesdayInDecemberThatIsAlsoTheLastDayOfTheYear() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2014, month: 12, week: "last", weekday: "Wednesday")
    XCTAssertEqual(meetUp.description, "2014-12-31")
  }

  func testWhenLastSundayInFebruaryInANonLeapYearIsNotThe29Th() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2015, month: 2, week: "last", weekday: "Sunday")
    XCTAssertEqual(meetUp.description, "2015-02-22")
  }

  func testWhenFirstFridayIsThe7ThTheLastDayOfTheFirstWeek() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let meetUp = Meetup(year: 2012, month: 12, week: "first", weekday: "Friday")
    XCTAssertEqual(meetUp.description, "2012-12-07")
  }
}
