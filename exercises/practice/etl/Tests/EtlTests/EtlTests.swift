import XCTest

@testable import Etl

class EtlTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testSingleLetter() {
    let legacy = ["1": ["A"]]
    let expected = ["a": 1]
    let results = ETL.transform(legacy)

    XCTAssertEqual(results, expected)
  }

  func testSingleScoreWithMultipleLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let legacy = ["1": ["A", "E", "I", "O", "U"]]
    let expected = ["a": 1, "o": 1, "u": 1, "i": 1, "e": 1]
    let results = ETL.transform(legacy)

    XCTAssertEqual(results, expected)
  }

  func testMultipleScoresWithMultipleLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let legacy = ["1": ["A", "E"], "2": ["D", "G"]]
    let expected = ["a": 1, "g": 2, "d": 2, "e": 1]
    let results = ETL.transform(legacy)

    XCTAssertEqual(results, expected)
  }

  func testMultipleScoresWithDifferingNumbersOfLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    let legacy = [
      "5": ["K"], "2": ["D", "G"], "10": ["Q", "Z"],
      "1": ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], "4": ["F", "H", "V", "W", "Y"],
      "3": ["B", "C", "M", "P"], "8": ["J", "X"],
    ]
    let expected = [
      "o": 1, "u": 1, "z": 10, "m": 3, "l": 1, "f": 4, "b": 3, "w": 4, "s": 1, "q": 10, "a": 1,
      "h": 4, "g": 2, "e": 1, "y": 4, "r": 1, "v": 4, "k": 5, "t": 1, "c": 3, "j": 8, "d": 2,
      "p": 3, "i": 1, "n": 1, "x": 8,
    ]
    let results = ETL.transform(legacy)

    XCTAssertEqual(results, expected)
  }
}
