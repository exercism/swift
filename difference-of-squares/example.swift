
import Foundation

struct Squares {
    
    var max = 1
    
    init (_ max:Int){
        if max > 0{
            self.max = max
        }
    }
    
    var squareOfSums:Int{
        var numbers = Array(1...self.max)
        var sum = numbers.reduce(0, combine: + )
        return sum * sum;
    }
    
    var sumOfSquares:Int{
        var numbers = Array(1...self.max)
        return numbers.map{ return $0*$0 }.reduce(0, combine: + )
        
    }
    
    
    var differenceOfSquares:Int{
        return squareOfSums - sumOfSquares
    }
    
    
    
    
    
}