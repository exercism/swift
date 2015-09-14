// Foundation not needed

// Apple Swift version 2.0

private extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = startIndex.advancedBy(r.endIndex - r.startIndex)
            
            return self[Range(start: startIndex, end: endIndex)]
        }
    }
}

class PhoneNumber {
    var phoneNumber: String
    
    init(startingNumber: String) {
        phoneNumber = removeNonDigits(startingNumber)
        if phoneNumber.characters.count == 11 {
            if phoneNumber.hasPrefix("1") {
                phoneNumber = phoneNumber[1...10]
            } else {
                phoneNumber = "0000000000"
            }
        } else if phoneNumber.characters.count != 10 {
            phoneNumber = "0000000000"
        }
    }
    
    func number() -> String {
        return phoneNumber
    }
    
    func areaCode() -> String {
        return phoneNumber[0...2]
    }
    
    func description() -> String {
        let prefix = phoneNumber[3...5]
        let final = phoneNumber[6...9]
        return "(\(self.areaCode())) \(prefix)-\(final)"
    }

}

func removeNonDigits(input: String) -> String {
    var result = ""
    for char in input.characters {
        if let _ = Int("\(char)") {
            if char != "-" {
                result += "\(char)"
            }
        }
    }
    return result
}

