import XCTest




class TwelveDaysTest: XCTestCase {
    
    
    func testVerse1() {
        let expected = "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(1)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse2() {
        let expected = "On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(2)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse3() {
        let expected = "On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(3)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse4() {
        let expected = "On the fourth day of Christmas my true love gave to me, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(4)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse5() {
        let expected = "On the fifth day of Christmas my true love gave to me, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(5)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse6() {
        let expected = "On the sixth day of Christmas my true love gave to me, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(6)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse7() {
        let expected = "On the seventh day of Christmas my true love gave to me, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(7)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse8() {
        let expected = "On the eighth day of Christmas my true love gave to me, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(8)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse9() {
        let expected = "On the ninth day of Christmas my true love gave to me, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(9)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse10() {
        let expected = "On the tenth day of Christmas my true love gave to me, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(10)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse11() {
        let expected = "On the eleventh day of Christmas my true love gave to me, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(11)
        XCTAssertEqual(expected, result)
    }
    
    func testVerse12() {
        let expected = "On the twelfth day of Christmas my true love gave to me, twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n"
        let result = TwelveDaysSong.verse(12)
        XCTAssertEqual(expected, result)
    }
    
    func testMultipleVerses() {
        let expected = (
            "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.\n\n" +
                "On the second day of Christmas my true love gave to me, two Turtle Doves, and a Partridge in a Pear Tree.\n\n" +
            "On the third day of Christmas my true love gave to me, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\n")
        let result = TwelveDaysSong.verses(1, 3)
        XCTAssertEqual(expected, result)
    }
    
    func testTheWholeSong() {
        
        XCTAssertEqual(TwelveDaysSong.verses(1, 12), TwelveDaysSong.sing())
        
    }
    
    
    
}
