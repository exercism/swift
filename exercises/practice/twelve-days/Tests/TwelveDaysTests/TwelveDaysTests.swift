import XCTest

@testable import TwelveDays

class TwelveDaysTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testFirstDayAPartridgeInAPearTree1() {
    let expected =
      "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 1, end: 1), expected)
  }

  func testSecondDayTwoTurtleDoves1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 2, end: 2), expected)
  }

  func testThirdDayThreeFrenchHens1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 3, end: 3), expected)
  }

  func testFourthDayFourCallingBirds1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 4, end: 4), expected)
  }

  func testFifthDayFiveGoldRings1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 5, end: 5), expected)
  }

  func testSixthDaySixGeeseALaying1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 6, end: 6), expected)
  }

  func testSeventhDaySevenSwansASwimming1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 7, end: 7), expected)
  }

  func testEighthDayEightMaidsAMilking1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 8, end: 8), expected)
  }

  func testNinthDayNineLadiesDancing1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 9, end: 9), expected)
  }

  func testTenthDayTenLordsALeaping1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 10, end: 10), expected)
  }

  func testEleventhDayElevenPipersPiping1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 11, end: 11), expected)
  }

  func testTwelfthDayTwelveDrummersDrumming1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 12, end: 12), expected)
  }

  func testRecitesFirstThreeVersesOfTheSong2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.\n"
      + "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 1, end: 3), expected)
  }

  func testRecitesThreeVersesFromTheMiddleOfTheSong2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 4, end: 6), expected)
  }

  func testRecitesTheWholeSong2() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.\n"
      + "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    XCTAssertEqual(TwelveDaysSong.recite(start: 1, end: 12), expected)
  }
}
