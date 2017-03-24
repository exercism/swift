import Foundation

struct Grains {

    enum GrainsError: Error {
        case inputTooLow(String)
        case inputTooHigh(String)
    }

    static func square(_ num: Int) throws -> UInt64 {
        guard num >= 1 else {
            let message = "Input[\(num)] invalid. Input should be between 1 and 64 (inclusive)"
            throw GrainsError.inputTooLow(message)
        }

        guard num <= 64 else {
            let message = "Input[\(num)] invalid. Input should be between 1 and 64 (inclusive)"
            throw GrainsError.inputTooHigh(message)
        }

        let one: UInt64 = 1
        let shift = UInt64(num - 1)
        return one << shift
    }

    static var total: UInt64 {
        let numbers = (1...64).map { $0 }

        return numbers.reduce(UInt64(0)) {
            guard let squared = try? square($1) else { return $0 }
            return $0 + squared
        }
    }
}
