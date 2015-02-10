
import Foundation


extension Array{
    
    func keep(inputFunc:(T) -> Bool, compare:Bool = true )->Array {
        var array2Return:Array = []
        for each in self{
            if inputFunc(each) == compare{
                array2Return.append(each)}
                        }
        return array2Return
    }
    
    func discard(inputFunc:(T) -> Bool)->Array{
        return keep(inputFunc, compare: false)
    }
}