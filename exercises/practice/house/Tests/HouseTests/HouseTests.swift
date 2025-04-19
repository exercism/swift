import Foundation
import Testing

@testable import House

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct HouseTests {

  @Test("verse one - the house that jack built")
  func testVerseOneTheHouseThatJackBuilt() {
    let expected = "This is the house that Jack built."
    #expect(House.recite(start: 1, end: 1) == expected)
  }

  @Test("verse two - the malt that lay", .enabled(if: RUNALL))
  func testVerseTwoTheMaltThatLay() {
    let expected = "This is the malt that lay in the house that Jack built."
    #expect(House.recite(start: 2, end: 2) == expected)
  }

  @Test("verse three - the rat that ate", .enabled(if: RUNALL))
  func testVerseThreeTheRatThatAte() {
    let expected = "This is the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 3, end: 3) == expected)
  }

  @Test("verse four - the cat that killed", .enabled(if: RUNALL))
  func testVerseFourTheCatThatKilled() {
    let expected =
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 4, end: 4) == expected)
  }

  @Test("verse five - the dog that worried", .enabled(if: RUNALL))
  func testVerseFiveTheDogThatWorried() {
    let expected =
      "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 5, end: 5) == expected)
  }

  @Test("verse six - the cow with the crumpled horn", .enabled(if: RUNALL))
  func testVerseSixTheCowWithTheCrumpledHorn() {
    let expected =
      "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 6, end: 6) == expected)
  }

  @Test("verse seven - the maiden all forlorn", .enabled(if: RUNALL))
  func testVerseSevenTheMaidenAllForlorn() {
    let expected =
      "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 7, end: 7) == expected)
  }

  @Test("verse eight - the man all tattered and torn", .enabled(if: RUNALL))
  func testVerseEightTheManAllTatteredAndTorn() {
    let expected =
      "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 8, end: 8) == expected)
  }

  @Test("verse nine - the priest all shaven and shorn", .enabled(if: RUNALL))
  func testVerseNineThePriestAllShavenAndShorn() {
    let expected =
      "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 9, end: 9) == expected)
  }

  @Test("verse 10 - the rooster that crowed in the morn", .enabled(if: RUNALL))
  func testVerse10TheRoosterThatCrowedInTheMorn() {
    let expected =
      "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 10, end: 10) == expected)
  }

  @Test("verse 11 - the farmer sowing his corn", .enabled(if: RUNALL))
  func testVerse11TheFarmerSowingHisCorn() {
    let expected =
      "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 11, end: 11) == expected)
  }

  @Test("verse 12 - the horse and the hound and the horn", .enabled(if: RUNALL))
  func testVerse12TheHorseAndTheHoundAndTheHorn() {
    let expected =
      "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 12, end: 12) == expected)
  }

  @Test("multiple verses", .enabled(if: RUNALL))
  func testMultipleVerses() {
    let expected =
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
      + "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    #expect(House.recite(start: 4, end: 8) == expected)
  }

  @Test("full rhyme", .enabled(if: RUNALL))
  func testFullRhyme() {
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
    #expect(House.recite(start: 1, end: 12) == expected)
  }
}
