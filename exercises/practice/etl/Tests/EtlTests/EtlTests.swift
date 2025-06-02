import Foundation
import Testing

@testable import Etl

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct EtlTests {

  @Test("single letter")
  func testSingleLetter() {
    let legacy = ["1": ["A"]]
    let expected = ["a": 1]
    let results = ETL.transform(legacy)

    #expect(results == expected)
  }

  @Test("single score with multiple letters", .enabled(if: RUNALL))
  func testSingleScoreWithMultipleLetters() {
    let legacy = ["1": ["A", "E", "I", "O", "U"]]
    let expected = ["a": 1, "e": 1, "i": 1, "o": 1, "u": 1]
    let results = ETL.transform(legacy)

    #expect(results == expected)
  }

  @Test("multiple scores with multiple letters", .enabled(if: RUNALL))
  func testMultipleScoresWithMultipleLetters() {
    let legacy = ["1": ["A", "E"], "2": ["D", "G"]]
    let expected = ["a": 1, "d": 2, "e": 1, "g": 2]
    let results = ETL.transform(legacy)

    #expect(results == expected)
  }

  @Test("multiple scores with differing numbers of letters", .enabled(if: RUNALL))
  func testMultipleScoresWithDifferingNumbersOfLetters() {
    let legacy = [
      "1": ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], "10": ["Q", "Z"], "2": ["D", "G"],
      "3": ["B", "C", "M", "P"], "4": ["F", "H", "V", "W", "Y"], "5": ["K"], "8": ["J", "X"],
    ]
    let expected = [
      "a": 1, "b": 3, "c": 3, "d": 2, "e": 1, "f": 4, "g": 2, "h": 4, "i": 1, "j": 8, "k": 5,
      "l": 1, "m": 3, "n": 1, "o": 1, "p": 3, "q": 10, "r": 1, "s": 1, "t": 1, "u": 1, "v": 4,
      "w": 4, "x": 8, "y": 4, "z": 10,
    ]
    let results = ETL.transform(legacy)

    #expect(results == expected)
  }
}
