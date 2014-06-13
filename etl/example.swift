//
//  example.swift
//  ExercismConversion
//
//  Created by Hank Turowski on 6/12/14.
//  Copyright (c) 2014 Turowski. All rights reserved.
//

import Foundation

class ETL {
    class func transform(old: Dictionary<Int, Array<String>>) -> Dictionary<String, Int>
    {
        var result = Dictionary<String, Int>()
        for (score, letters) in old {
            for letter in letters {
                result[letter.lowercaseString] = score
            }
        }
        return result
    }
}