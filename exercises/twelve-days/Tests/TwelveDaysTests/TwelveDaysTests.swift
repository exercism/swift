import XCTest
@testable import TwelveDays

class TwelveDaysTests: XCTestCase {
    func testVerse1() {
        let expected = "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(1)
        XCTAssertEqual(expected, result)
    }

    func testVerse2() {
        let expected = "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(2)
        XCTAssertEqual(expected, result)
    }

    func testVerse3() {
        let expected = "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(3)
        XCTAssertEqual(expected, result)
    }

    func testVerse4() {
        let expected = "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(4)
        XCTAssertEqual(expected, result)
    }

    func testVerse5() {
        let expected = "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(5)
        XCTAssertEqual(expected, result)
    }

    func testVerse6() {
        let expected = "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(6)
        XCTAssertEqual(expected, result)
    }

    func testVerse7() {
        let expected = "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(7)
        XCTAssertEqual(expected, result)
    }

    func testVerse8() {
        let expected = "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(8)
        XCTAssertEqual(expected, result)
    }

    func testVerse9() {
        let expected = "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(9)
        XCTAssertEqual(expected, result)
    }

    func testVerse10() {
        let expected = "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(10)
        XCTAssertEqual(expected, result)
    }

    func testVerse11() {
        let expected = "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(11)
        XCTAssertEqual(expected, result)
    }

    func testVerse12() {
        let expected = "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        let result = TwelveDaysSong.verse(12)
        XCTAssertEqual(expected, result)
    }

    func testFirstThreeVerses() {
        let expected =
        """
        On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
        On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
        On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        """
        let result = TwelveDaysSong.verses(1, 3)
        XCTAssertEqual(expected, result)
    }

    func testThreeVersesFromMiddle() {
        let expected =
        """
        On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        """
        let result = TwelveDaysSong.verses(4, 6)
        XCTAssertEqual(expected, result)
    }

    func testTheWholeSong() {
        let expected =
        """
        On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
        On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
        On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
        """
        XCTAssertEqual(expected, TwelveDaysSong.sing())

    }

    static var allTests: [(String, (TwelveDaysTests) -> () throws -> Void)] {
        return [
            ("testVerse1", testVerse1),
            ("testVerse2", testVerse2),
            ("testVerse3", testVerse3),
            ("testVerse4", testVerse4),
            ("testVerse5", testVerse5),
            ("testVerse6", testVerse6),
            ("testVerse7", testVerse7),
            ("testVerse8", testVerse8),
            ("testVerse9", testVerse9),
            ("testVerse10", testVerse10),
            ("testVerse11", testVerse11),
            ("testVerse12", testVerse12),
            ("testFirstThreeVerses", testFirstThreeVerses),
            ("testThreeVersesFromMiddle", testThreeVersesFromMiddle),
            ("testTheWholeSong", testTheWholeSong),
        ]
    }
}
