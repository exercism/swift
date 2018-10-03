enum CollatzConjectureError: Error {
    case numberNotPositive
}

struct CollatzConjecture {

    static func steps(_ number: Int) throws -> Int? {
        guard number > 0 else {
            throw CollatzConjectureError.numberNotPositive
        }

        var number = number
        var steps = 0

        while number > 1 {
            steps += 1

            if number % 2 == 0 {
                number /= 2
            } else {
                number = number * 3 + 1
            }
        }

        return steps
    }
}
