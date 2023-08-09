class Triangle {
  var sides: [Double]

  init(_ sides: [Double]) {
    self.sides = sides
  }

  var isEquilateral: Bool {
    guard Triangle.isValidTriangle(sides) else { return false }
    return sides[0] == sides[1] && sides[1] == sides[2]
  }

  var isIsosceles: Bool {
    guard Triangle.isValidTriangle(sides) else { return false }
    return sides[0] == sides[1] || sides[1] == sides[2] || sides[0] == sides[2]
  }

  var isScalene: Bool {
    guard Triangle.isValidTriangle(sides) else { return false }
    return sides[0] != sides[1] && sides[1] != sides[2] && sides[0] != sides[2]
  }

  private static func isValidTriangle(_ sides: [Double]) -> Bool {
    return sides[0] + sides[1] > sides[2] && sides[1] + sides[2] > sides[0]
      && sides[0] + sides[2] > sides[1]
  }
}
