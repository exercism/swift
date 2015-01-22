//
//  example.swift
//  One more
//
//  Created by masters3d on 1/18/15.
//  Copyright (c) 2015 masters3d. All rights reserved.
//

import Foundation


// There seems to be something wrong with .dateByAddingTimeInterval()
// TODO: Need to investivate why it is off by 1 hour. 
// Test are not passing.

struct Gigasecond{
    
    static func newDate(input:String) -> NSDate{
        //TimeZone added to not take into account daylight savings
        let Z = ( NSTimeZone.defaultTimeZone().secondsFromGMT / 60 / 60)
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd.\(Z)"
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() as NSDate
    }
    
    static func from(dateInString:String) -> NSDate{
        
        var dateIn = newDate(dateInString)
        
        return dateIn.dateByAddingTimeInterval(1_000_000_000)
        
    }
    
}