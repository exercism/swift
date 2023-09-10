enum PhoneNumberError: Error {
  case invalidPhoneNumber
}

class PhoneNumber {
  var number: String

  init(_ phrase: String) {
    self.number = phrase
  }

  func clean() throws -> String {
    var cleanNumber = number.filter { $0.isNumber }
    if cleanNumber.count == 11 && cleanNumber.first == "1" {
      cleanNumber.removeFirst()
    }
    let areaCode = cleanNumber.index(cleanNumber.startIndex, offsetBy: 3)

    if cleanNumber.count != 10 || ["0", "1"].includes(cleanNumber.first)
      || ["0", "1"].includes(cleanNumber[areaCode])
    {
      throw PhoneNumberError.invalidPhoneNumber
    }
    return cleanNumber
  }
}
