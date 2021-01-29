struct SumOfMultiples {

    static func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
        guard limit > 0 else { return 0 }
        var multiples = Set(inMultiples)

        if let indexOfZero = multiples.index(of: 0) {
            multiples.remove(at: indexOfZero)
        }

        var itemToReturn = 0

        for each in 1..<limit {
            var lastAdded = 0
            for multiple in multiples where ((each % multiple == 0) && (lastAdded != each)) {
                itemToReturn += each
                lastAdded = each
            }
        }

        return itemToReturn
    }
}
