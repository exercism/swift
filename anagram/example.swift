//
//  Anagram.swift
//  ExercismConversion
//
//  Created by Hank Turowski on 6/10/14.
//  Copyright (c) 2014 Turowski. All rights reserved.
//

import Foundation

class Anagram
{
    var baseWord = ""
    init (word: String) {
        baseWord = word
    }
    
    func match(words: String[]) -> String[] {
        var matches: String[] = []
        
        for candidateWord in words {
            if sortLetters(baseWord.lowercaseString) == sortLetters(candidateWord.lowercaseString)
                && baseWord.lowercaseString != candidateWord.lowercaseString {
                matches.append(candidateWord)
            }
        }
        
        return matches
    }
    
}

func sortLetters(wordToSort: String) -> String {
    var characters: String[] = []
    for char in wordToSort {
        characters.append("\(char)")
    }
    characters = sort(characters, {c1, c2 in return c1 < c2})
    return characters.reduce("", +)
}
