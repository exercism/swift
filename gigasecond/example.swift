//
//  example.swift
//  One more
//
//  Created by masters3d on 1/18/15.
//  Copyright (c) 2015 masters3d. All rights reserved.
//

import Foundation


struct Gigasecond{
    
    static func newDate(input:String, var format:String = "yyyy-MM-dd'T'HH:mm:ss" ) -> NSDate{
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(input) ?? NSDate.distantFuture() as NSDate
    }
    
    static func from(dateInString:String) -> NSDate{
        
        var dateIn = newDate(dateInString)
        
        return dateIn.dateByAddingTimeInterval(1_000_000_000)
        
    }
    
}