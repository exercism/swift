import Foundation
import Dispatch

private extension String {

    var length: Int { return self.count }

    func reverse() -> String {
        return String(reversed())
    }
}

struct PalindromeProducts {

    typealias Palindrome = (value: Int, factor: [Int])
    private let maxFactor: Int
    private let minFactor: Int

    var largest: Palindrome { return calculate(.max) }
    var smallest: Palindrome { return calculate(.min) }

    init(maxFactor: Int, minFactor: Int = 1) {
        self.maxFactor = maxFactor
        self.minFactor = minFactor
    }

    private enum Mode { case max, min }
    private func calculate(_ upTo: Mode) -> Palindrome {

        let rangeOuter = minFactor...maxFactor

        //Multithreaded code
        var results = [[Palindrome]](repeating: [Palindrome](), count: rangeOuter.count)
        // use this queue to read and write from results
        let resultsRWQueue = DispatchQueue.init(label: "exercism.resultsRWQueue")

        DispatchQueue.concurrentPerform(iterations: rangeOuter.count) { advanceByIndex in
            var multiplicationsTemp = [Palindrome]()
            let each = rangeOuter.lowerBound + advanceByIndex
            let innerRangeCustom = each...rangeOuter.upperBound

            for eaInside in innerRangeCustom {
                let multiplied = each * eaInside
                let number = String(multiplied)
                if number == number.reverse() {
                    multiplicationsTemp.append((multiplied, [each, eaInside]))
                }
            }
            // prevent data race conditions
            resultsRWQueue.async {
                results[advanceByIndex] = multiplicationsTemp
            }
        }
        var multiplications = [Palindrome]()
        // prevent data race conditions
        resultsRWQueue.sync {
            multiplications = results.joined().sorted(by: { $0.value > $1.value })
        }
        if let large = multiplications.first, let small = multiplications.last {
            switch upTo {
            case .max: return large
            case .min: return small
            }
        } else {
            switch upTo {
            case .max: return (maxFactor, [maxFactor, 1])
            case .min: return (minFactor, [minFactor, 1])
            }
        }
    }
}
