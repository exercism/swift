import XCTest

@testable import FoodChain

class FoodChainTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testFly() {
    let expected =
      "I know an old lady who swallowed a fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    XCTAssertEqual(expected, FoodChain.song(start: 1, end: 1))
  }

  func testSpider() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "I know an old lady who swallowed a spider.\n"
      + "It wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    XCTAssertEqual(expected, FoodChain.song(start: 2, end: 2))
  }

  func testBird() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "I know an old lady who swallowed a bird.\n" + "How absurd to swallow a bird!\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    XCTAssertEqual(expected, FoodChain.song(start: 3, end: 3))
  }

  func testCat() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "I know an old lady who swallowed a cat.\n" + "Imagine that, to swallow a cat!\n"
      + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    XCTAssertEqual(expected, FoodChain.song(start: 4, end: 4))
  }

  func testDog() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "I know an old lady who swallowed a dog.\n" + "What a hog, to swallow a dog!\n"
      + "She swallowed the dog to catch the cat.\n" + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    XCTAssertEqual(expected, FoodChain.song(start: 5, end: 5))
  }

  func testGoat() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "I know an old lady who swallowed a goat.\n"
      + "Just opened her throat and swallowed a goat!\n"
      + "She swallowed the goat to catch the dog.\n" + "She swallowed the dog to catch the cat.\n"
      + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    XCTAssertEqual(expected, FoodChain.song(start: 6, end: 6))
  }

  func testCow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "I know an old lady who swallowed a cow.\n" + "I don't know how she swallowed a cow!\n"
      + "She swallowed the cow to catch the goat.\n" + "She swallowed the goat to catch the dog.\n"
      + "She swallowed the dog to catch the cat.\n" + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    XCTAssertEqual(expected, FoodChain.song(start: 7, end: 7))
  }

  func testHorse() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected = "I know an old lady who swallowed a horse.\n" + "She's dead, of course!"
    XCTAssertEqual(expected, FoodChain.song(start: 8, end: 8))
  }

  func testMultipleVerses() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "I know an old lady who swallowed a fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a spider.\n"
      + "It wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a bird.\n" + "How absurd to swallow a bird!\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    XCTAssertEqual(expected, FoodChain.song(start: 1, end: 3))
  }

  func testFullSong() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let expected =
      "I know an old lady who swallowed a fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a spider.\n"
      + "It wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a bird.\n" + "How absurd to swallow a bird!\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a cat.\n" + "Imagine that, to swallow a cat!\n"
      + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a dog.\n" + "What a hog, to swallow a dog!\n"
      + "She swallowed the dog to catch the cat.\n" + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a goat.\n"
      + "Just opened her throat and swallowed a goat!\n"
      + "She swallowed the goat to catch the dog.\n" + "She swallowed the dog to catch the cat.\n"
      + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a cow.\n" + "I don't know how she swallowed a cow!\n"
      + "She swallowed the cow to catch the goat.\n" + "She swallowed the goat to catch the dog.\n"
      + "She swallowed the dog to catch the cat.\n" + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die.\n" + "\n"
      + "I know an old lady who swallowed a horse.\n" + "She's dead, of course!"
    XCTAssertEqual(expected, FoodChain.song(start: 1, end: 8))
  }
}
