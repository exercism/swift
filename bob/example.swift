//
//  Bob.swift
//  Bob
//
//  Created by Hank Turowski on 6/7/14.
//  Copyright (c) 2014 Turowski. All rights reserved.
//

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
    
    let range = NSMakeRange(0, countElements(input))
    let matches = regex.matchesInString(input, options: NSMatchingOptions.ReportCompletion, range: range)
    return (matches.count != 0) ? true : false
}