import XCTest

@testable import House

class HouseTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testVerseOneTheHouseThatJackBuilt() {
    let expected = "This is the house that Jack built."
    XCTAssertEqual(House.recite(start: 1, end: 1), expected)
  }

  func testVerseTwoTheMaltThatLay() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected = "This is the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 2, end: 2), expected)
  }

  func testVerseThreeTheRatThatAte() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected = "This is the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 3, end: 3), expected)
  }

  func testVerseFourTheCatThatKilled() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 4, end: 4), expected)
  }

  func testVerseFiveTheDogThatWorried() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 5, end: 5), expected)
  }

  func testVerseSixTheCowWithTheCrumpledHorn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 6, end: 6), expected)
  }

  func testVerseSevenTheMaidenAllForlorn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 7, end: 7), expected)
  }

  func testVerseEightTheManAllTatteredAndTorn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 8, end: 8), expected)
  }

  func testVerseNineThePriestAllShavenAndShorn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 9, end: 9), expected)
  }

  func testVerse10TheRoosterThatCrowedInTheMorn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 10, end: 10), expected)
  }

  func testVerse11TheFarmerSowingHisCorn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 11, end: 11), expected)
  }

  func testVerse12TheHorseAndTheHoundAndTheHorn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 12, end: 12), expected)
  }

  func testMultipleVerses() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 4, end: 8), expected)
  }

  func testFullRhyme() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "This is the house that Jack built.\n"
      + "This is the malt that lay in the house that Jack built.\n"
      + "This is the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    XCTAssertEqual(House.recite(start: 1, end: 12), expected)
  }
}
