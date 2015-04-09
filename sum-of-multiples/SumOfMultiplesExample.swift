import Foundation


struct SumOfMultiples {
    
static func toLimit (limit:Int,   inMultiples:[Int] = [] ) -> Int{
    var multiples = inMultiples
    var arrayLimit = Array(1..<limit)
    
    if multiples.count == 0 {
        multiples = [3, 5]
    } else if multiples[0] == 0{
        multiples = Array(dropFirst(inMultiples))
    }
    
    var itemToReturn = 0
    
    for each in arrayLimit{
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