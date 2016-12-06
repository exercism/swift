//
//  beer-song.swift
//  xSwift
//
//  Created by Alwyn Savio Concessao on 01/12/16.
//  Copyright © 2016 exercism.io. All rights reserved.
//
class BeerSong{

    let numberOfBeerBottles = 99
    func generateVersesOfBeerSong() {
       var numberOfBottlesOfBeer = numberOfBeerBottles
       while numberOfBottlesOfBeer > 2 {
       print("\(numberOfBottlesOfBeer) bottles of beer on the wall,\(numberOfBottlesOfBeer) bottles of beer.")
       numberOfBottlesOfBeer -= 1
       print("Take one down and pass it around,\(numberOfBottlesOfBeer) bottles of beer on the wall.")
}
        while numberOfBottlesOfBeer <= 2 {
        switch(numberOfBottlesOfBeer){
            case 2:print("\(numberOfBottlesOfBeer) bottles of beer on the wall,\(numberOfBottlesOfBeer) bottles of beer.")
                   numberOfBottlesOfBeer -= 1
                   print("Take one down and pass it around,\(numberOfBottlesOfBeer) bottle of beer on the wall.")
            
            case 1:print("\(numberOfBottlesOfBeer) bottle of beer on the wall,\(numberOfBottlesOfBeer) bottle of beer.")
                   numberOfBottlesOfBeer -= 1
                   print("Take one down and pass it around,no more bottles of beer on the wall.")
        
            case 0:print("No more bottles of beer on the wall,no more bottles of beer.")
                   numberOfBottlesOfBeer += numberOfBeerBottles
                   print("Go to the store and buy some more,\(numberOfBottlesOfBeer) bottles of beer on the wall.")

            default:break
        }
        
        }
    }
}

