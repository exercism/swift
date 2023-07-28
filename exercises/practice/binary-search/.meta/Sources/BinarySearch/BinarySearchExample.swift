enum BinarySearchError: Error {
  case valueNotFound
}

class BinarySearch {
  var array: [Int]

  init(_ array: [Int]) {
    self.array = array
  }

  func searchFor(_ value: Int) throws -> Int {
    var i = 0
    var j = array.count - 1
    while i <= j {
      let m = (i + j) / 2
      if array[m] == value {
        return m
      } else if array[m] < value {
        i = m + 1
      } else {
        j = m - 1
      }
    }

    throw BinarySearchError.valueNotFound
  }
}
