//Foundation not needed

struct Binary {
    var UIntValue:UInt = 0
    
    var toDecimal:Int {get {return Int(UIntValue)}}
    
    private func bi2Uint(input:String) -> UInt{
        let orderedInput = Array(input.characters.reverse())
        var tempUInt:UInt = 0
        for (inx,each) in orderedInput.enumerate(){
            if each == "1" {
                tempUInt += UInt(0x1 << inx)
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