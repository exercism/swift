//
//  example.swift
//  One more
//
//  Created by masters3d on 1/19/15.
//  Copyright (c) 2015 masters3d. All rights reserved.
//

import Foundation

let triangleKind = (Equilateral:"Equilateral",Isosceles:"Isosceles",Scalene:"Scalene",ErrorKind:"ErrorKind")


struct Triangle {
    
    func uniqueSides() -> Int{
        var tempSet:NSMutableArray = []
        for each in [a,b,c]{
            if !tempSet.containsObject(each) {
                tempSet.addObject(each)
            }
        }
        
        return tempSet.count
    }
    
    
    func allSidesAreZero() -> Bool{
        return a == 0 && b == 0 && c == 0
    }
    
    func hasImpossibleSides() -> Bool{
        return a < 0 || b < 0 || c < 0
    }
    
    func violatesTriangleInequality() -> Bool{
        return a + b <= c || a + c <= b || b + c <= a
    }
    
    func Kind()->String{
        
        if (allSidesAreZero() || hasImpossibleSides() || violatesTriangleInequality()) {
            return triangleKind.ErrorKind
        }
        
        let unique = uniqueSides()
        
        if (unique == 1){
            return triangleKind.Equilateral}
        
        if (unique == 2){
            
            return triangleKind.Isosceles}
        
        return triangleKind.Scalene
    }
    
    var a:Double = 0
    var b:Double = 0
    var c:Double = 0
    
    var kind:String { get { return self.Kind() }}
    
    init(_ a:Double, _ b:Double, _ c:Double){
        (self.a,self.b,self.c) = (a,b,c)
        
        
    }
}