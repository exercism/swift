enum NumberClassification {
    case perfect
    case abundant
    case deficient
}

struct NumberClassifier {
    let number: Int
    var sum: Int {
        return aliquotSum(number)
    }
    var classification: NumberClassification {
        switch (sum) {
        case let sum where sum == number :
            return NumberClassification.perfect
        case let sum where sum < number :
            return NumberClassification.deficient
        default:
            return NumberClassification.abundant
        }
    }
    func aliquotSum (_ input: Int) -> Int {
        return  Array(1..<(input-1)).filter({input % $0 == 0}).reduce(0, combine: +)
    }

    init(number: Int) {
        self.number = number
    }

}
