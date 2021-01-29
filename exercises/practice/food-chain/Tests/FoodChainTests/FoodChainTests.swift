import XCTest
@testable import FoodChain

class FoodChainTests: XCTestCase {

    func testVerse1() {
        let expected =
            "I know an old lady who swallowed a fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die."
        XCTAssertEqual(expected, FoodChain.verse(1))
    }

    func testVerse2() {
        let expected =
            "I know an old lady who swallowed a spider.\n" +
                "It wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die."
        XCTAssertEqual(expected, FoodChain.verse(2))
    }

    func testVerse5() {
        let expected =
            "I know an old lady who swallowed a dog.\n" +
                "What a hog, to swallow a dog!\n" +
                "She swallowed the dog to catch the cat.\n" +
                "She swallowed the cat to catch the bird.\n" +
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die."
        XCTAssertEqual(expected, FoodChain.verse(5))
    }

    func testVerse7() {
        let expected =
            "I know an old lady who swallowed a cow.\n" +
                "I don't know how she swallowed a cow!\n" +
                "She swallowed the cow to catch the goat.\n" +
                "She swallowed the goat to catch the dog.\n" +
                "She swallowed the dog to catch the cat.\n" +
                "She swallowed the cat to catch the bird.\n" +
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
        "I don't know why she swallowed the fly. Perhaps she'll die."
        XCTAssertEqual(expected, FoodChain.verse(7))
    }

    func testVerse8() {
        let expected =
            "I know an old lady who swallowed a horse.\n" +
        "She's dead, of course!"
        XCTAssertEqual(expected, FoodChain.verse(8))
    }

    func testWholeSong() {
        let expected =
            "I know an old lady who swallowed a fly.\n" +
                "I don't know why she swallowed the fly. Perhaps she'll die.\n\n" +

                "I know an old lady who swallowed a spider.\n" +
                "It wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
                "I don't know why she swallowed the fly. Perhaps she'll die.\n\n" +

                "I know an old lady who swallowed a bird.\n" +
                "How absurd to swallow a bird!\n" +
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
                "I don't know why she swallowed the fly. Perhaps she'll die.\n\n" +

                "I know an old lady who swallowed a cat.\n" +
                "Imagine that, to swallow a cat!\n" +
                "She swallowed the cat to catch the bird.\n" +
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
                "I don't know why she swallowed the fly. Perhaps she'll die.\n\n" +

                "I know an old lady who swallowed a dog.\n" +
                "What a hog, to swallow a dog!\n" +
                "She swallowed the dog to catch the cat.\n" +
                "She swallowed the cat to catch the bird.\n" +
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
                "I don't know why she swallowed the fly. Perhaps she'll die.\n\n" +

                "I know an old lady who swallowed a goat.\n" +
                "Just opened her throat and swallowed a goat!\n" +
                "She swallowed the goat to catch the dog.\n" +
                "She swallowed the dog to catch the cat.\n" +
                "She swallowed the cat to catch the bird.\n" +
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
                "I don't know why she swallowed the fly. Perhaps she'll die.\n\n" +

                "I know an old lady who swallowed a cow.\n" +
                "I don't know how she swallowed a cow!\n" +
                "She swallowed the cow to catch the goat.\n" +
                "She swallowed the goat to catch the dog.\n" +
                "She swallowed the dog to catch the cat.\n" +
                "She swallowed the cat to catch the bird.\n" +
                "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n" +
                "She swallowed the spider to catch the fly.\n" +
                "I don't know why she swallowed the fly. Perhaps she'll die.\n\n" +

                "I know an old lady who swallowed a horse.\n" +
        "She's dead, of course!"

        XCTAssertEqual(expected, FoodChain.song())
    }

    static var allTests: [(String, (FoodChainTests) -> () throws -> Void)] {
        return [
            ("testVerse1", testVerse1),
            ("testVerse2", testVerse2),
            ("testVerse5", testVerse5),
            ("testVerse7", testVerse7),
            ("testVerse8", testVerse8),
            ("testWholeSong", testWholeSong),
        ]
    }
}
