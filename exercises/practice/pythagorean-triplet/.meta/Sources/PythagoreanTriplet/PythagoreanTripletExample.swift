func tripletsWithSum(_ sum: Int) -> [[Int]] {
  var result: [[Int]] = []

  for a in 1..<sum {
    for b in a..<sum {
      let c = sum - a - b

      if a * a + b * b == c * c {
        result.append([a, b, c])
      }
    }
  }

  return result
}
