

struct SumOfMultiples {
    
    static func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
        var multiples = Set(inMultiples)
        
        if let indexOfZero = multiples.index(of: 0) {
            multiples.remove(at: indexOfZero)
        }
        
        var itemToReturn = 0
        
        for each in 1..<limit {
            var lastAdded = 0
            for multiple in multiples {
                if each % multiple == 0 {
                    if lastAdded != each {
                        itemToReturn += each
                        lastAdded = each
                    }
                }
            }
        }
        
        return itemToReturn
    }
}
