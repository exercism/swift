// Foundation not needed

// Apple Swift version 2.0

private extension String {
    subscript (range: Range<Int>) -> String {
        get {
            let start = startIndex.advancedBy(range.startIndex)
            let end   = start.advancedBy(range.endIndex - range.startIndex)
            
            return self[Range(start: start, end: end)]
        }
    }

    var onlyDigits: String {
        return String(characters.filter { $0.isDigit })
    }
}

private extension Character {
    var isDigit: Bool {
        return "0123456789".characters.contains(self)
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

