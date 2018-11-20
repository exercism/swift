struct TwelveDaysSong {

    private static let ordinals = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

    private static let gifts = ["a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"]

    static func verse(_ verseNumber: Int) -> String {
        let ordinal = ordinals[verseNumber - 1]
        var verse = "On the \(ordinal) day of Christmas my true love gave to me: "
        verse += gifts(forNumber: verseNumber)

        return verse
    }

    static func verses(_ start: Int, _ end: Int) -> String {
        var verses = [String]()
        for i in start...end {
            verses.append(verse(i))
        }

        return verses.joined(separator: "\n")
    }

    static func sing() -> String {
        return verses(1, 12)
    }

    private static func gifts(forNumber number: Int) -> String {
        let gift = gifts[number - 1]

        if number == 1 {
            return "\(gift)."
        } else if number == 2 {
            return "\(gift), and \(gifts(forNumber: number - 1))"
        } else {
            return "\(gift), \(gifts(forNumber: number - 1))"
        }
    }
}
