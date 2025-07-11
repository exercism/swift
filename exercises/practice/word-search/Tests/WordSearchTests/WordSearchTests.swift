import Foundation
import Testing

@testable import WordSearch

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct WordSearchTests {

  @Test("Should accept an initial game grid and a target search word")
  func testShouldAcceptAnInitialGameGridAndATargetSearchWord() {
    let grid = ["jefblpepre"]
    let words = ["clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = nil

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate one word written left to right", .enabled(if: RUNALL))
  func testShouldLocateOneWordWrittenLeftToRight() {
    let grid = ["clojurermt"]
    let words = ["clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["column": 1, "row": 1], "end": ["column": 7, "row": 1],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test(
    "Should locate the same word written left to right in a different position",
    .enabled(if: RUNALL))
  func testShouldLocateTheSameWordWrittenLeftToRightInADifferentPosition() {
    let grid = ["mtclojurer"]
    let words = ["clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["column": 3, "row": 1], "end": ["column": 9, "row": 1],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate a different left to right word", .enabled(if: RUNALL))
  func testShouldLocateADifferentLeftToRightWord() {
    let grid = ["coffeelplx"]
    let words = ["coffee"]

    var expected = [String: WordLocation?]()
    expected["coffee"] = WordLocation(rawInfo: [
      "end": ["row": 1, "column": 6], "start": ["column": 1, "row": 1],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test(
    "Should locate that different left to right word in a different position", .enabled(if: RUNALL))
  func testShouldLocateThatDifferentLeftToRightWordInADifferentPosition() {
    let grid = ["xcoffeezlp"]
    let words = ["coffee"]

    var expected = [String: WordLocation?]()
    expected["coffee"] = WordLocation(rawInfo: [
      "end": ["column": 7, "row": 1], "start": ["row": 1, "column": 2],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate a left to right word in two line grid", .enabled(if: RUNALL))
  func testShouldLocateALeftToRightWordInTwoLineGrid() {
    let grid = ["jefblpepre", "tclojurerm"]
    let words = ["clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["column": 2, "row": 2], "end": ["column": 8, "row": 2],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate a left to right word in three line grid", .enabled(if: RUNALL))
  func testShouldLocateALeftToRightWordInThreeLineGrid() {
    let grid = ["camdcimgtc", "jefblpepre", "clojurermt"]
    let words = ["clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "end": ["column": 7, "row": 3], "start": ["column": 1, "row": 3],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate a left to right word in ten line grid", .enabled(if: RUNALL))
  func testShouldLocateALeftToRightWordInTenLineGrid() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["row": 10, "column": 1], "end": ["row": 10, "column": 7],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test(
    "Should locate that left to right word in a different position in a ten line grid",
    .enabled(if: RUNALL))
  func testShouldLocateThatLeftToRightWordInADifferentPositionInATenLineGrid() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "clojurermt", "jalaycalmp",
    ]
    let words = ["clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "end": ["column": 7, "row": 9], "start": ["row": 9, "column": 1],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate a different left to right word in a ten line grid", .enabled(if: RUNALL))
  func testShouldLocateADifferentLeftToRightWordInATenLineGrid() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "fortranftw", "alxhpburyi", "clojurermt", "jalaycalmp",
    ]
    let words = ["fortran"]

    var expected = [String: WordLocation?]()
    expected["fortran"] = WordLocation(rawInfo: [
      "end": ["row": 7, "column": 7], "start": ["row": 7, "column": 1],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate multiple words", .enabled(if: RUNALL))
  func testShouldLocateMultipleWords() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "fortranftw", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["fortran", "clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["column": 1, "row": 10], "end": ["column": 7, "row": 10],
    ])
    expected["fortran"] = WordLocation(rawInfo: [
      "start": ["row": 7, "column": 1], "end": ["column": 7, "row": 7],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate a single word written right to left", .enabled(if: RUNALL))
  func testShouldLocateASingleWordWrittenRightToLeft() {
    let grid = ["rixilelhrs"]
    let words = ["elixir"]

    var expected = [String: WordLocation?]()
    expected["elixir"] = WordLocation(rawInfo: [
      "start": ["column": 6, "row": 1], "end": ["column": 1, "row": 1],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test(
    "Should locate multiple words written in different horizontal directions", .enabled(if: RUNALL))
  func testShouldLocateMultipleWordsWrittenInDifferentHorizontalDirections() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["elixir", "clojure"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["row": 10, "column": 1], "end": ["column": 7, "row": 10],
    ])
    expected["elixir"] = WordLocation(rawInfo: [
      "end": ["column": 1, "row": 5], "start": ["row": 5, "column": 6],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate words written top to bottom", .enabled(if: RUNALL))
  func testShouldLocateWordsWrittenTopToBottom() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["clojure", "elixir", "ecmascript"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["row": 10, "column": 1], "end": ["row": 10, "column": 7],
    ])
    expected["ecmascript"] = WordLocation(rawInfo: [
      "end": ["column": 10, "row": 10], "start": ["column": 10, "row": 1],
    ])
    expected["elixir"] = WordLocation(rawInfo: [
      "end": ["column": 1, "row": 5], "start": ["row": 5, "column": 6],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate words written bottom to top", .enabled(if: RUNALL))
  func testShouldLocateWordsWrittenBottomToTop() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["clojure", "elixir", "ecmascript", "rust"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "end": ["column": 7, "row": 10], "start": ["column": 1, "row": 10],
    ])
    expected["ecmascript"] = WordLocation(rawInfo: [
      "start": ["column": 10, "row": 1], "end": ["column": 10, "row": 10],
    ])
    expected["elixir"] = WordLocation(rawInfo: [
      "start": ["column": 6, "row": 5], "end": ["column": 1, "row": 5],
    ])
    expected["rust"] = WordLocation(rawInfo: [
      "end": ["column": 9, "row": 2], "start": ["row": 5, "column": 9],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate words written top left to bottom right", .enabled(if: RUNALL))
  func testShouldLocateWordsWrittenTopLeftToBottomRight() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["clojure", "elixir", "ecmascript", "rust", "java"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["row": 10, "column": 1], "end": ["column": 7, "row": 10],
    ])
    expected["ecmascript"] = WordLocation(rawInfo: [
      "start": ["column": 10, "row": 1], "end": ["column": 10, "row": 10],
    ])
    expected["elixir"] = WordLocation(rawInfo: [
      "start": ["column": 6, "row": 5], "end": ["row": 5, "column": 1],
    ])
    expected["java"] = WordLocation(rawInfo: [
      "end": ["column": 4, "row": 4], "start": ["column": 1, "row": 1],
    ])
    expected["rust"] = WordLocation(rawInfo: [
      "end": ["column": 9, "row": 2], "start": ["row": 5, "column": 9],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate words written bottom right to top left", .enabled(if: RUNALL))
  func testShouldLocateWordsWrittenBottomRightToTopLeft() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["clojure", "elixir", "ecmascript", "rust", "java", "lua"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["column": 1, "row": 10], "end": ["row": 10, "column": 7],
    ])
    expected["ecmascript"] = WordLocation(rawInfo: [
      "end": ["row": 10, "column": 10], "start": ["column": 10, "row": 1],
    ])
    expected["elixir"] = WordLocation(rawInfo: [
      "start": ["column": 6, "row": 5], "end": ["column": 1, "row": 5],
    ])
    expected["java"] = WordLocation(rawInfo: [
      "start": ["column": 1, "row": 1], "end": ["column": 4, "row": 4],
    ])
    expected["lua"] = WordLocation(rawInfo: [
      "start": ["row": 9, "column": 8], "end": ["row": 7, "column": 6],
    ])
    expected["rust"] = WordLocation(rawInfo: [
      "start": ["row": 5, "column": 9], "end": ["row": 2, "column": 9],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate words written bottom left to top right", .enabled(if: RUNALL))
  func testShouldLocateWordsWrittenBottomLeftToTopRight() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["clojure", "elixir", "ecmascript", "rust", "java", "lua", "lisp"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "end": ["row": 10, "column": 7], "start": ["column": 1, "row": 10],
    ])
    expected["ecmascript"] = WordLocation(rawInfo: [
      "start": ["row": 1, "column": 10], "end": ["row": 10, "column": 10],
    ])
    expected["elixir"] = WordLocation(rawInfo: [
      "end": ["row": 5, "column": 1], "start": ["column": 6, "row": 5],
    ])
    expected["java"] = WordLocation(rawInfo: [
      "start": ["row": 1, "column": 1], "end": ["row": 4, "column": 4],
    ])
    expected["lisp"] = WordLocation(rawInfo: [
      "start": ["row": 6, "column": 3], "end": ["row": 3, "column": 6],
    ])
    expected["lua"] = WordLocation(rawInfo: [
      "start": ["column": 8, "row": 9], "end": ["row": 7, "column": 6],
    ])
    expected["rust"] = WordLocation(rawInfo: [
      "start": ["column": 9, "row": 5], "end": ["column": 9, "row": 2],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should locate words written top right to bottom left", .enabled(if: RUNALL))
  func testShouldLocateWordsWrittenTopRightToBottomLeft() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = ["clojure", "elixir", "ecmascript", "rust", "java", "lua", "lisp", "ruby"]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["column": 1, "row": 10], "end": ["column": 7, "row": 10],
    ])
    expected["ecmascript"] = WordLocation(rawInfo: [
      "end": ["row": 10, "column": 10], "start": ["column": 10, "row": 1],
    ])
    expected["elixir"] = WordLocation(rawInfo: [
      "start": ["column": 6, "row": 5], "end": ["row": 5, "column": 1],
    ])
    expected["java"] = WordLocation(rawInfo: [
      "end": ["row": 4, "column": 4], "start": ["row": 1, "column": 1],
    ])
    expected["lisp"] = WordLocation(rawInfo: [
      "end": ["row": 3, "column": 6], "start": ["column": 3, "row": 6],
    ])
    expected["lua"] = WordLocation(rawInfo: [
      "start": ["row": 9, "column": 8], "end": ["row": 7, "column": 6],
    ])
    expected["ruby"] = WordLocation(rawInfo: [
      "start": ["column": 8, "row": 6], "end": ["column": 5, "row": 9],
    ])
    expected["rust"] = WordLocation(rawInfo: [
      "start": ["row": 5, "column": 9], "end": ["column": 9, "row": 2],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should fail to locate a word that is not in the puzzle", .enabled(if: RUNALL))
  func testShouldFailToLocateAWordThatIsNotInThePuzzle() {
    let grid = [
      "jefblpepre", "camdcimgtc", "oivokprjsm", "pbwasqroua", "rixilelhrs", "wolcqlirpc",
      "screeaumgr", "alxhpburyi", "jalaycalmp", "clojurermt",
    ]
    let words = [
      "clojure", "elixir", "ecmascript", "rust", "java", "lua", "lisp", "ruby", "haskell",
    ]

    var expected = [String: WordLocation?]()
    expected["clojure"] = WordLocation(rawInfo: [
      "start": ["row": 10, "column": 1], "end": ["row": 10, "column": 7],
    ])
    expected["ecmascript"] = WordLocation(rawInfo: [
      "end": ["column": 10, "row": 10], "start": ["row": 1, "column": 10],
    ])
    expected["elixir"] = WordLocation(rawInfo: [
      "end": ["column": 1, "row": 5], "start": ["column": 6, "row": 5],
    ])
    expected["haskell"] = nil
    expected["java"] = WordLocation(rawInfo: [
      "start": ["row": 1, "column": 1], "end": ["row": 4, "column": 4],
    ])
    expected["lisp"] = WordLocation(rawInfo: [
      "end": ["column": 6, "row": 3], "start": ["column": 3, "row": 6],
    ])
    expected["lua"] = WordLocation(rawInfo: [
      "end": ["column": 6, "row": 7], "start": ["column": 8, "row": 9],
    ])
    expected["ruby"] = WordLocation(rawInfo: [
      "start": ["column": 8, "row": 6], "end": ["row": 9, "column": 5],
    ])
    expected["rust"] = WordLocation(rawInfo: [
      "start": ["column": 9, "row": 5], "end": ["row": 2, "column": 9],
    ])

    #expect(search(words: words, in: grid) == expected)
  }

  @Test(
    "Should fail to locate words that are not on horizontal, vertical, or diagonal lines",
    .enabled(if: RUNALL))
  func testShouldFailToLocateWordsThatAreNotOnHorizontalVerticalOrDiagonalLines() {
    let grid = ["abc", "def"]
    let words = ["aef", "ced", "abf", "cbd"]

    var expected = [String: WordLocation?]()
    expected["abf"] = nil
    expected["aef"] = nil
    expected["cbd"] = nil
    expected["ced"] = nil

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should not concatenate different lines to find a horizontal word", .enabled(if: RUNALL))
  func testShouldNotConcatenateDifferentLinesToFindAHorizontalWord() {
    let grid = ["abceli", "xirdfg"]
    let words = ["elixir"]

    var expected = [String: WordLocation?]()
    expected["elixir"] = nil

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should not wrap around horizontally to find a word", .enabled(if: RUNALL))
  func testShouldNotWrapAroundHorizontallyToFindAWord() {
    let grid = ["silabcdefp"]
    let words = ["lisp"]

    var expected = [String: WordLocation?]()
    expected["lisp"] = nil

    #expect(search(words: words, in: grid) == expected)
  }

  @Test("Should not wrap around vertically to find a word", .enabled(if: RUNALL))
  func testShouldNotWrapAroundVerticallyToFindAWord() {
    let grid = ["s", "u", "r", "a", "b", "c", "t"]
    let words = ["rust"]

    var expected = [String: WordLocation?]()
    expected["rust"] = nil

    #expect(search(words: words, in: grid) == expected)
  }
}

extension WordLocation {

  fileprivate init?(rawInfo: [String: [String: Int]]) {
    guard
      let startDict = rawInfo["start"],
      let endDict = rawInfo["end"],
      let startRow = startDict["row"],
      let startColumn = startDict["column"],
      let endRow = endDict["row"],
      let endColumn = endDict["column"]
    else {
      return nil
    }
    let start = Location(row: startRow, column: startColumn)
    let end = Location(row: endRow, column: endColumn)
    self.init(start: start, end: end)
  }

}
