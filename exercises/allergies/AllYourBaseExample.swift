// Foundation not needed

enum BaseError: ErrorType {
    case InvalidInputBase
    case InvalidOutputBase
    case NegativeDigit
    case InvalidPositiveDigit
}

struct Base {
    
    static func outputDigitsFromInputBase(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
        guard inputBase >= 2 else {
            throw BaseError.InvalidInputBase
        }
        
        guard outputBase >= 2 else {
            throw BaseError.InvalidOutputBase
        }
        
        let sum = try getSumFromDigits(inputDigits, base: inputBase)
        let result = getDigitsFromSum(sum, base: outputBase)
        
        return result
    }
    
    private static func getSumFromDigits(digits: [Int], base: Int) throws -> Int {
        var multiplier = 1
        var sum = 0
        
        for digit in digits.reverse() {
            guard digit >= 0 else {
                throw BaseError.NegativeDigit
            }
            guard digit < base else {
                throw BaseError.InvalidPositiveDigit
            }
            
            sum += digit * multiplier
            multiplier *= base
        }
        
        return sum
    }
    
    private static func getDigitsFromSum(sum: Int, base: Int) -> [Int] {
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
        
        return digits.reverse()
    }
}