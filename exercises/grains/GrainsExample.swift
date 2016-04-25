import Darwin



func == (left: (result: UInt64, error: String?), right:(result: UInt64, error: String?) ) -> Bool
{
    if left.result == right.result && left.error == right.error
    {
        return true
    }
    else
    {
        return false
    }
}


struct Grains {
    enum Error: ErrorType {
        case InputTooLow(String)
        case InputTooHigh(String)
    }
    
    static func square(num: Int) throws -> UInt64 {
        guard num >= 1 else {
            let message = "Input[\(num)] invalid. Input should be between 1 and 64 (inclusive)"
            throw Error.InputTooLow(message)
        }
        
        guard num <= 64 else {
            let message = "Input[\(num)] invalid. Input should be between 1 and 64 (inclusive)"
            throw Error.InputTooHigh(message)
        }
       
        let one: UInt64 = 1
        let shift = UInt64(num - 1)
        return one << shift
    }
        
    static var total:UInt64 {
        let numbers = (1...64).map { $0 }
        
        return numbers.reduce(UInt64(0)) {
            let squared = try! square($1)
            return $0 + squared
        }
    }
}
