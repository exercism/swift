import Foundation

enum GrainsError: Error {
  case inputTooLow
  case inputTooHigh
}

struct Grains {

  static func square(_ num: Int) throws -> UInt64 {
    guard num >= 1 else {
      throw GrainsError.inputTooLow
    }

    guard num <= 64 else {
      throw GrainsError.inputTooHigh
    }

    let one: UInt64 = 1
    let shift = UInt64(num - 1)
    return one << shift
  }

  static var total: UInt64 {
    let numbers = (1...64).map { $0 }

    return numbers.reduce(UInt64(0)) {
      guard let squared = try? square($1) else { return $0 }
      return $0 + squared
    }
  }
}
