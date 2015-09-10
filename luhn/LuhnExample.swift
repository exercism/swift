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
            var nearestTen = Int(ceil((Double(value) / 10.00)) * 10)
            return nearestTen - value
        }
        
        var zeroCheckDigitNumber = num * 10
        var luhn = Luhn(zeroCheckDigitNumber)
        
        if luhn.isValid {
            return Double(zeroCheckDigitNumber)}
        
        return Double((zeroCheckDigitNumber) + createCheckDigit(luhn.checksum))
        
    }
    
    func addendsFunc(num:Int64)->[Int]{
        
        func oddIndexInt64Minus9(var input:[Int])->[Int]{
            input = input.reverse()
            var tempArray:[Int] = []
            for (inx, each) in enumerate(input){
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
        
        func char2Int(input:Character)-> Int{
            let tempInt = String(input).toInt() ?? -1 // -1 = error
            return tempInt
        }
        
        let tempString = "\(num)"
        
        return oddIndexInt64Minus9(Array(tempString).map{char2Int($0)})
    }
    
    
    
}
