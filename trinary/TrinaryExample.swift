import Darwin

struct Trinary {
    
    var stringValue = ""
    
    var toDecimal:Int = 0
    
    func isValidTrinary() -> Bool{
        return (Int(stringValue) ?? -1) > -1 ? true : false
    }
    
    private func tri2int(input:String)->Int{
        let orderedInput = Array(input.characters.reverse())
        var tempInt:Int = 0
        for (inx,each) in orderedInput.enumerate(){
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