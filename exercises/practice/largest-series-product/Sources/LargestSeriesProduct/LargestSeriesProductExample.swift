struct NumberSeries {

    enum NumberSeriesError: Error {
        case invalidCharacter
        case spanLongerThanStringLength
        case negativeSpan
    }

    let numbers: [Int]

    init(_ numberString: String) throws {
        self.numbers = try numberString.map {
            guard let intValue = Int(String($0)) else {
                throw NumberSeriesError.invalidCharacter
            }
            return intValue
        }
    }

    func largestProduct(_ numberOfDigits: Int) throws -> Int {
        guard numberOfDigits >= 0 else {
            throw NumberSeriesError.negativeSpan
        }

        let endIndex = numbers.count - numberOfDigits
        guard endIndex >= 0 else {
            throw NumberSeriesError.spanLongerThanStringLength
        }

        var result = 0

        for startIndex in 0 ... endIndex {
            let selectedNumbers = numbers[startIndex ..< startIndex + numberOfDigits]

            var total = 1

            for selectedNumber in selectedNumbers {
                total *= selectedNumber
            }

            if total > result {
                result = total
            }
        }

        return result
    }

}
