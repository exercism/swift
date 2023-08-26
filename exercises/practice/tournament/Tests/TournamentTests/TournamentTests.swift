import XCTest

@testable import Tournament

class TournamentTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  private var tournament: Tournament!

  override func setUp() {
    tournament = Tournament()
  }

  func testJustTheHeaderIfNoInput() {
    let expected = ["Team                           | MP |  W |  D |  L |  P"]
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testAWinIsThreePointsALossIsZeroPoints() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3",
      "Blithering Badgers             |  1 |  0 |  0 |  1 |  0",
    ]
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testAWinCanAlsoBeExpressedAsALoss() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    tournament.addMatch("Blithering Badgers;Allegoric Alaskans;loss")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3",
      "Blithering Badgers             |  1 |  0 |  0 |  1 |  0",
    ]
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testADifferentTeamCanWin() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    tournament.addMatch("Blithering Badgers;Allegoric Alaskans;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Blithering Badgers             |  1 |  1 |  0 |  0 |  3",
      "Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0",
    ]
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testADrawIsOnePointEach() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;draw")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1",
      "Blithering Badgers             |  1 |  0 |  1 |  0 |  1",
    ]
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testThereCanBeMoreThanOneMatch() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6",
      "Blithering Badgers             |  2 |  0 |  0 |  2 |  0",
    ]
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testThereCanBeMoreThanOneWinner() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;loss")
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3",
      "Blithering Badgers             |  2 |  1 |  0 |  1 |  3",
    ]
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testThereCanBeMoreThanTwoTeams() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    tournament.addMatch("Allegoric Alaskans;Blithering Badgers;win")
    tournament.addMatch("Blithering Badgers;Courageous Californians;win")
    tournament.addMatch("Courageous Californians;Allegoric Alaskans;loss")
    let expected = [
      "Team                           | MP |  W |  D |  L |  P",
      "Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6",
      "Blithering Badgers             |  2 |  1 |  0 |  1 |  3",
      "Courageous Californians        |  2 |  0 |  0 |  2 |  0",
    ]
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testTypicalInput() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
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
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testIncompleteCompetitionNotAllPairsHavePlayed() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
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
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testTiesBrokenAlphabetically() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
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
    XCTAssertEqual(tournament.tally(), expected)
  }

  func testEnsurePointsSortedNumerically() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
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
    XCTAssertEqual(tournament.tally(), expected)
  }
}
