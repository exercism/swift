// Foundation not needed

// Apple Swift version 2.1

private extension String {
    
    var length: Int {return self.characters.count}
    
    func reverse() -> String {
        var result:String = ""
        for char in self.characters {
            result = "\(char)\(result)"
        }
        return result
    }
}

struct PalindromeProducts{
    
    typealias Palindrome = (value:Int, factor:[Int])
    private let maxFactor:Int
    private let minFactor:Int
    
    var largest:Palindrome {return calculate(.max)}
    var smallest:Palindrome {return calculate(.min)}
    
    init(maxFactor: Int, minFactor: Int = 1) {
        self.maxFactor = maxFactor
        self.minFactor = minFactor
    }
    
    private enum Mode { case max, min }
    private func calculate(upTo:Mode)->Palindrome{
        
        let rangeOuter = minFactor...maxFactor
        var rangeInner = rangeOuter
        var multiplications = [Palindrome]()
        
        for each in rangeOuter{
            for eaInside in rangeInner{
            let multiplied = each * eaInside
            let number = String(multiplied)
            if number == number.reverse(){
                multiplications.append((multiplied,[each,eaInside]))
            }
          }
          rangeInner = rangeInner.dropFirst(1).indices
        }
        multiplications.sortInPlace({$0.0 > $1.0})
        
        if let large = multiplications.first, let small = multiplications.last{
            
            switch upTo{
            case .max : return large
            case .min : return small
            }
        } else {
            switch upTo{
            case .max : return (self.maxFactor,[self.maxFactor, 1])
            case .min : return (self.minFactor,[self.minFactor, 1])
            }
            
        }
        
        
    }
    
    
    
    
    
}


