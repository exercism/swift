import Foundation
import Testing

@testable import Tournament

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct TournamentTests {
  private var tournament: Tournament!

  init() {
    tournament = Tournament()
  }

  @Test("just the header if no input")
  func testJustTheHeaderIfNoInput() {
    let expected = ["Team                           | MP |  W |  D |  L |  P"]
    #expect(tournament.tally() == expected)
  }

  @Test("a win is three points, a loss is zero points", .enabled(if: RUNALL))
  func testAWinIsThreePointsALossIsZeroPoints() {
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3",
      "Blithering Badgers             |  1 |  0 |  0 |  1 |  0",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("a win can also be expressed as a loss", .enabled(if: RUNALL))
  func testAWinCanAlsoBeExpressedAsALoss() {
    tournament.addMatch("Blithering Badgers;Allegoric Alaskans;loss")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3",
      "Blithering Badgers             |  1 |  0 |  0 |  1 |  0",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("a different team can win", .enabled(if: RUNALL))
  func testADifferentTeamCanWin() {
    tournament.addMatch("Blithering Badgers;Allegoric Alaskans;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Blithering Badgers             |  1 |  1 |  0 |  0 |  3",
      "Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("a draw is one point each", .enabled(if: RUNALL))
  func testADrawIsOnePointEach() {
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;draw")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1",
      "Blithering Badgers             |  1 |  0 |  1 |  0 |  1",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("There can be more than one match", .enabled(if: RUNALL))
  func testThereCanBeMoreThanOneMatch() {
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6",
      "Blithering Badgers             |  2 |  0 |  0 |  2 |  0",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("There can be more than one winner", .enabled(if: RUNALL))
  func testThereCanBeMoreThanOneWinner() {
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;loss")
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3",
      "Blithering Badgers             |  2 |  1 |  0 |  1 |  3",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("There can be more than two teams", .enabled(if: RUNALL))
  func testThereCanBeMoreThanTwoTeams() {
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    tournament.addMatch("Blithering Badgers;Courageous Californians;win")
    tournament.addMatch("Courageous Californians;Allegoric Alaskans;loss")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6",
      "Blithering Badgers             |  2 |  1 |  0 |  1 |  3",
      "Courageous Californians        |  2 |  0 |  0 |  2 |  0",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("typical input", .enabled(if: RUNALL))
  func testTypicalInput() {
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    tournament.addMatch("Devastating Donkeys;Courageous Californians;draw")
    tournament.addMatch("Devastating Donkeys;Allegoric Alaskans;win")
    tournament.addMatch("Courageous Californians;Blithering Badgers;loss")
    tournament.addMatch("Blithering Badgers;Devastating Donkeys;loss")
    tournament.addMatch("Allegoric Alaskans;Courageous Californians;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Devastating Donkeys            |  3 |  2 |  1 |  0 |  7",
      "Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6",
      "Blithering Badgers             |  3 |  1 |  0 |  2 |  3",
      "Courageous Californians        |  3 |  0 |  1 |  2 |  1",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("incomplete competition (not all pairs have played)", .enabled(if: RUNALL))
  func testIncompleteCompetitionNotAllPairsHavePlayed() {
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;loss")
    tournament.addMatch("Devastating Donkeys;Allegoric Alaskans;loss")
    tournament.addMatch("Courageous Californians;Blithering Badgers;draw")
    tournament.addMatch("Allegoric Alaskans;Courageous Californians;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6",
      "Blithering Badgers             |  2 |  1 |  1 |  0 |  4",
      "Courageous Californians        |  2 |  0 |  1 |  1 |  1",
      "Devastating Donkeys            |  1 |  0 |  0 |  1 |  0",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("ties broken alphabetically", .enabled(if: RUNALL))
  func testTiesBrokenAlphabetically() {
    tournament.addMatch("Courageous Californians;Devastating Donkeys;win")
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    tournament.addMatch("Devastating Donkeys;Allegoric Alaskans;loss")
    tournament.addMatch("Courageous Californians;Blithering Badgers;win")
    tournament.addMatch("Blithering Badgers;Devastating Donkeys;draw")
    tournament.addMatch("Allegoric Alaskans;Courageous Californians;draw")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7",
      "Courageous Californians        |  3 |  2 |  1 |  0 |  7",
      "Blithering Badgers             |  3 |  0 |  1 |  2 |  1",
      "Devastating Donkeys            |  3 |  0 |  1 |  2 |  1",
    ]
    #expect(tournament.tally() == expected)
  }

  @Test("ensure points sorted numerically", .enabled(if: RUNALL))
  func testEnsurePointsSortedNumerically() {
    tournament.addMatch("Devastating Donkeys;Blithering Badgers;win")
    tournament.addMatch("Devastating Donkeys;Blithering Badgers;win")
    tournament.addMatch("Devastating Donkeys;Blithering Badgers;win")
    tournament.addMatch("Devastating Donkeys;Blithering Badgers;win")
    tournament.addMatch("Blithering Badgers;Devastating Donkeys;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Devastating Donkeys            |  5 |  4 |  0 |  1 | 12",
      "Blithering Badgers             |  5 |  1 |  0 |  4 |  3",
    ]
    #expect(tournament.tally() == expected)
  }
}
