import Foundation

private extension String {

    func substringWithRangeInt(_ intRange: CountableRange<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: intRange.lowerBound)
        let end = self.index(self.startIndex, offsetBy: intRange.upperBound)
        return String(self[start..<end])
    }

    func substringWithRangeInt(_ start: Int, end: Int) -> String {
        let range = start..<end
        return self.substringWithRangeInt(range)
    }

    var isUppercase: Bool {
        return self == self.uppercased()
    }

    var isLowercase: Bool {
        return self == self.lowercased()
    }
}

struct Acronym {

    static func abbreviate(_ inString: String) -> String {

        var previousLetter: String = ""

        func splitCamelcaseAt(_ currentLetter: String, withString previousLetter: inout String ) -> Bool {

            defer { previousLetter = currentLetter }

            if currentLetter == " " { return false
            } else if currentLetter.isEmpty { return false
            } else if previousLetter.isLowercase && currentLetter.isUppercase {
                //previousLetter = currentLetter // see defer block
                return true
            }
            //previousLetter = currentLetter // see defer block
            return false
        }

        func insertSpaceAtCamelcase(_ inString: String) -> String {
            var accumulate  = ""
            var lastIndexAdded = 0

            for (index, each) in inString.map({ String($0) }).enumerated() {
                if splitCamelcaseAt(each, withString: &previousLetter) {
                    accumulate += inString.substringWithRangeInt(lastIndexAdded, end: index)+" " // inserts a space
                    lastIndexAdded = index
                }
            }
            let lastStringSection = inString.substringWithRangeInt(lastIndexAdded, end: inString.count)
            return accumulate + lastStringSection
        }

        func splitAt(_ characterToCompare: Character, charToSplitAt: String = " ,-:") -> Bool {
            for each in charToSplitAt where each == characterToCompare {
                return true
            }
            return false
        }

        func splitStringToArray(_ inString: String) -> [String] {

            return inString.split(whereSeparator: { splitAt($0) }).map { String($0) }
        }

        return splitStringToArray(insertSpaceAtCamelcase(inString)).map({ $0.uppercased().substringWithRangeInt(0, end: 1) }).joined(separator: "")
    }

}
