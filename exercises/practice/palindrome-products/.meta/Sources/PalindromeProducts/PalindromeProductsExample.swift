enum PalindromeError: Error {
  case invalidRange
}

class PalindromeProducts {
  static func largest(from: Int, to: Int) throws -> (value: Int?, factors: Set<[Int]>) {
    guard from <= to else {
      throw PalindromeError.invalidRange
    }
    var result: (value: Int?, factors: Set<[Int]>) = (0, [])
    var wasBigger = false
    for i in (from...to).reversed() {
      wasBigger = false
      for j in (i...to).reversed() {
        let product = i * j
        if product > result.value! {
          wasBigger = true
          if isPalindrome(product) {
            result = (product, [[i, j]])
          }
        } else if product == result.value! {
          result.factors.insert([i, j])
        }
      }
      if !wasBigger {
        break
      }
    }

    if result.value == 0 {
      result.value = nil
    }

    return result
  }

  static func smallest(from: Int, to: Int) throws -> (value: Int?, factors: Set<[Int]>) {
    guard from <= to else {
      throw PalindromeError.invalidRange
    }
    var result: (value: Int?, factors: Set<[Int]>) = (Int.max, [])

    var wasSmaller = false
    for i in from...to {
      wasSmaller = false
      for j in i...to {
        let product = i * j
        if product < result.value! {
          wasSmaller = true
          if isPalindrome(product) {
            result = (product, [[i, j]])
          }
        } else if product == result.value! {
          result.factors.insert([i, j])
        }
      }
      if !wasSmaller {
        break
      }
    }

    if result.value == Int.max {
      result.value = nil
    }

    return result
  }

  private static func isPalindrome(_ number: Int) -> Bool {
    let numberString = String(number)
    return numberString == String(numberString.reversed())
  }
}
