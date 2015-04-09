import Foundation

enum NumberClassification {
    case Perfect
    case Abundant
    case Deficient
}

class NumberClassifier {
    let number: Int
    var sum: Int {
        return aliquotSum(number)
    }
    var classification: NumberClassification {
        switch (sum) {
        case let sum where sum == number :
            return NumberClassification.Perfect
        case let sum where sum < number :
            return NumberClassification.Deficient
        default:
            return NumberClassification.Abundant
            }
    }
    func aliquotSum (input:Int)->Int {
        return  Array(Range(start:1, end:input-1)).filter( {input % $0 == 0} ).reduce(0,combine: +)
    }

    init(number: Int) {
        self.number = number
    }

}
