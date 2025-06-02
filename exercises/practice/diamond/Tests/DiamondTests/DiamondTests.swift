import Foundation
import Testing

@testable import Diamond

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct DiamondTests {

  @Test("Degenerate case with a single 'A' row")
  func testDegenerateCaseWithASingleARow() {
    #expect(Diamond.makeDiamond(letter: "A") == ["A"])
  }

  @Test("Degenerate case with no row containing 3 distinct groups of spaces", .enabled(if: RUNALL))
  func testDegenerateCaseWithNoRowContaining3DistinctGroupsOfSpaces() {
    #expect(Diamond.makeDiamond(letter: "B") == [" A ", "B B", " A "])
  }

  @Test("Smallest non-degenerate case with odd diamond side length", .enabled(if: RUNALL))
  func testSmallestNonDegenerateCaseWithOddDiamondSideLength() {
    #expect(Diamond.makeDiamond(letter: "C") == ["  A  ", " B B ", "C   C", " B B ", "  A  "])
  }

  @Test("Smallest non-degenerate case with even diamond side length", .enabled(if: RUNALL))
  func testSmallestNonDegenerateCaseWithEvenDiamondSideLength() {
    #expect(
      Diamond.makeDiamond(letter: "D") == [
        "   A   ", "  B B  ", " C   C ", "D     D", " C   C ", "  B B  ", "   A   ",
      ])
  }

  @Test("Largest possible diamond", .enabled(if: RUNALL))
  func testLargestPossibleDiamond() {
    #expect(
      Diamond.makeDiamond(letter: "Z") == [
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
