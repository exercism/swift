struct IsbnVerifier {

    static func isValid(_ string: String) -> Bool {
        // This will be considerably less awkward after Swift 3 support is dropped
        let cleanedString = string.split(separator: "-").map(String.init).joined()

        guard cleanedString.count == 10 else {
            return false
        }

        var digits = [Int]()

        for character in cleanedString.dropLast() {
            if let digit = Int(String(character)) {
                digits.append(digit)
            } else {
                return false
            }
        }

        if cleanedString.last == "X" {
            digits.append(10)
        } else if let last = cleanedString.last, let digit = Int(String(last)) {
            digits.append(digit)
        } else {
            return false
        }

        let sum = digits.enumerated().reduce(0) {
            return $0 + (10 - $1.offset) * $1.element
        }

        return sum % 11 == 0
    }
}
