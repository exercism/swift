import Darwin



extension Int{
    init(_ value:Trinary){
        self  = value.toDecimal
    }
}


struct Trinary {
   private var stringValue = ""
   private var toDecimal:Int = 0
   private func isValidTrinary() -> Bool{
        return (Int(stringValue) ?? -1) > -1 ? true : false
    }
    
    private func tri2int(input:String)->Int{
        #if swift(>=3.0)
        let orderedInput = Array(input.characters.reversed())
        let enumarated = orderedInput.enumerated()
        #else
        let orderedInput = Array(input.characters.reverse())
        let enumarated = orderedInput.enumerate()
        #endif
        var tempInt:Int = 0
        for (inx,each) in enumarated{
            let tempCharInt = Int("\(each)") ?? 0
            let tempTriPower = Int(pow(Double(3),Double(inx)))
                tempInt += tempTriPower * tempCharInt
        }
        return tempInt
    }
    
    
    init( _ sv:String){
        self.stringValue = sv
        
        if isValidTrinary() {
            self.toDecimal = tri2int(sv)
        }
        
    }

}