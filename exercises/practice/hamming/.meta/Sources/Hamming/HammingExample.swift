enum HammingError: Error {
  case differentLength
}

func compute(_ dnaSequence: String, against: String) throws -> Int? {
  guard dnaSequence.count == against.count else {
    throw HammingError.differentLength
  }
  let distance: Int = zip(dnaSequence, against).filter({ $0 != $1 }).count
  return distance
}
