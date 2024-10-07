import Foundation

func dartScore(x: Double, y: Double) -> Int {
  let distance = sqrt(x * x + y * y)
  switch distance {
  case 0...1:
    return 10
  case 1...5:
    return 5
  case 5...10:
    return 1
  default:
    return 0
  }
}
