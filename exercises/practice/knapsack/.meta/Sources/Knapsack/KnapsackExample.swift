struct Knapsack {
  static func maximumValue(_ items: [Item], _ capacity: Int) -> Int {
    if items.count == 0 {
      return 0
    }

    var values: Array<Int> = Array(repeating: 0, count: capacity + 1)
    for item in items {
      var next: Array<Int> = Array(repeating: 0, count: values.count)
      for i in 0..<values.count {
        if item.weight <= i {
          let valueWith = values[i - item.weight] + item.value
          next[i] = max(valueWith, values[i])
        } else {
          next[i] = values[i]
        }
      }
      values = next
    }
    return values.last!
  }
}