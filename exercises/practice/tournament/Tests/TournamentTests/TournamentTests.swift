import XCTest
@testable import Tournament

class TournamentTests: XCTestCase {

    private var tournament: Tournament!

    override func setUp() {
        tournament = Tournament()
    }

    func testNoInput() {
        XCTAssertEqual(tournament.tally(""), "Team                           | MP |  W |  D |  L |  P")
    }

    func testWinThreePointsLossZeroPoints() {
        let input = "Allegoric Alaskans;Blithering Badgers;win"
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
            Blithering Badgers             |  1 |  0 |  0 |  1 |  0
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testWinCanAlsoBeExpressedAsLoss() {
        let input = "Blithering Badgers;Allegoric Alaskans;loss"
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
            Blithering Badgers             |  1 |  0 |  0 |  1 |  0
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testDifferentTeamCanWin() {
        let input = "Blithering Badgers;Allegoric Alaskans;win"
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Blithering Badgers             |  1 |  1 |  0 |  0 |  3
            Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testDrawIsOnePointEach() {
        let input = "Allegoric Alaskans;Blithering Badgers;draw"
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1
            Blithering Badgers             |  1 |  0 |  1 |  0 |  1
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testMoreThanOneMatch() {
        let input = """
            Allegoric Alaskans;Blithering Badgers;win
            Allegoric Alaskans;Blithering Badgers;win
            """
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
            Blithering Badgers             |  2 |  0 |  0 |  2 |  0
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testThereCanBeMoreThanOneWinner() {
        let input = """
            Allegoric Alaskans;Blithering Badgers;loss
            Allegoric Alaskans;Blithering Badgers;win
            """
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3
            Blithering Badgers             |  2 |  1 |  0 |  1 |  3
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testMoreThanTwoTeams() {
        let input = """
            Allegoric Alaskans;Blithering Badgers;win
            Blithering Badgers;Courageous Californians;win
            Courageous Californians;Allegoric Alaskans;loss
            """
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
            Blithering Badgers             |  2 |  1 |  0 |  1 |  3
            Courageous Californians        |  2 |  0 |  0 |  2 |  0
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testTypicalInput() {
        let input = """
            Allegoric Alaskians;Blithering Badgers;win
            Devastating Donkeys;Courageous Californians;draw
            Devastating Donkeys;Allegoric Alaskians;win
            Courageous Californians;Blithering Badgers;loss
            Blithering Badgers;Devastating Donkeys;loss
            Allegoric Alaskians;Courageous Californians;win
            """
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
            Allegoric Alaskians            |  3 |  2 |  0 |  1 |  6
            Blithering Badgers             |  3 |  1 |  0 |  2 |  3
            Courageous Californians        |  3 |  0 |  1 |  2 |  1
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testIncompleteCompetition() {
        let input = """
            Allegoric Alaskans;Blithering Badgers;loss
            Devastating Donkeys;Allegoric Alaskans;loss
            Courageous Californians;Blithering Badgers;draw
            Allegoric Alaskans;Courageous Californians;win
            """
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
            Blithering Badgers             |  2 |  1 |  1 |  0 |  4
            Courageous Californians        |  2 |  0 |  1 |  1 |  1
            Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    func testTiesBrokenAlphabetically() {
        let input = """
            Courageous Californians;Devastating Donkeys;win
            Allegoric Alaskans;Blithering Badgers;win
            Devastating Donkeys;Allegoric Alaskans;loss
            Courageous Californians;Blithering Badgers;win
            Blithering Badgers;Devastating Donkeys;draw
            Allegoric Alaskans;Courageous Californians;draw
            """
        let expected = """
            Team                           | MP |  W |  D |  L |  P
            Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7
            Courageous Californians        |  3 |  2 |  1 |  0 |  7
            Blithering Badgers             |  3 |  0 |  1 |  2 |  1
            Devastating Donkeys            |  3 |  0 |  1 |  2 |  1
            """
        XCTAssertEqual(tournament.tally(input), expected)
    }

    static var allTests: [(String, (TournamentTests) -> () throws -> Void)] {
        return [
            ("testNoInput", testNoInput),
            ("testWinThreePointsLossZeroPoints", testWinThreePointsLossZeroPoints),
            ("testWinCanAlsoBeExpressedAsLoss", testWinCanAlsoBeExpressedAsLoss),
            ("testDifferentTeamCanWin", testDifferentTeamCanWin),
            ("testDrawIsOnePointEach", testDrawIsOnePointEach),
            ("testMoreThanOneMatch", testMoreThanOneMatch),
            ("testThereCanBeMoreThanOneWinner", testThereCanBeMoreThanOneWinner),
            ("testMoreThanTwoTeams", testMoreThanTwoTeams),
            ("testTypicalInput", testTypicalInput),
            ("testIncompleteCompetition", testIncompleteCompetition),
            ("testTiesBrokenAlphabetically", testTiesBrokenAlphabetically)
        ]
    }
}
