//
//  example.swift
//  ExercismConversion
//
//  Created by Hank Turowski on 6/9/14.
//  Copyright (c) 2014 Turowski. All rights reserved.
//

import Foundation

class Hamming {
    class func compute(input: String, against: String) -> Int {
        var differences = 0

        let char1 = convertStringToArray(input)
        let char2 = convertStringToArray(against)

        let minLength = char1.count < char2.count ? char1.count : char2.count
        for i in 0..minLength {
            if char1[i] != char2[i] {
                differences++
            }
        }
        return differences
    }

}

func convertStringToArray(input: String) -> Character[] {
    var characterArray: Character[] = []
    
    for character in input {
        characterArray.append(character)
    }
    
    return characterArray
}
