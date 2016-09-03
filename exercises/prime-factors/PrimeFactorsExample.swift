struct PrimeFactors {

    var number: Int64

    var toArray = [Int64]()

    private func primesFor( _ number: Int64) -> [Int64] {
        var number = number
        var primes = [Int64]()
        var divisor: Int64 = 2

        while number > 1 {
            while number % divisor == 0 {
                primes.append(divisor)
                number /= divisor
            }
            divisor += 1
        }
        return primes
    }

    init(_ value: Int64) {
        self.number = value
        self.toArray = primesFor(value)

    }
}
