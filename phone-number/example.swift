//
//  PhoneNumber.swift
//  ExercismConversion
//
//  Created by Hank Turowski on 6/11/14.
//  Copyright (c) 2014 Turowski. All rights reserved.
//

import Foundation

extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = advance(self.startIndex, r.startIndex)
            let endIndex = advance(startIndex, r.endIndex - r.startIndex)
            
            return self[Range(start: startIndex, end: endIndex)]
        }
    }
}

class PhoneNumber {
    var phoneNumber: String
    
    init(startingNumber: String) {
        phoneNumber = removeNonDigits(startingNumber)
        if countElements(phoneNumber) == 11 {
            if phoneNumber.hasPrefix("1") {
                phoneNumber = phoneNumber[1..11]
            } else {
                phoneNumber = "0000000000"
            }
        } else if countElements(phoneNumber) != 10 {
            phoneNumber = "0000000000"
        }
    }
    
    func number() -> String {
        return phoneNumber
    }
    
    func areaCode() -> String {
        return phoneNumber[0..3]
    }
    
    func description() -> String {
        let prefix = phoneNumber[3...5]
        let final = phoneNumber[6...9]
        return "(\(self.areaCode())) \(prefix)-\(final)"
    }

}

func removeNonDigits(input: String) -> String {
    var result = ""
    for char in input {
        if "\(char)".toInt() && char != "-" {
            result += char
        }
    }
    return result
}

