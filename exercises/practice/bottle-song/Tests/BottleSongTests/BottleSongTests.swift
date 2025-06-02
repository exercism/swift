import Foundation
import Testing

@testable import BottleSong

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct BottleSongTests {

  @Test("first generic verse")
  func testFirstGenericVerse1() {
    let bottleSong = BottleSong(bottles: 10)
    let expected = [
      "Ten green bottles hanging on the wall,", "Ten green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be nine green bottles hanging on the wall.",
    ]
    #expect(bottleSong.song(takedown: 1) == expected)
  }

  @Test("last generic verse", .enabled(if: RUNALL))
  func testLastGenericVerse1() {
    let bottleSong = BottleSong(bottles: 3)
    let expected = [
      "Three green bottles hanging on the wall,", "Three green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be two green bottles hanging on the wall.",
    ]
    #expect(bottleSong.song(takedown: 1) == expected)
  }

  @Test("verse with 2 bottles", .enabled(if: RUNALL))
  func testVerseWith2Bottles1() {
    let bottleSong = BottleSong(bottles: 2)
    let expected = [
      "Two green bottles hanging on the wall,", "Two green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be one green bottle hanging on the wall.",
    ]
    #expect(bottleSong.song(takedown: 1) == expected)
  }

  @Test("verse with 1 bottle", .enabled(if: RUNALL))
  func testVerseWith1Bottle1() {
    let bottleSong = BottleSong(bottles: 1)
    let expected = [
      "One green bottle hanging on the wall,", "One green bottle hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be no green bottles hanging on the wall.",
    ]
    #expect(bottleSong.song(takedown: 1) == expected)
  }

  @Test("first two verses", .enabled(if: RUNALL))
  func testFirstTwoVerses1() {
    let bottleSong = BottleSong(bottles: 10)
    let expected = [
      "Ten green bottles hanging on the wall,", "Ten green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be nine green bottles hanging on the wall.", "",
      "Nine green bottles hanging on the wall,", "Nine green bottles hanging on the wall,",
      "And if one green bottle should accidentally fall,",
      "There'll be eight green bottles hanging on the wall.",
    ]
    #expect(bottleSong.song(takedown: 2) == expected)
  }

  @Test("last three verses", .enabled(if: RUNALL))
  func testLastThreeVerses1() {
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
    #expect(bottleSong.song(takedown: 3) == expected)
  }

  @Test("all verses", .enabled(if: RUNALL))
  func testAllVerses1() {
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
    #expect(bottleSong.song(takedown: 10) == expected)
  }

}
