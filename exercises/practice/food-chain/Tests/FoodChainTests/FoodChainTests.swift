import Foundation
import Testing

@testable import FoodChain

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct FoodChainTests {

  @Test("fly")
  func testFly() {
    let expected =
      "I know an old lady who swallowed a fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    #expect(expected == FoodChain.song(start: 1, end: 1))
  }

  @Test("spider", .enabled(if: RUNALL))
  func testSpider() {
    let expected =
      "I know an old lady who swallowed a spider.\n"
      + "It wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    #expect(expected == FoodChain.song(start: 2, end: 2))
  }

  @Test("bird", .enabled(if: RUNALL))
  func testBird() {
    let expected =
      "I know an old lady who swallowed a bird.\n" + "How absurd to swallow a bird!\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    #expect(expected == FoodChain.song(start: 3, end: 3))
  }

  @Test("cat", .enabled(if: RUNALL))
  func testCat() {
    let expected =
      "I know an old lady who swallowed a cat.\n" + "Imagine that, to swallow a cat!\n"
      + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    #expect(expected == FoodChain.song(start: 4, end: 4))
  }

  @Test("dog", .enabled(if: RUNALL))
  func testDog() {
    let expected =
      "I know an old lady who swallowed a dog.\n" + "What a hog, to swallow a dog!\n"
      + "She swallowed the dog to catch the cat.\n" + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    #expect(expected == FoodChain.song(start: 5, end: 5))
  }

  @Test("goat", .enabled(if: RUNALL))
  func testGoat() {
    let expected =
      "I know an old lady who swallowed a goat.\n"
      + "Just opened her throat and swallowed a goat!\n"
      + "She swallowed the goat to catch the dog.\n" + "She swallowed the dog to catch the cat.\n"
      + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    #expect(expected == FoodChain.song(start: 6, end: 6))
  }

  @Test("cow", .enabled(if: RUNALL))
  func testCow() {
    let expected =
      "I know an old lady who swallowed a cow.\n" + "I don't know how she swallowed a cow!\n"
      + "She swallowed the cow to catch the goat.\n" + "She swallowed the goat to catch the dog.\n"
      + "She swallowed the dog to catch the cat.\n" + "She swallowed the cat to catch the bird.\n"
      + "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n"
      + "She swallowed the spider to catch the fly.\n"
      + "I don't know why she swallowed the fly. Perhaps she'll die."
    #expect(expected == FoodChain.song(start: 7, end: 7))
  }

  @Test("horse", .enabled(if: RUNALL))
  func testHorse() {
    let expected = "I know an old lady who swallowed a horse.\n" + "She's dead, of course!"
    #expect(expected == FoodChain.song(start: 8, end: 8))
  }

  @Test("multiple verses", .enabled(if: RUNALL))
  func testMultipleVerses() {
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
    #expect(expected == FoodChain.song(start: 1, end: 3))
  }

  @Test("full song", .enabled(if: RUNALL))
  func testFullSong() {
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
    #expect(expected == FoodChain.song(start: 1, end: 8))
  }
}
