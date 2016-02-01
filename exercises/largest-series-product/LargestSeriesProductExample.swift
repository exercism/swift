// Foundation not needed

struct NumberSeries {
    
    enum Error: ErrorType {
        case InvalidCharacter
        case SpanLongerThanStringLength
        case NegativeSpan
    }
    
    let numbers: [Int]
    
    init(_ numberString: String) throws {
        self.numbers = try numberString.characters.map {
            guard let intValue = Int(String($0)) else {
                throw Error.InvalidCharacter
            }
            return intValue
        }
    }
    
    func largestProduct(numberOfDigits: Int) throws -> Int {
        guard numberOfDigits >= 0 else {
            throw Error.NegativeSpan
        }
        
        let endIndex = numbers.count - numberOfDigits
        guard endIndex >= 0 else {
            throw Error.SpanLongerThanStringLength
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
