//
//  Leap.swift
//  ExercismConversion
//
//  Created by Hank Turowski on 6/11/14.
//  Copyright (c) 2014 Turowski. All rights reserved.
//

import Foundation

class Year {
    var year = 1900
    init(calendarYear: Int) {
        year = calendarYear
    }
    var isLeapYear: Bool {
    get {
        return (year%4 == 0 && year%100 != 0 ) || year%400 == 0;
    }
    }
}