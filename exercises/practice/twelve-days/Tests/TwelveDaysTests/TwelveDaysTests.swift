import Foundation
import Testing

@testable import TwelveDays

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct TwelveDaysTests {

  @Test("first day a partridge in a pear tree")
  func testFirstDayAPartridgeInAPearTree1() {
    let expected =
      "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 1, end: 1) == expected)
  }

  @Test("second day two turtle doves", .enabled(if: RUNALL))
  func testSecondDayTwoTurtleDoves1() {
    let expected =
      "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 2, end: 2) == expected)
  }

  @Test("third day three french hens", .enabled(if: RUNALL))
  func testThirdDayThreeFrenchHens1() {
    let expected =
      "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 3, end: 3) == expected)
  }

  @Test("fourth day four calling birds", .enabled(if: RUNALL))
  func testFourthDayFourCallingBirds1() {
    let expected =
      "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 4, end: 4) == expected)
  }

  @Test("fifth day five gold rings", .enabled(if: RUNALL))
  func testFifthDayFiveGoldRings1() {
    let expected =
      "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 5, end: 5) == expected)
  }

  @Test("sixth day six geese-a-laying", .enabled(if: RUNALL))
  func testSixthDaySixGeeseALaying1() {
    let expected =
      "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 6, end: 6) == expected)
  }

  @Test("seventh day seven swans-a-swimming", .enabled(if: RUNALL))
  func testSeventhDaySevenSwansASwimming1() {
    let expected =
      "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 7, end: 7) == expected)
  }

  @Test("eighth day eight maids-a-milking", .enabled(if: RUNALL))
  func testEighthDayEightMaidsAMilking1() {
    let expected =
      "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 8, end: 8) == expected)
  }

  @Test("ninth day nine ladies dancing", .enabled(if: RUNALL))
  func testNinthDayNineLadiesDancing1() {
    let expected =
      "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 9, end: 9) == expected)
  }

  @Test("tenth day ten lords-a-leaping", .enabled(if: RUNALL))
  func testTenthDayTenLordsALeaping1() {
    let expected =
      "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 10, end: 10) == expected)
  }

  @Test("eleventh day eleven pipers piping", .enabled(if: RUNALL))
  func testEleventhDayElevenPipersPiping1() {
    let expected =
      "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 11, end: 11) == expected)
  }

  @Test("twelfth day twelve drummers drumming", .enabled(if: RUNALL))
  func testTwelfthDayTwelveDrummersDrumming1() {
    let expected =
      "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 12, end: 12) == expected)
  }

  @Test("recites first three verses of the song", .enabled(if: RUNALL))
  func testRecitesFirstThreeVersesOfTheSong2() {
    let expected =
      "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.\n"
      + "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 1, end: 3) == expected)
  }

  @Test("recites three verses from the middle of the song", .enabled(if: RUNALL))
  func testRecitesThreeVersesFromTheMiddleOfTheSong2() {
    let expected =
      "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
      + "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    #expect(TwelveDaysSong.recite(start: 4, end: 6) == expected)
  }

  @Test("recites the whole song", .enabled(if: RUNALL))
  func testRecitesTheWholeSong2() {
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
    #expect(TwelveDaysSong.recite(start: 1, end: 12) == expected)
  }
}
