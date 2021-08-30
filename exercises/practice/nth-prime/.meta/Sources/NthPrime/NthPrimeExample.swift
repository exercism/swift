#if os(Linux)
    import Glibc
#elseif os(OSX)
    import Darwin
#endif

struct Prime {
    static func nth(_ nth: Int) -> Int? {
        if nth < 1 {
            return nil
        }

        var primes = 0
        var i = 1

        while primes < nth {
            i += 1
            if isPrime(i) {
                primes += 1
            }
        }

        return i
    }

    private static func isPrime(_ number: Int) -> Bool {
        if number == 1 {
            return false
        } else if number == 2 {
            return true
        }

        for i in 2...Int(ceil(sqrt(Double(number)))) where number % i == 0 {
            return false
        }

        return true
    }
}
