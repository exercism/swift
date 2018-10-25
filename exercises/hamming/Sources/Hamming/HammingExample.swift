func compute(_ dnaSequence: String, against: String) -> Int? {
  if dnaSequence.count != against.count {
    return nil
  }
  let distance: Int = zip(dnaSequence, against).filter({ $0 != $1 }).count
  return distance
}
