import Darwin



struct Luhn {
    
    var number:Int64 = 0
    var addends:[Int] { return addendsFunc(number)}
    var checksum:Int {return addends.reduce(0, combine: +) }
    var isValid : Bool { return checksum % 10 == 0}
    
    init(_ num:Int64){
        self.number = num
    }
    
    static func create (num:Int64)->Double{
        
        func createCheckDigit(value:Int) -> Int{
            let nearestTen = Int(ceil((Double(value) / 10.00)) * 10)
            return nearestTen - value
        }
        
        let zeroCheckDigitNumber = num * 10
        let luhn = Luhn(zeroCheckDigitNumber)
        
        if luhn.isValid {
            return Double(zeroCheckDigitNumber)}
        
        return Double((zeroCheckDigitNumber) + createCheckDigit(luhn.checksum))
        
    }
    
    func addendsFunc(num:Int64)->[Int]{
        
        #if swift(>=3.0)
        func oddIndexInt64Minus9( input:[Int])->[Int]{
            var input = input
            input = Array(input.reversed())
            var tempArray:[Int] = []
            for (inx, each) in input.enumerated(){
                var tempEach:Int = each
                if (inx+1) % 2 == 0 {
                    tempEach *= 2
                    if tempEach > 10 {
                        tempEach -= 9
                    }
                    tempArray.insert(tempEach, at: 0)
                } else {
                    tempArray.insert(tempEach, at: 0)
                }
            }
            return tempArray
        }
        
        #else
            func oddIndexInt64Minus9( input:[Int])->[Int]{
            var input = input
            input = Array(input.reverse())
            var tempArray:[Int] = []
            for (inx, each) in input.enumerate(){
            var tempEach:Int = each
            if (inx+1) % 2 == 0 {
            tempEach *= 2
            if tempEach > 10 {
            tempEach -= 9
            }
            tempArray.insert(tempEach, atIndex: 0)
            } else {
            tempArray.insert(tempEach, atIndex: 0)
            }
            }
            return tempArray
            }
        #endif
        
        func char2Int(input:Character)-> Int{
            let tempInt = Int(String(input)) ?? -1 // -1 = error
            return tempInt
        }
        
        let tempString = "\(num)"
        
        return oddIndexInt64Minus9(Array(tempString.characters).map{char2Int($0)})
    }
    
    
    
}
