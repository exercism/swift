//
//  example.swift
//  One more
//
//  Created by masters3d on 1/20/15.
//  Copyright (c) 2015 masters3d. All rights reserved.
//

import Foundation

extension String {
    var IsEmptyOrWhiteSpace:Bool { get {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).isEmpty
        }}}

struct Scrabble{
    
    
    static var letterScores =
    [ "a": 1 , "e": 1 , "i": 1 , "o": 1 , "u": 1 , "l": 1 , "n": 1 , "r": 1 , "s": 1 , "t": 1 , "d": 2 , "g": 2 , "b": 3 , "c": 3 , "m": 3 , "p": 3 , "f": 4 , "h": 4 , "v": 4 , "w": 4 , "y": 4 , "k": 5 , "j": 8 , "x": 8 , "q": 10 , "z": 10 ]
    
    
    
    static func score(input:String) -> Int {
        if (input.IsEmptyOrWhiteSpace ){
            return 0}
        
        var count:Int = 0
        for each in input.lowercaseString{
            count += letterScores[String(each)] ?? 0
        }
        return count
    }
    
    var word:String = ""
    
    var score:Int = 0
    
    init(_ word:String?) {
        self.word = word ?? ""
        self.score = Scrabble.score(word ?? "")
        
    }
    
    
    
}