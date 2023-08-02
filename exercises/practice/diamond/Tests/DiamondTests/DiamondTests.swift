import XCTest

@testable import Diamond

class DiamondTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testDegenerateCaseWithASingleARow() {
    XCTAssertEqual(Diamond.makeDiamond(letter: "A"), ["A"])
  }

  func testDegenerateCaseWithNoRowContaining3DistinctGroupsOfSpaces() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Diamond.makeDiamond(letter: "B"), [" A ", "B B", " A "])
  }

  func testSmallestNonDegenerateCaseWithOddDiamondSideLength() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(Diamond.makeDiamond(letter: "C"), ["  A  ", " B B ", "C   C", " B B ", "  A  "])
  }

  func testSmallestNonDegenerateCaseWithEvenDiamondSideLength() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Diamond.makeDiamond(letter: "D"),
      ["   A   ", "  B B  ", " C   C ", "D     D", " C   C ", "  B B  ", "   A   "])
  }

  func testLargestPossibleDiamond() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      Diamond.makeDiamond(letter: "Z"),
      [
        "                         A                         ",
        "                        B B                        ",
        "                       C   C                       ",
        "                      D     D                      ",
        "                     E       E                     ",
        "                    F         F                    ",
        "                   G           G                   ",
        "                  H             H                  ",
        "                 I               I                 ",
        "                J                 J                ",
        "               K                   K               ",
        "              L                     L              ",
        "             M                       M             ",
        "            N                         N            ",
        "           O                           O           ",
        "          P                             P          ",
        "         Q                               Q         ",
        "        R                                 R        ",
        "       S                                   S       ",
        "      T                                     T      ",
        "     U                                       U     ",
        "    V                                         V    ",
        "   W                                           W   ",
        "  X                                             X  ",
        " Y                                               Y ",
        "Z                                                 Z",
        " Y                                               Y ",
        "  X                                             X  ",
        "   W                                           W   ",
        "    V                                         V    ",
        "     U                                       U     ",
        "      T                                     T      ",
        "       S                                   S       ",
        "        R                                 R        ",
        "         Q                               Q         ",
        "          P                             P          ",
        "           O                           O           ",
        "            N                         N            ",
        "             M                       M             ",
        "              L                     L              ",
        "               K                   K               ",
        "                J                 J                ",
        "                 I               I                 ",
        "                  H             H                  ",
        "                   G           G                   ",
        "                    F         F                    ",
        "                     E       E                     ",
        "                      D     D                      ",
        "                       C   C                       ",
        "                        B B                        ",
        "                         A                         ",
      ])
  }
}
