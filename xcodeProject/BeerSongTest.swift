//
//  beerSongTest.swift
//  xSwift
//
//  Created by Alwyn Savio Concessao on 01/12/16.
//  Copyright © 2016 exercism.io. All rights reserved.
//
#if swift(>=3.0)
import XCTest
#endif


class BeerSongTest: XCTestCase {
    
    var beerSong :BeerSong!
    override func setUp() {
        
        beerSong = BeerSong()
    }
    
    func testGenerateSongVerses() {
        
        beerSong.generateVersesOfBeerSong()
    }
    
    override func tearDown() {
        
        beerSong = nil
    }
    
}
