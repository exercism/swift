enum Classification {
  case perfect
  case abundant
  case deficient
}

enum ClassificationError: Error {
  case invalidInput
}

func classify(number: Int) throws -> Classification {
  guard number > 0 else {
    throw ClassificationError.invalidInput
  }
  var sum = 0
  for i in 1..<number {
    if number % i == 0 {
      sum += i
    }
  }
  if sum == number {
    return .perfect
  } else if sum > number {
    return .abundant
  } else {
    return .deficient
  }
}
