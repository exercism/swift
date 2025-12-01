enum SquareRootError: Error {
  case negativeInput
}

struct SquareRoot {
  static func squareRoot(_ n: Int) throws -> Int {
    guard n >= 0 else {
      throw SquareRootError.negativeInput
    }
    if n == 0 || n == 1 {
      return n
    }
    var low = 1
    var high = n
    var result = 1
    while low <= high {
      let mid = low + (high - low) / 2
      if mid <= n / mid {
        result = mid
        low = mid + 1
      } else {
        high = mid - 1
      }
    }
    return result
  }
}
