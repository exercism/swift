import Foundation

class Bob {
    class func hey(input: String) -> String {
        if isEmpty(input) {
            return "Fine, be that way."
        } else if isShouting(input) {
            return "Woah, chill out!"
        } else if isQuestion(input) {
            return "Sure."
        } else {
            return "Whatever."
        }
    }
}


func isEmpty(input: String) -> Bool {
    return input.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).isEmpty;
}

func isQuestion(input: String) -> Bool {
    return input.hasSuffix("?")
}

func isShouting(input: String) -> Bool {
    return (input == input.uppercaseString && inputContainsALetter(input))
}

func inputContainsALetter(input: String) -> Bool {
    var containsLetter: Bool = false
    
    let regex = NSRegularExpression(pattern: "[A-Za-z]", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
    
    let range = NSMakeRange(0, count(input))
    let matches = regex?.matchesInString(input, options: .ReportCompletion, range: range)
    if let matched = matches {
        if matched.count != 0 { return true }
    }
    return false
}