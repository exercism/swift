import XCTest
@testable import Diamond

class DiamondTests: XCTestCase {

    func testLetterA() {
        XCTAssertEqual(Diamond.makeDiamond(letter: "A"), ["A"])
    }

    func testLetterC() {
        let expected = [
            "  A  ",
            " B B ",
            "C   C",
            " B B ",
            "  A  "]
        XCTAssertEqual(Diamond.makeDiamond(letter: "C"), expected)
    }

    func testLetterE() {
        let expected = [
            "    A    ",
            "   B B   ",
            "  C   C  ",
            " D     D ",
            "E       E",
            " D     D ",
            "  C   C  ",
            "   B B   ",
            "    A    "]
        XCTAssertEqual(Diamond.makeDiamond(letter: "E"), expected)
    }

    func testLargestPossibleDiamond() {
        let expected = [
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
            "                         A                         "]
        XCTAssertEqual(Diamond.makeDiamond(letter: "Z"), expected)
    }

    static var allTests: [(String, (DiamondTests) -> () throws -> Void)] {
        return [
            ("testLetterA", testLetterA),
            ("testLetterC", testLetterC),
            ("testLetterE", testLetterE),
            ("testLargestPossibleDiamond", testLargestPossibleDiamond),
        ]
    }
}
