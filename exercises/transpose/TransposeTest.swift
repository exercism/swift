#if swift(>=3.0)
    import XCTest
#endif

class TransposeTest: XCTestCase {

    func testEmptyInput() {
        XCTAssertEqual(Transpose.transpose([]), [])
    }

    func testTwoCharactersInARow() {
        XCTAssertEqual(Transpose.transpose(["A1"]), ["A", "1"])
    }

    func testTwoCharactersInAColumn() {
        XCTAssertEqual(Transpose.transpose(["A", "1"]), ["A1"])
    }

    func testSimple() {
        XCTAssertEqual(Transpose.transpose(["ABC", "123"]), ["A1", "B2", "C3"])
    }

    func testSingleLine() {
        let expected = ["S", "i", "n", "g", "l", "e", "", "l", "i", "n", "e", "."]
        XCTAssertEqual(Transpose.transpose(["Single line."]), expected)
    }

    func testFirstLineLongerThanSecondLine() {
        let input = ["The fourth line.", "The fifth line."]
        let expected = ["TT", "hh", "ee", "", "ff", "oi", "uf", "rt", "th", "h", " l", "li", "in", "ne", "e.", "."]
        XCTAssertEqual(Transpose.transpose(input), expected)
    }

    func testSecondLineLongerThanFirstLine() {
        let input = ["The first line.", "The second line."]
        let expected = ["TT", "hh", "ee", "", "fs", "ie", "rc", "so", "tn", " d", "l", "il", "ni", "en", ".e", " ."]
        XCTAssertEqual(Transpose.transpose(input), expected)
    }

    func testSquare() {
        let input = ["HEART", "EMBER", "ABUSE", "RESIN", "TREND"]
        let expected = ["HEART", "EMBER", "ABUSE", "RESIN", "TREND"]
        XCTAssertEqual(Transpose.transpose(input), expected)
    }

    func testRectangle() {
        let input = ["FRACTURE", "OUTLINED", "BLOOMING", "SEPTETTE"]
        let expected = ["FOBS", "RULE", "ATOP", "CLOT", "TIME", "UNIT", "RENT", "EDGE"]
        XCTAssertEqual(Transpose.transpose(input), expected)
    }

    func testTriangle() {
        let input = ["T", "EE", "AAA", "SSSS", "EEEEE", "RRRRRR"]
        let expected = ["TEASER", " EASER", "  ASER", "   SER", "    ER", "     R"]
        XCTAssertEqual(Transpose.transpose(input), expected)
    }

    func testManyLines() {
        let input = [
            "Chor. Two households, both alike in dignity,",
            "In fair Verona, where we lay our scene,",
            "From ancient grudge break to new mutiny,",
            "Where civil blood makes civil hands unclean.",
            "From forth the fatal loins of these two foes",
            "A pair of star-cross'd lovers take their life;",
            "Whose misadventur'd piteous overthrows",
            "Doth with their death bury their parents' strife.",
            "The fearful passage of their death-mark'd love,",
            "And the continuance of their parents' rage,",
            "Which, but their children's end, naught could remove,",
            "Is now the two hours' traffic of our stage;",
            "The which if you with patient ears attend,",
            "What here shall miss, our toil shall strive to mend."
        ]

        let expected = [
            "CIFWFAWDTAWITW",
            "hnrhr hohnhshh",
            "o oeopotedi ea",
            "rfmrmash  cn t",
            ".a e ie fthow",
            " ia fr weh,whh",
            "Trnco miae  ie",
            "w ciroitr btcr",
            "oVivtfshfcuhhe",
            " eeih a uote",
            "hrnl sdtln  is",
            "oot ttvh tttfh",
            "un bhaeepihw a",
            "saglernianeoyl",
            "e,ro -trsui ol",
            "h uofcu sarhu",
            "owddarrdan o m",
            "lhg to'egccuwi",
            "deemasdaeehris",
            "sr als t  ists",
            ",ebk 'phool'h,",
            "  reldi ffd",
            "bweso tb  rtpo",
            "oea ileutterau",
            "t kcnoorhhnatr",
            "hl isvuyee'fi",
            " atv es iisfet",
            "ayoior trr ino",
            "l  lfsoh  ecti",
            "ion   vedpn  l",
            "kuehtteieadoe",
            "erwaharrar,fas",
            "   nekt te  rh",
            "ismdsehphnnosa",
            "ncuse ra-tau l",
            " et  tormsural",
            "dniuthwea'g t",
            "iennwesnr hsts",
            "g,ycoi tkrttet",
            "n ,l r s'a anr",
            "i  ef  'dgcgdi",
            "t  aol   eoe,v",
            "y  nei sl,u; e",
            ",  .sf to l",
            "     e rv d  t",
            "     ; ie    o",
            "       f, r",
            "       e  e  m",
            "       .  m  e",
            "          o  n",
            "          v  d",
            "          e  .",
            "          ,"
        ]

        XCTAssertEqual(Transpose.transpose(input), expected)
    }

}
