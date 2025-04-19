func getName(_ item: (name: String, amount: Int)) -> String {
  return item.name
}

func createToy(name: String, amount: Int) -> (name: String, amount: Int) {
  return (name, amount)
}

func updateQuantity(_ items: [(name: String, amount: Int)], toy: String, amount: Int) -> [(name: String, amount: Int)]{
  var result: [(name: String, amount: Int)] = []
  for item in items {
    if getName(item) == toy {
      result.append((item.name, amount))
    }
    else {
      result.append(item)
    }
  }
  return result
}

func addCategory(_ items: [(name: String, amount: Int)], category: String) -> [(name: String, amount: Int, category: String)] {
  var result: [(name: String, amount: Int, category: String)] = []
  for item in items { 
    result.append((item.name, item.amount, category))
  }
  return result
}
