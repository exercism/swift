struct ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    var result = [String: Int]()
    for (score, letters) in old {
      for letter in letters {
        result[letter.lowercased()] = Int(score)
      }
    }
    return result
  }
}
