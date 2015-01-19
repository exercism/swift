//
//  example.swift
//  One more
//
//  Created by masters3d on 1/18/15.
//  Copyright (c) 2015 masters3d. All rights reserved.
//

import Foundation

struct Gigasecond{
    
    static func from(dateIn:NSDate) -> NSDate{
     
        return dateIn.dateByAddingTimeInterval(1_000_000_000)
        
    }
    
}