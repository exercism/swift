struct Say {

    private static let smallNumbers = [
        "zero", "one", "two", "three", "four", "five",
        "six", "seven", "eight", "nine", "ten",
        "eleven", "twelve", "thirteen", "fourteen", "fifteen",
        "sixteen", "seventeen", "eighteen", "nineteen"
    ]

    private static let decades = [
        "twenty", "thirty", "forty", "fifty",
        "sixty", "seventy", "eighty", "ninety"
    ]

    private static let largeGroups: [(name: String, amount: Int)] = [
        ("billion", 1_000_000_000), ("million", 1_000_000), ("thousand", 1_000), ("hundred", 100)
    ]

    static func say(_ number: Int) -> String? {
        guard number >= 0 && number < 1_000_000_000_000 else {
            return nil
        }

        if number < 20 {
            return smallNumbers[number]
        }

        for group in largeGroups where number >= group.amount {
            let result = "\(say(number / group.amount)!) " + group.name
            let remainder = number % group.amount

            if remainder == 0 {
                return result
            } else {
                return result + " \(say(remainder)!)"
            }
        }

        let decade = number / 10
        let decadeName = decades[decade - 2]

        if number % 10 == 0 {
            return decadeName
        } else {
            return decadeName + "-" + say(number % 10)!
        }
    }
}
