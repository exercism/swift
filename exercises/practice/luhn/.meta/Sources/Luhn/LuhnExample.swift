func isValidLuhn(_ number: String) -> Bool {
  var number = number
  var sum = 0
  var odd = true
  number.replace(" ", with: "")
  guard number.count > 1 else { return false }
  for char in number.reversed() {
    if let digit = Int(String(char)) {
      sum += odd ? digit : digit < 5 ? digit * 2 : digit * 2 - 9
      odd.toggle()
    } else {
      return false
    }
  }
  return sum % 10 == 0
}
