import Foundation
import Testing

@testable import Meetup

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct MeetupTests {

  @Test("when teenth Monday is the 13th, the first day of the teenth week")
  func testWhenTeenthMondayIsThe13ThTheFirstDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 5, week: "teenth", weekday: "Monday")
    #expect(meetUp.description == "2013-05-13")
  }

  @Test("when teenth Monday is the 19th, the last day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthMondayIsThe19ThTheLastDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 8, week: "teenth", weekday: "Monday")
    #expect(meetUp.description == "2013-08-19")
  }

  @Test("when teenth Monday is some day in the middle of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthMondayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 9, week: "teenth", weekday: "Monday")
    #expect(meetUp.description == "2013-09-16")
  }

  @Test("when teenth Tuesday is the 19th, the last day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthTuesdayIsThe19ThTheLastDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "teenth", weekday: "Tuesday")
    #expect(meetUp.description == "2013-03-19")
  }

  @Test("when teenth Tuesday is some day in the middle of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthTuesdayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "teenth", weekday: "Tuesday")
    #expect(meetUp.description == "2013-04-16")
  }

  @Test("when teenth Tuesday is the 13th, the first day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthTuesdayIsThe13ThTheFirstDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 8, week: "teenth", weekday: "Tuesday")
    #expect(meetUp.description == "2013-08-13")
  }

  @Test("when teenth Wednesday is some day in the middle of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthWednesdayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 1, week: "teenth", weekday: "Wednesday")
    #expect(meetUp.description == "2013-01-16")
  }

  @Test("when teenth Wednesday is the 13th, the first day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthWednesdayIsThe13ThTheFirstDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 2, week: "teenth", weekday: "Wednesday")
    #expect(meetUp.description == "2013-02-13")
  }

  @Test("when teenth Wednesday is the 19th, the last day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthWednesdayIsThe19ThTheLastDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 6, week: "teenth", weekday: "Wednesday")
    #expect(meetUp.description == "2013-06-19")
  }

  @Test("when teenth Thursday is some day in the middle of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthThursdayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 5, week: "teenth", weekday: "Thursday")
    #expect(meetUp.description == "2013-05-16")
  }

  @Test("when teenth Thursday is the 13th, the first day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthThursdayIsThe13ThTheFirstDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 6, week: "teenth", weekday: "Thursday")
    #expect(meetUp.description == "2013-06-13")
  }

  @Test("when teenth Thursday is the 19th, the last day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthThursdayIsThe19ThTheLastDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 9, week: "teenth", weekday: "Thursday")
    #expect(meetUp.description == "2013-09-19")
  }

  @Test("when teenth Friday is the 19th, the last day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthFridayIsThe19ThTheLastDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "teenth", weekday: "Friday")
    #expect(meetUp.description == "2013-04-19")
  }

  @Test("when teenth Friday is some day in the middle of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthFridayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 8, week: "teenth", weekday: "Friday")
    #expect(meetUp.description == "2013-08-16")
  }

  @Test("when teenth Friday is the 13th, the first day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthFridayIsThe13ThTheFirstDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 9, week: "teenth", weekday: "Friday")
    #expect(meetUp.description == "2013-09-13")
  }

  @Test("when teenth Saturday is some day in the middle of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthSaturdayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 2, week: "teenth", weekday: "Saturday")
    #expect(meetUp.description == "2013-02-16")
  }

  @Test("when teenth Saturday is the 13th, the first day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthSaturdayIsThe13ThTheFirstDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "teenth", weekday: "Saturday")
    #expect(meetUp.description == "2013-04-13")
  }

  @Test("when teenth Saturday is the 19th, the last day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthSaturdayIsThe19ThTheLastDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 10, week: "teenth", weekday: "Saturday")
    #expect(meetUp.description == "2013-10-19")
  }

  @Test("when teenth Sunday is the 19th, the last day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthSundayIsThe19ThTheLastDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 5, week: "teenth", weekday: "Sunday")
    #expect(meetUp.description == "2013-05-19")
  }

  @Test("when teenth Sunday is some day in the middle of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthSundayIsSomeDayInTheMiddleOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 6, week: "teenth", weekday: "Sunday")
    #expect(meetUp.description == "2013-06-16")
  }

  @Test("when teenth Sunday is the 13th, the first day of the teenth week", .enabled(if: RUNALL))
  func testWhenTeenthSundayIsThe13ThTheFirstDayOfTheTeenthWeek() {
    let meetUp = Meetup(year: 2013, month: 10, week: "teenth", weekday: "Sunday")
    #expect(meetUp.description == "2013-10-13")
  }

  @Test("when first Monday is some day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstMondayIsSomeDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "first", weekday: "Monday")
    #expect(meetUp.description == "2013-03-04")
  }

  @Test("when first Monday is the 1st, the first day of the first week", .enabled(if: RUNALL))
  func testWhenFirstMondayIsThe1StTheFirstDayOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "first", weekday: "Monday")
    #expect(meetUp.description == "2013-04-01")
  }

  @Test("when first Tuesday is the 7th, the last day of the first week", .enabled(if: RUNALL))
  func testWhenFirstTuesdayIsThe7ThTheLastDayOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 5, week: "first", weekday: "Tuesday")
    #expect(meetUp.description == "2013-05-07")
  }

  @Test("when first Tuesday is some day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstTuesdayIsSomeDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 6, week: "first", weekday: "Tuesday")
    #expect(meetUp.description == "2013-06-04")
  }

  @Test("when first Wednesday is some day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstWednesdayIsSomeDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 7, week: "first", weekday: "Wednesday")
    #expect(meetUp.description == "2013-07-03")
  }

  @Test("when first Wednesday is the 7th, the last day of the first week", .enabled(if: RUNALL))
  func testWhenFirstWednesdayIsThe7ThTheLastDayOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 8, week: "first", weekday: "Wednesday")
    #expect(meetUp.description == "2013-08-07")
  }

  @Test("when first Thursday is some day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstThursdayIsSomeDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 9, week: "first", weekday: "Thursday")
    #expect(meetUp.description == "2013-09-05")
  }

  @Test("when first Thursday is another day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstThursdayIsAnotherDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 10, week: "first", weekday: "Thursday")
    #expect(meetUp.description == "2013-10-03")
  }

  @Test("when first Friday is the 1st, the first day of the first week", .enabled(if: RUNALL))
  func testWhenFirstFridayIsThe1StTheFirstDayOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 11, week: "first", weekday: "Friday")
    #expect(meetUp.description == "2013-11-01")
  }

  @Test("when first Friday is some day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstFridayIsSomeDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 12, week: "first", weekday: "Friday")
    #expect(meetUp.description == "2013-12-06")
  }

  @Test("when first Saturday is some day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstSaturdayIsSomeDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 1, week: "first", weekday: "Saturday")
    #expect(meetUp.description == "2013-01-05")
  }

  @Test("when first Saturday is another day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstSaturdayIsAnotherDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 2, week: "first", weekday: "Saturday")
    #expect(meetUp.description == "2013-02-02")
  }

  @Test("when first Sunday is some day in the middle of the first week", .enabled(if: RUNALL))
  func testWhenFirstSundayIsSomeDayInTheMiddleOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "first", weekday: "Sunday")
    #expect(meetUp.description == "2013-03-03")
  }

  @Test("when first Sunday is the 7th, the last day of the first week", .enabled(if: RUNALL))
  func testWhenFirstSundayIsThe7ThTheLastDayOfTheFirstWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "first", weekday: "Sunday")
    #expect(meetUp.description == "2013-04-07")
  }

  @Test("when second Monday is some day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondMondayIsSomeDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "second", weekday: "Monday")
    #expect(meetUp.description == "2013-03-11")
  }

  @Test("when second Monday is the 8th, the first day of the second week", .enabled(if: RUNALL))
  func testWhenSecondMondayIsThe8ThTheFirstDayOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "second", weekday: "Monday")
    #expect(meetUp.description == "2013-04-08")
  }

  @Test("when second Tuesday is the 14th, the last day of the second week", .enabled(if: RUNALL))
  func testWhenSecondTuesdayIsThe14ThTheLastDayOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 5, week: "second", weekday: "Tuesday")
    #expect(meetUp.description == "2013-05-14")
  }

  @Test("when second Tuesday is some day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondTuesdayIsSomeDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 6, week: "second", weekday: "Tuesday")
    #expect(meetUp.description == "2013-06-11")
  }

  @Test("when second Wednesday is some day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondWednesdayIsSomeDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 7, week: "second", weekday: "Wednesday")
    #expect(meetUp.description == "2013-07-10")
  }

  @Test("when second Wednesday is the 14th, the last day of the second week", .enabled(if: RUNALL))
  func testWhenSecondWednesdayIsThe14ThTheLastDayOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 8, week: "second", weekday: "Wednesday")
    #expect(meetUp.description == "2013-08-14")
  }

  @Test("when second Thursday is some day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondThursdayIsSomeDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 9, week: "second", weekday: "Thursday")
    #expect(meetUp.description == "2013-09-12")
  }

  @Test(
    "when second Thursday is another day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondThursdayIsAnotherDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 10, week: "second", weekday: "Thursday")
    #expect(meetUp.description == "2013-10-10")
  }

  @Test("when second Friday is the 8th, the first day of the second week", .enabled(if: RUNALL))
  func testWhenSecondFridayIsThe8ThTheFirstDayOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 11, week: "second", weekday: "Friday")
    #expect(meetUp.description == "2013-11-08")
  }

  @Test("when second Friday is some day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondFridayIsSomeDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 12, week: "second", weekday: "Friday")
    #expect(meetUp.description == "2013-12-13")
  }

  @Test("when second Saturday is some day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondSaturdayIsSomeDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 1, week: "second", weekday: "Saturday")
    #expect(meetUp.description == "2013-01-12")
  }

  @Test(
    "when second Saturday is another day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondSaturdayIsAnotherDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 2, week: "second", weekday: "Saturday")
    #expect(meetUp.description == "2013-02-09")
  }

  @Test("when second Sunday is some day in the middle of the second week", .enabled(if: RUNALL))
  func testWhenSecondSundayIsSomeDayInTheMiddleOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "second", weekday: "Sunday")
    #expect(meetUp.description == "2013-03-10")
  }

  @Test("when second Sunday is the 14th, the last day of the second week", .enabled(if: RUNALL))
  func testWhenSecondSundayIsThe14ThTheLastDayOfTheSecondWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "second", weekday: "Sunday")
    #expect(meetUp.description == "2013-04-14")
  }

  @Test("when third Monday is some day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdMondayIsSomeDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "third", weekday: "Monday")
    #expect(meetUp.description == "2013-03-18")
  }

  @Test("when third Monday is the 15th, the first day of the third week", .enabled(if: RUNALL))
  func testWhenThirdMondayIsThe15ThTheFirstDayOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "third", weekday: "Monday")
    #expect(meetUp.description == "2013-04-15")
  }

  @Test("when third Tuesday is the 21st, the last day of the third week", .enabled(if: RUNALL))
  func testWhenThirdTuesdayIsThe21StTheLastDayOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 5, week: "third", weekday: "Tuesday")
    #expect(meetUp.description == "2013-05-21")
  }

  @Test("when third Tuesday is some day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdTuesdayIsSomeDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 6, week: "third", weekday: "Tuesday")
    #expect(meetUp.description == "2013-06-18")
  }

  @Test("when third Wednesday is some day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdWednesdayIsSomeDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 7, week: "third", weekday: "Wednesday")
    #expect(meetUp.description == "2013-07-17")
  }

  @Test("when third Wednesday is the 21st, the last day of the third week", .enabled(if: RUNALL))
  func testWhenThirdWednesdayIsThe21StTheLastDayOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 8, week: "third", weekday: "Wednesday")
    #expect(meetUp.description == "2013-08-21")
  }

  @Test("when third Thursday is some day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdThursdayIsSomeDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 9, week: "third", weekday: "Thursday")
    #expect(meetUp.description == "2013-09-19")
  }

  @Test("when third Thursday is another day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdThursdayIsAnotherDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 10, week: "third", weekday: "Thursday")
    #expect(meetUp.description == "2013-10-17")
  }

  @Test("when third Friday is the 15th, the first day of the third week", .enabled(if: RUNALL))
  func testWhenThirdFridayIsThe15ThTheFirstDayOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 11, week: "third", weekday: "Friday")
    #expect(meetUp.description == "2013-11-15")
  }

  @Test("when third Friday is some day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdFridayIsSomeDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 12, week: "third", weekday: "Friday")
    #expect(meetUp.description == "2013-12-20")
  }

  @Test("when third Saturday is some day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdSaturdayIsSomeDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 1, week: "third", weekday: "Saturday")
    #expect(meetUp.description == "2013-01-19")
  }

  @Test("when third Saturday is another day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdSaturdayIsAnotherDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 2, week: "third", weekday: "Saturday")
    #expect(meetUp.description == "2013-02-16")
  }

  @Test("when third Sunday is some day in the middle of the third week", .enabled(if: RUNALL))
  func testWhenThirdSundayIsSomeDayInTheMiddleOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "third", weekday: "Sunday")
    #expect(meetUp.description == "2013-03-17")
  }

  @Test("when third Sunday is the 21st, the last day of the third week", .enabled(if: RUNALL))
  func testWhenThirdSundayIsThe21StTheLastDayOfTheThirdWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "third", weekday: "Sunday")
    #expect(meetUp.description == "2013-04-21")
  }

  @Test("when fourth Monday is some day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthMondayIsSomeDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "fourth", weekday: "Monday")
    #expect(meetUp.description == "2013-03-25")
  }

  @Test("when fourth Monday is the 22nd, the first day of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthMondayIsThe22NdTheFirstDayOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "fourth", weekday: "Monday")
    #expect(meetUp.description == "2013-04-22")
  }

  @Test("when fourth Tuesday is the 28th, the last day of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthTuesdayIsThe28ThTheLastDayOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 5, week: "fourth", weekday: "Tuesday")
    #expect(meetUp.description == "2013-05-28")
  }

  @Test("when fourth Tuesday is some day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthTuesdayIsSomeDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 6, week: "fourth", weekday: "Tuesday")
    #expect(meetUp.description == "2013-06-25")
  }

  @Test("when fourth Wednesday is some day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthWednesdayIsSomeDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 7, week: "fourth", weekday: "Wednesday")
    #expect(meetUp.description == "2013-07-24")
  }

  @Test("when fourth Wednesday is the 28th, the last day of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthWednesdayIsThe28ThTheLastDayOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 8, week: "fourth", weekday: "Wednesday")
    #expect(meetUp.description == "2013-08-28")
  }

  @Test("when fourth Thursday is some day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthThursdayIsSomeDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 9, week: "fourth", weekday: "Thursday")
    #expect(meetUp.description == "2013-09-26")
  }

  @Test(
    "when fourth Thursday is another day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthThursdayIsAnotherDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 10, week: "fourth", weekday: "Thursday")
    #expect(meetUp.description == "2013-10-24")
  }

  @Test("when fourth Friday is the 22nd, the first day of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthFridayIsThe22NdTheFirstDayOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 11, week: "fourth", weekday: "Friday")
    #expect(meetUp.description == "2013-11-22")
  }

  @Test("when fourth Friday is some day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthFridayIsSomeDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 12, week: "fourth", weekday: "Friday")
    #expect(meetUp.description == "2013-12-27")
  }

  @Test("when fourth Saturday is some day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthSaturdayIsSomeDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 1, week: "fourth", weekday: "Saturday")
    #expect(meetUp.description == "2013-01-26")
  }

  @Test(
    "when fourth Saturday is another day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthSaturdayIsAnotherDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 2, week: "fourth", weekday: "Saturday")
    #expect(meetUp.description == "2013-02-23")
  }

  @Test("when fourth Sunday is some day in the middle of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthSundayIsSomeDayInTheMiddleOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 3, week: "fourth", weekday: "Sunday")
    #expect(meetUp.description == "2013-03-24")
  }

  @Test("when fourth Sunday is the 28th, the last day of the fourth week", .enabled(if: RUNALL))
  func testWhenFourthSundayIsThe28ThTheLastDayOfTheFourthWeek() {
    let meetUp = Meetup(year: 2013, month: 4, week: "fourth", weekday: "Sunday")
    #expect(meetUp.description == "2013-04-28")
  }

  @Test("last Monday in a month with four Mondays", .enabled(if: RUNALL))
  func testLastMondayInAMonthWithFourMondays() {
    let meetUp = Meetup(year: 2013, month: 3, week: "last", weekday: "Monday")
    #expect(meetUp.description == "2013-03-25")
  }

  @Test("last Monday in a month with five Mondays", .enabled(if: RUNALL))
  func testLastMondayInAMonthWithFiveMondays() {
    let meetUp = Meetup(year: 2013, month: 4, week: "last", weekday: "Monday")
    #expect(meetUp.description == "2013-04-29")
  }

  @Test("last Tuesday in a month with four Tuesdays", .enabled(if: RUNALL))
  func testLastTuesdayInAMonthWithFourTuesdays() {
    let meetUp = Meetup(year: 2013, month: 5, week: "last", weekday: "Tuesday")
    #expect(meetUp.description == "2013-05-28")
  }

  @Test("last Tuesday in another month with four Tuesdays", .enabled(if: RUNALL))
  func testLastTuesdayInAnotherMonthWithFourTuesdays() {
    let meetUp = Meetup(year: 2013, month: 6, week: "last", weekday: "Tuesday")
    #expect(meetUp.description == "2013-06-25")
  }

  @Test("last Wednesday in a month with five Wednesdays", .enabled(if: RUNALL))
  func testLastWednesdayInAMonthWithFiveWednesdays() {
    let meetUp = Meetup(year: 2013, month: 7, week: "last", weekday: "Wednesday")
    #expect(meetUp.description == "2013-07-31")
  }

  @Test("last Wednesday in a month with four Wednesdays", .enabled(if: RUNALL))
  func testLastWednesdayInAMonthWithFourWednesdays() {
    let meetUp = Meetup(year: 2013, month: 8, week: "last", weekday: "Wednesday")
    #expect(meetUp.description == "2013-08-28")
  }

  @Test("last Thursday in a month with four Thursdays", .enabled(if: RUNALL))
  func testLastThursdayInAMonthWithFourThursdays() {
    let meetUp = Meetup(year: 2013, month: 9, week: "last", weekday: "Thursday")
    #expect(meetUp.description == "2013-09-26")
  }

  @Test("last Thursday in a month with five Thursdays", .enabled(if: RUNALL))
  func testLastThursdayInAMonthWithFiveThursdays() {
    let meetUp = Meetup(year: 2013, month: 10, week: "last", weekday: "Thursday")
    #expect(meetUp.description == "2013-10-31")
  }

  @Test("last Friday in a month with five Fridays", .enabled(if: RUNALL))
  func testLastFridayInAMonthWithFiveFridays() {
    let meetUp = Meetup(year: 2013, month: 11, week: "last", weekday: "Friday")
    #expect(meetUp.description == "2013-11-29")
  }

  @Test("last Friday in a month with four Fridays", .enabled(if: RUNALL))
  func testLastFridayInAMonthWithFourFridays() {
    let meetUp = Meetup(year: 2013, month: 12, week: "last", weekday: "Friday")
    #expect(meetUp.description == "2013-12-27")
  }

  @Test("last Saturday in a month with four Saturdays", .enabled(if: RUNALL))
  func testLastSaturdayInAMonthWithFourSaturdays() {
    let meetUp = Meetup(year: 2013, month: 1, week: "last", weekday: "Saturday")
    #expect(meetUp.description == "2013-01-26")
  }

  @Test("last Saturday in another month with four Saturdays", .enabled(if: RUNALL))
  func testLastSaturdayInAnotherMonthWithFourSaturdays() {
    let meetUp = Meetup(year: 2013, month: 2, week: "last", weekday: "Saturday")
    #expect(meetUp.description == "2013-02-23")
  }

  @Test("last Sunday in a month with five Sundays", .enabled(if: RUNALL))
  func testLastSundayInAMonthWithFiveSundays() {
    let meetUp = Meetup(year: 2013, month: 3, week: "last", weekday: "Sunday")
    #expect(meetUp.description == "2013-03-31")
  }

  @Test("last Sunday in a month with four Sundays", .enabled(if: RUNALL))
  func testLastSundayInAMonthWithFourSundays() {
    let meetUp = Meetup(year: 2013, month: 4, week: "last", weekday: "Sunday")
    #expect(meetUp.description == "2013-04-28")
  }

  @Test("when last Wednesday in February in a leap year is the 29th", .enabled(if: RUNALL))
  func testWhenLastWednesdayInFebruaryInALeapYearIsThe29Th() {
    let meetUp = Meetup(year: 2012, month: 2, week: "last", weekday: "Wednesday")
    #expect(meetUp.description == "2012-02-29")
  }

  @Test("last Wednesday in December that is also the last day of the year", .enabled(if: RUNALL))
  func testLastWednesdayInDecemberThatIsAlsoTheLastDayOfTheYear() {
    let meetUp = Meetup(year: 2014, month: 12, week: "last", weekday: "Wednesday")
    #expect(meetUp.description == "2014-12-31")
  }

  @Test("when last Sunday in February in a non-leap year is not the 29th", .enabled(if: RUNALL))
  func testWhenLastSundayInFebruaryInANonLeapYearIsNotThe29Th() {
    let meetUp = Meetup(year: 2015, month: 2, week: "last", weekday: "Sunday")
    #expect(meetUp.description == "2015-02-22")
  }

  @Test("when first Friday is the 7th, the last day of the first week", .enabled(if: RUNALL))
  func testWhenFirstFridayIsThe7ThTheLastDayOfTheFirstWeek() {
    let meetUp = Meetup(year: 2012, month: 12, week: "first", weekday: "Friday")
    #expect(meetUp.description == "2012-12-07")
  }
}
