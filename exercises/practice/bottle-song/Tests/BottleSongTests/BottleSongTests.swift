import XCTest

@testable import BottleSong

class BottleSongTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testFirstGenericVerse1() {
    let bottleSong = BottleSong(bottles: 10)
    let expected = [
      "Ten green bottles hanging on the wall,", "Ten green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be nine green bottles hanging on the wall.",
    ]
    XCTAssertEqual(bottleSong.song(takedown: 1), expected)
  }

  func testLastGenericVerse1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bottleSong = BottleSong(bottles: 3)
    let expected = [
      "Three green bottles hanging on the wall,", "Three green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be two green bottles hanging on the wall.",
    ]
    XCTAssertEqual(bottleSong.song(takedown: 1), expected)
  }

  func testVerseWith2Bottles1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bottleSong = BottleSong(bottles: 2)
    let expected = [
      "Two green bottles hanging on the wall,", "Two green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be one green bottle hanging on the wall.",
    ]
    XCTAssertEqual(bottleSong.song(takedown: 1), expected)
  }

  func testVerseWith1Bottle1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bottleSong = BottleSong(bottles: 1)
    let expected = [
      "One green bottle hanging on the wall,", "One green bottle hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be no green bottles hanging on the wall.",
    ]
    XCTAssertEqual(bottleSong.song(takedown: 1), expected)
  }

  func testFirstTwoVerses1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bottleSong = BottleSong(bottles: 10)
    let expected = [
      "Ten green bottles hanging on the wall,", "Ten green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be nine green bottles hanging on the wall.", "",
      "Nine green bottles hanging on the wall,", "Nine green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be eight green bottles hanging on the wall.",
    ]
    XCTAssertEqual(bottleSong.song(takedown: 2), expected)
  }

  func testLastThreeVerses1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bottleSong = BottleSong(bottles: 3)
    let expected = [
      "Three green bottles hanging on the wall,", "Three green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be two green bottles hanging on the wall.", "",
      "Two green bottles hanging on the wall,", "Two green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be one green bottle hanging on the wall.", "",
      "One green bottle hanging on the wall,", "One green bottle hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be no green bottles hanging on the wall.",
    ]
    XCTAssertEqual(bottleSong.song(takedown: 3), expected)
  }

  func testAllVerses1() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let bottleSong = BottleSong(bottles: 10)
    let expected = [
      "Ten green bottles hanging on the wall,", "Ten green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be nine green bottles hanging on the wall.", "",
      "Nine green bottles hanging on the wall,", "Nine green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be eight green bottles hanging on the wall.", "",
      "Eight green bottles hanging on the wall,", "Eight green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be seven green bottles hanging on the wall.", "",
      "Seven green bottles hanging on the wall,", "Seven green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be six green bottles hanging on the wall.", "",
      "Six green bottles hanging on the wall,", "Six green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be five green bottles hanging on the wall.", "",
      "Five green bottles hanging on the wall,", "Five green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be four green bottles hanging on the wall.", "",
      "Four green bottles hanging on the wall,", "Four green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be three green bottles hanging on the wall.", "",
      "Three green bottles hanging on the wall,", "Three green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be two green bottles hanging on the wall.", "",
      "Two green bottles hanging on the wall,", "Two green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be one green bottle hanging on the wall.", "",
      "One green bottle hanging on the wall,", "One green bottle hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be no green bottles hanging on the wall.",
    ]
    XCTAssertEqual(bottleSong.song(takedown: 10), expected)
  }

}
