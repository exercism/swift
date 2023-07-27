let AllAllergens: KeyValuePairs = [
  "eggs": 1,
  "peanuts": 2,
  "shellfish": 4,
  "strawberries": 8,
  "tomatoes": 16,
  "chocolate": 32,
  "pollen": 64,
  "cats": 128,
]

class Allergies {
  let allergies: [String]

  init(_ score: UInt) {
    self.allergies = AllAllergens.map { (key, value) in
      return (score & UInt(value) != 0) ? key : nil
    }.compactMap { $0 }
  }

  func allergicTo(item: String) -> Bool {
    return allergies.contains(item)
  }

  func list() -> [String] {
    return allergies
  }
}
