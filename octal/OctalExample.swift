import Foundation

struct Octal {
    
    var stringValue = ""
    
    var toDecimal:Int = 0
    
    func isValidOctal() -> Bool{
        return (stringValue.toInt() ?? -1) > -1 ? true : false
    }
    
    private func oct2int(input:String)->Int{
        let orderedInput = reverse(input)
        var tempInt:Int = 0
        for (inx,each) in enumerate(orderedInput){
            let tempCharInt = "\(each)".toInt() ?? 0
            if tempCharInt > 7 {return 0}
            let tempOctPower = Int(pow(Double(8),Double(inx)))
            tempInt += tempOctPower * tempCharInt
        }
        return tempInt
    }
    
    
    init( _ sv:String){
        self.stringValue = sv
        
        if isValidOctal() {
            self.toDecimal = oct2int(sv)
        }
        
    }
    
}