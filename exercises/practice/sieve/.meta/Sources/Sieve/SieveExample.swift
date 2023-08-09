func sieve(limit: Int) -> [Int] {
  var result: [Int] = []
  guard limit > 1 else { return result }
  var numbers: [Int] = Array(2...limit)
  while !numbers.isEmpty {
    let prime = numbers.removeFirst()
    result.append(prime)
    numbers = numbers.filter { $0 % prime != 0 }
  }
  return result
}
