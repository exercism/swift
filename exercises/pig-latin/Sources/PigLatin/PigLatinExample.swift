import Foundation

private extension String {
    func substringFromIndexInt(_ indx: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: indx)
        return String(self[index...])
    }

    func substringWithRangeInt(_ intRange: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: intRange.lowerBound)
        let end = self.index(self.startIndex, offsetBy: intRange.upperBound)
        return String(self[start..<end])
    }
}

struct PigLatin {

    static func translate (_ word: String) -> String {
        return word.components(separatedBy: " ").map { self.translateWord($0) }.joined(separator: " ")
    }

    static func translateWord(_ word: String) -> String {

        func wordStartsWithPrefixes(_ word: String, prefixes: [String]) -> Bool {
            return 0 < prefixes.filter { word.hasPrefix($0) }.count
        }

        func wordStartsWithVowelLike(_ word: String) -> Bool {
            return wordStartsWithPrefixes(word, prefixes: ["xr", "yt", "a", "e", "i", "o", "u" ])
        }

        func wordStartsWithConsonantAndQu(_ word: String) -> Bool {
            let index = word.index(word.startIndex, offsetBy: 1)
            return word[index...].hasPrefix("qu")
        }

        if wordStartsWithVowelLike(word) { return word + "ay" }
        if wordStartsWithPrefixes(word, prefixes: ["thr", "sch"]) {
            return (word.substringFromIndexInt(3) + word.substringWithRangeInt(0..<3) + "ay") }

        if wordStartsWithPrefixes(word, prefixes: ["ch", "qu", "th"]) {
            return word.substringFromIndexInt(2) +
                word.substringWithRangeInt(0..<2) + "ay" }
        if wordStartsWithConsonantAndQu(word) {
            return word.substringFromIndexInt(3) +
                word.substringWithRangeInt(0..<1) + "quay"}

        return word.substringFromIndexInt(1) +
            word.substringWithRangeInt(0..<1) + "ay"

    }

}
