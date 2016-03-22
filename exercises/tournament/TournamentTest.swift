import XCTest




class TournamentTest:XCTestCase {
    
        let input1 =
        "Allegoric Alaskians;Blithering Badgers;win\n" +
            "Devastating Donkeys;Courageous Californians;draw\n" +
            "Devastating Donkeys;Allegoric Alaskians;win\n" +
            "Courageous Californians;Blithering Badgers;loss\n" +
            "Blithering Badgers;Devastating Donkeys;loss\n" +
        "Allegoric Alaskians;Courageous Californians;win"
        
        let input2 =
        "Allegoric Alaskians;Blithering Badgers;win\n" +
            "Devastating Donkeys_Courageous Californians;draw\n" +
            "Devastating Donkeys;Allegoric Alaskians;win\n" +
            "\n" +
            "Courageous Californians;Blithering Badgers;loss\n" +
            "Bla;Bla;Bla\n" +
            "Blithering Badgers;Devastating Donkeys;loss\n" +
            "# Yackity yackity yack\n" +
            "Allegoric Alaskians;Courageous Californians;win\n" +
        "Devastating Donkeys;Courageous Californians;draw"
        
        let input3 =
        "Allegoric Alaskians;Blithering Badgers;win\n" +
            "Devastating Donkeys;Allegoric Alaskians;win\n" +
            "Courageous Californians;Blithering Badgers;loss\n" +
        "Allegoric Alaskians;Courageous Californians;win"
        
        
        let expected1 =
            "Team                           | MP |  W |  D |  L |  P\n" +
            "Devastating Donkeys            |  3 |  2 |  1 |  0 |  7\n" +
            "Allegoric Alaskians            |  3 |  2 |  0 |  1 |  6\n" +
            "Blithering Badgers             |  3 |  1 |  0 |  2 |  3\n" +
            "Courageous Californians        |  3 |  0 |  1 |  2 |  1"
        
        let expected2 =
            "Team                           | MP |  W |  D |  L |  P\n" +
            "Devastating Donkeys            |  3 |  2 |  1 |  0 |  7\n" +
            "Allegoric Alaskians            |  3 |  2 |  0 |  1 |  6\n" +
            "Blithering Badgers             |  3 |  1 |  0 |  2 |  3\n" +
            "Courageous Californians        |  3 |  0 |  1 |  2 |  1"
        
        let expected3 =
            "Team                           | MP |  W |  D |  L |  P\n" +
            "Allegoric Alaskians            |  3 |  2 |  0 |  1 |  6\n" +
            "Blithering Badgers             |  2 |  1 |  0 |  1 |  3\n" +
            "Devastating Donkeys            |  1 |  1 |  0 |  0 |  3\n" +
            "Courageous Californians        |  2 |  0 |  0 |  2 |  0"
    

        
    func testGoodInput() {
        let tournament = Tournament()
        XCTAssertEqual(tournament.tally(input1),  expected1)
    }

    func testIgnoreBadlines() {
        let tournament = Tournament()
        XCTAssertEqual(tournament.tally(input2),  expected2)
    }
    
    func testinCompleteCompetition() {
        let tournament = Tournament()
        XCTAssertEqual(tournament.tally(input3),  expected3)
    }

}
