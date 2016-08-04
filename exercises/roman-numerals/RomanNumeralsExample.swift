extension String {

    init(_ value: RomanNumeral) {
        self = value.romanNumeral
    }
}

struct RomanNumeral {

    var romanNumeral: String = ""

    private func toRomanNumerals(_ input: Int) -> String {
        var arabicToRoman = [1000: "M", 900: "CM", 500: "D", 400: "CD", 100: "C", 90: "XC", 50: "L", 40: "XL", 10: "X", 9: "IX", 5: "V", 4: "IV", 1: "I"]
        var i = input
        var s = ""
        for arabic in arabicToRoman.keys.sorted(by: > ) {
            while i >= arabic {
                s += arabicToRoman[arabic] ?? ""
                i -= arabic
            }
        }
        return s
    }

    init(_ value: Int) {

        self.romanNumeral = toRomanNumerals(value)
    }
}
