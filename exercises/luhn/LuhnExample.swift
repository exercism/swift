import Darwin



struct Luhn {
    
    var number:Int64 = 0
    var addends:[Int] { return addendsFunc(number)}
    var checksum:Int {return addends.reduce(0, combine: +) }
    var isValid : Bool { return checksum % 10 == 0}
    
    init(_ num:Int64){
        self.number = num
    }
    
    static func create (_ num:Int64)->Double{
        
        func createCheckDigit(_ value:Int) -> Int{
            let nearestTen = Int(ceil((Double(value) / 10.00)) * 10)
            return nearestTen - value
        }
        
        let zeroCheckDigitNumber = num * 10
        let luhn = Luhn(zeroCheckDigitNumber)
        
        if luhn.isValid {
            return Double(zeroCheckDigitNumber)}
        
        return Double((zeroCheckDigitNumber) + createCheckDigit(luhn.checksum))
        
    }
    
    func addendsFunc(_ num:Int64)->[Int]{
            func oddIndexInt64Minus9( _ input:[Int])->[Int]{
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
        
        
        func char2Int(_ input:Character)-> Int{
            let tempInt = Int(String(input)) ?? -1 // -1 = error
            return tempInt
        }
        
        let tempString = "\(num)"
        
        return oddIndexInt64Minus9(Array(tempString.characters).map{char2Int($0)})
    }
    
    
    
}
