import Testing
import Foundation

@testable import HighScoreBoard

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "true"]) ?? false

@Suite struct HighScoreBoardTests {
  @Test("to create an empty scoreboard")
  func testEmptyScores() {
    #expect(newScoreBoard() == [:])
  }

  @Test("to add a player with a score", .enabled(if: RUNALL))
  func testAddPlayerExplicit() {
    var scoreboard = [String: Int]()
    let score = 1337
    addPlayer(&scoreboard, "Jesse Johnson", score)
    #expect(scoreboard["Jesse Johnson"] == score)
  }

  @Test("to add a player with a default score", .enabled(if: RUNALL))
  func testAddPlayerDefault() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson")
    #expect(scoreboard["Jesse Johnson"] == 0)
  }

  @Test("to remove a player", .enabled(if: RUNALL))
  func testRemovePlayer() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson", 1337)
    addPlayer(&scoreboard, "Amil PAstorius", 99373)
    addPlayer(&scoreboard, "Min-seo Shin")
    removePlayer(&scoreboard, "Jesse Johnson")
    #expect(scoreboard["Jesse Johnson"] == nil)
  }

  @Test("to remove a non-existent player", .enabled(if: RUNALL))
  func testRemoveNonexistentPlayer() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson", 1337)
    addPlayer(&scoreboard, "Amil PAstorius", 99373)
    addPlayer(&scoreboard, "Min-seo Shin")
    removePlayer(&scoreboard, "Bruno Santangelo")
    #expect(scoreboard == ["Jesse Johnson": 1337, "Amil PAstorius": 99373, "Min-seo Shin": 0])
  }

  @Test("to reset a player's score", .enabled(if: RUNALL))
  func testResetScore() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson", 1337)
    addPlayer(&scoreboard, "Amil PAstorius", 99373)
    addPlayer(&scoreboard, "Min-seo Shin")
    resetScore(&scoreboard, "Amil PAstorius")
    #expect(scoreboard == ["Jesse Johnson": 1337, "Amil PAstorius": 0, "Min-seo Shin": 0])
  }

  @Test("to reset a non-existent player's score", .enabled(if: RUNALL))
  func testResetScoreNonexistentPlayer() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson", 1337)
    addPlayer(&scoreboard, "Amil PAstorius", 99373)
    addPlayer(&scoreboard, "Min-seo Shin")
    resetScore(&scoreboard, "Bruno Santangelo")
    #expect(scoreboard == ["Jesse Johnson": 1337, "Amil PAstorius": 99373, "Min-seo Shin": 0])
  }

  @Test("to update a player's score", .enabled(if: RUNALL))
  func testUpdateScore() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson", 1337)
    addPlayer(&scoreboard, "Amil PAstorius", 99373)
    addPlayer(&scoreboard, "Min-seo Shin")
    updateScore(&scoreboard, "Min-seo Shin", 1999)
    updateScore(&scoreboard, "Jesse Johnson", 1337)
    #expect(scoreboard == ["Jesse Johnson": 2674, "Amil PAstorius": 99373, "Min-seo Shin": 1999])
  }

  @Test("to update a non-existent player's score", .enabled(if: RUNALL))
  func testUpdateScoreNonexistentPlayer() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson", 1337)
    addPlayer(&scoreboard, "Amil PAstorius", 99373)
    addPlayer(&scoreboard, "Min-seo Shin")
    updateScore(&scoreboard, "Bruno Santangelo", 1999)
    #expect(scoreboard == ["Jesse Johnson": 1337, "Amil PAstorius": 99373, "Min-seo Shin": 0])
  }

  @Test("to order by players", .enabled(if: RUNALL))
  func testOrderByPlayers() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson", 1337)
    addPlayer(&scoreboard, "Amil PAstorius", 99373)
    addPlayer(&scoreboard, "Min-seo Shin")
    updateScore(&scoreboard, "Min-seo Shin", 1999)
    updateScore(&scoreboard, "Jesse Johnson", 1337)
    let expected = [("Amil PAstorius", 99373), ("Jesse Johnson", 2674), ("Min-seo Shin", 1999)]
    let got = orderByPlayers(scoreboard)
    for (index, (name, score)) in got.enumerated() {
      #expect(name == expected[index].0 && score == expected[index].1, "Got the name: \(name) and score: \(score), but expected \(expected[index])")
    }
  }

  @Test("to order by scores", .enabled(if: RUNALL))
  func testOrderByScores() {
    var scoreboard = [String: Int]()
    addPlayer(&scoreboard, "Jesse Johnson", 1337)
    addPlayer(&scoreboard, "Amil PAstorius", 99373)
    addPlayer(&scoreboard, "Min-seo Shin")
    updateScore(&scoreboard, "Min-seo Shin", 1999)
    let expected = [("Amil PAstorius", 99373), ("Min-seo Shin", 1999), ("Jesse Johnson", 1337)]
    let got = orderByScores(scoreboard)
    for (index, (name, score)) in got.enumerated() {
      #expect(name == expected[index].0 && score == expected[index].1, "Got the name: \(name) and score: \(score), but expected \(expected[index])")
    }
  }
}
