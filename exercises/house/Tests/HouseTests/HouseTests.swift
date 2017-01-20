import XCTest
@testable import House

class HouseTests: XCTestCase {

    func testRhyme() {
        let expected =
            "This is the house that Jack built.\n\n" +

                "This is the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the dog\n" +
                "that worried the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the cow with the crumpled horn\n" +
                "that tossed the dog\n" +
                "that worried the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the maiden all forlorn\n" +
                "that milked the cow with the crumpled horn\n" +
                "that tossed the dog\n" +
                "that worried the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the man all tattered and torn\n" +
                "that kissed the maiden all forlorn\n" +
                "that milked the cow with the crumpled horn\n" +
                "that tossed the dog\n" +
                "that worried the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the priest all shaven and shorn\n" +
                "that married the man all tattered and torn\n" +
                "that kissed the maiden all forlorn\n" +
                "that milked the cow with the crumpled horn\n" +
                "that tossed the dog\n" +
                "that worried the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the rooster that crowed in the morn\n" +
                "that woke the priest all shaven and shorn\n" +
                "that married the man all tattered and torn\n" +
                "that kissed the maiden all forlorn\n" +
                "that milked the cow with the crumpled horn\n" +
                "that tossed the dog\n" +
                "that worried the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the farmer sowing his corn\n" +
                "that kept the rooster that crowed in the morn\n" +
                "that woke the priest all shaven and shorn\n" +
                "that married the man all tattered and torn\n" +
                "that kissed the maiden all forlorn\n" +
                "that milked the cow with the crumpled horn\n" +
                "that tossed the dog\n" +
                "that worried the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
                "that lay in the house that Jack built.\n\n" +

                "This is the horse and the hound and the horn\n" +
                "that belonged to the farmer sowing his corn\n" +
                "that kept the rooster that crowed in the morn\n" +
                "that woke the priest all shaven and shorn\n" +
                "that married the man all tattered and torn\n" +
                "that kissed the maiden all forlorn\n" +
                "that milked the cow with the crumpled horn\n" +
                "that tossed the dog\n" +
                "that worried the cat\n" +
                "that killed the rat\n" +
                "that ate the malt\n" +
        "that lay in the house that Jack built."

        XCTAssertEqual(expected, House.recite())
    }

    static var allTests: [(String, (HouseTests) -> () throws -> Void)] {
        return [
            ("testRhyme", testRhyme),
        ]
    }
}
