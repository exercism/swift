//
//  example.swift
//  ExercismConversion
//
//  Created by Hank Turowski on 6/11/14.
//  Copyright (c) 2014 Turowski. All rights reserved.
//

import Foundation

class DNA {
    
    class func withStrand(strand: String) -> DNA? {
        if strand.rangeOfCharacterFromSet(invalidDNANucleotides(), options: NSStringCompareOptions.LiteralSearch) {
            return nil
        }
        var result = DNA()
        result.DNAStrand = strand
        return result
    }
    
    var DNAStrand = ""
    var nucleotideCounts: Dictionary<String, Int> {
        get {
            var result = ["A": 0 , "T": 0, "C": 0, "G": 0]
            for (k, _) in result {
                result[k] = self.count(k)
            }
            return result
        }
    }
    
    func count(target: String) -> Int? {
        
        if target.rangeOfCharacterFromSet(invalidDNANucleotides(), options: NSStringCompareOptions.LiteralSearch) {
            return nil
        }
        var matches = 0
        for char in DNAStrand {
            if "\(char)" == target {
                matches++
            }
        }
        return matches
    }

}

func invalidDNANucleotides() -> NSCharacterSet {
    return NSCharacterSet(charactersInString: "ACGT").invertedSet
}
