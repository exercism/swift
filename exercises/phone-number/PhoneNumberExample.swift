// Foundation not needed

// Apple Swift version 2.1

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

struct PhoneNumber: CustomStringConvertible {
    let number: String
    
    init(_ startingNumber: String) {
        let digits = startingNumber.onlyDigits

        switch digits.characters.count {
        case 10:
            number = digits
        case 11 where digits.hasPrefix("1"):
            number = digits[1...10]
        default:
            number = "0000000000"
        }
    }

    var areaCode: String {
        return number[0...2]
    }
    
    var description: String {
        let prefix = number[3...5]
        let final  = number[6...9]
        return "(\(areaCode)) \(prefix)-\(final)"
    }
}
