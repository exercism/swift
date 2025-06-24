typealias ChangeClosure = @Sendable ((String, String, String)) -> (String, String, String)

let flip: ChangeClosure = { (tuple: (String, String, String)) -> (String, String, String) in
  let (a, b, c) = tuple
  return (b, a, c)
}

let rotate: ChangeClosure = { (tuple: (String, String, String)) -> (String, String, String) in
  let (a, b, c) = tuple
  return (b, c, a)
}

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> ([UInt8], (String, String, String)) -> (String, String, String) {
  { (key: [UInt8], wires: (String, String, String)) -> (String, String, String) in
    var order = wires
    for keyBit in key.reversed() {
      if keyBit == 0 {
        order = flipper(order)
      } else {
        order = rotator(order)
      }
    }
    return order
  }
}
