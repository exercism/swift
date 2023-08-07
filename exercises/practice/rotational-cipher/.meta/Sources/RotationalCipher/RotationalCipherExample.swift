func rotate(_ input: String, by shift: Int) -> String {
  let lowercaseAlphabet = Array("abcdefghijklmnopqrstuvwxyz")
  let uppercaseAlphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

  var result = ""

  for char in input {
    if let index = lowercaseAlphabet.firstIndex(of: char) {
      let newIndex = (index + shift) % lowercaseAlphabet.count
      result.append(lowercaseAlphabet[newIndex])
    } else if let index = uppercaseAlphabet.firstIndex(of: char) {
      let newIndex = (index + shift) % uppercaseAlphabet.count
      result.append(uppercaseAlphabet[newIndex])
    } else {
      result.append(char)
    }
  }

  return result
}
