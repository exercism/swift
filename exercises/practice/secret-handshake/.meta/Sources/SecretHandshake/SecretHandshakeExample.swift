let commandValues = [
  1: "wink",
  2: "double blink",
  4: "close your eyes",
  8: "jump",
]

func commands(number: Int) -> [String] {
  var result = [String]()

  for (value, name) in commandValues.sorted(by: <) {
    if number & value != 0 {
      result.append(name)
    }
  }

  if number & 16 != 0 {
    result.reverse()
  }

  return result
}
