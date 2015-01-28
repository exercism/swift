//
//  example.swift
//  One more
//
//  Created by masters3d on 2/25/15.
//  Copyright (c) 2015 masters3d. All rights reserved.
//

import Foundation


struct PrimeFactors{
    
    static func For(var number:Int64)->[Int64]{
        
        var primes = [Int64]()
        var divisor:Int64 = 2
        
        while (number > 1){
            while (number % divisor == 0){
                primes.append(divisor)
                number /= divisor
            }
            divisor++
        }
        return primes
    }
}




