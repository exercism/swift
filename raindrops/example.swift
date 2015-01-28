import Foundation


struct Raindrops {
    
    static func convert(number:Int)->String{
    var result = ""
        if (number % 3 == 0){
    result += "Pling"}
        if (number % 5 == 0){
    result += "Plang"}
        if (number % 7 == 0){
    result += "Plong"}
        if (result.isEmpty){
            result = String(number)}
    return result
    }



}

