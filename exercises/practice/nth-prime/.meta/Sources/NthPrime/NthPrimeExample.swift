enum PrimeError: Error {
  case noZerothPrime
}

func nthPrime(_ n: Int) throws -> Int {
  guard n > 0 else { throw PrimeError.noZerothPrime }
  var primes = [2]
  var candidate = 3
  while primes.count < n {
    if primes.allSatisfy({ candidate % $0 != 0 }) {
      primes.append(candidate)
    }
    candidate += 2
  }
  return primes.last!
}
