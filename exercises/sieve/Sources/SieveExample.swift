struct Sieve {
    var value: Int = 0
    init(_ num: Int) {
        self.value = num
    }

    var primes: [Int] { return primesFunc(self.value ) }

    func primesFunc(_ limit: Int) -> [Int] {

        if limit < 2 { return [] } else {
            let tempArray =  Array(2...limit)
            return tempArray.filter { Sieve.onlyDivisorSelf($0) }
        }
    }

    static func onlyDivisorSelf( _ number: Int) -> Bool {
        var number = number

        var primes = [Int]()
        var divisor: Int = 2
        while number > 1 {
            while number % divisor == 0 {
                primes.append(divisor)
                number /= divisor
            }
            divisor += 1
        }
        if primes.count == 1 { return true } else { return false }
    }

}
