struct Hexadecimal {

    let hexString: String
    let intValue: Int?

    private static let hexDigits = [
        "0": 0,
        "1": 1,
        "2": 2,
        "3": 3,
        "4": 4,
        "5": 5,
        "6": 6,
        "7": 7,
        "8": 8,
        "9": 9,
        "a": 10,
        "b": 11,
        "c": 12,
        "d": 13,
        "e": 14,
        "f": 15
    ]

    init(_ hexString: String) {
        self.hexString = hexString
        self.intValue = Hexadecimal.getIntFromHexString(hexString)
    }

    private static func getIntFromHexString(_ hexString: String) -> Int? {
        var result = 0
        var multiplier = 1

        let digits = hexString.map { String($0).lowercased() }.reversed()

        for digit in digits {
            guard let intValue = hexDigits[digit] else {
                // Invalid hex string
                return nil
            }

            result += intValue * multiplier
            multiplier *= 16
        }

        return result
    }
}

extension Int {

    init?(_ hex: Hexadecimal) {
        guard let intValue = hex.intValue else {
            return nil
        }

        self = intValue
    }

}
