enum BaseError: Error {
    case invalidInputBase
    case invalidOutputBase
    case negativeDigit
    case invalidPositiveDigit
}

struct Base {

    static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
        guard inputBase >= 2 else {
            throw BaseError.invalidInputBase
        }

        guard outputBase >= 2 else {
            throw BaseError.invalidOutputBase
        }

        let sum = try getSum(inputDigits, base: inputBase)
        let result = getDigits(sum, base: outputBase)

        return result
    }

    private static func getSum(_ digits: [Int], base: Int) throws -> Int {
        var multiplier = 1
        var sum = 0

        for digit in digits.reversed() {
            guard digit >= 0 else {
                throw BaseError.negativeDigit
            }
            guard digit < base else {
                throw BaseError.invalidPositiveDigit
            }

            sum += digit * multiplier
            multiplier *= base
        }

        return sum
    }

    private static func getDigits(_ sum: Int, base: Int) -> [Int] {
        var sum = sum
        var digits = [Int]()
        var multiplier = 1

        while sum > 0 {
            multiplier *= base
            let value = sum % multiplier
            let digit = value / (multiplier / base)
            digits.append(digit)
            sum -= value
        }

        return digits.reversed()
    }
}
