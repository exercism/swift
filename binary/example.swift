import Foundation

struct Binary {
    let UIntValue:UInt = 0
    
    var toDecimal:Int {get {return Int(UIntValue)}}
    
    private func bi2Uint(input:String)->UInt{
        let orderedInput = reverse(input)
        var tempUInt:UInt = 0
        for (inx,each) in enumerate(orderedInput){
            if each == "1" {
                tempUInt += (0x1 << inx)
            }
            if (each != "0" && each != "1") {
                return 0
            }
        }
        return tempUInt
    }
    
    init(_ input:String){
        self.UIntValue = bi2Uint(input)
    }
}