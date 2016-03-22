import Darwin



private extension String {
    
    func stripCharacters(charToRemove:String) -> String{
        var returnString = ""
        self.characters.forEach{
            if !charToRemove.containsString(String($0)){
                returnString.append($0)
            }}
        return returnString
    }
    
    var stripWhiteSpace:String { return stripCharacters(" ") }
    var stripPunctuations:String { return stripCharacters(",.!?") }
    var stripSymbols:String { return stripCharacters("#$%^&") }
    
    
}



struct Crypto {
    
    func segmentSorter(value:String, spacing:Int)->[String]{
        var tempCounter = 0
        var tempString:String = ""
        for each in value.characters{
            if tempCounter % spacing == 0 && tempCounter != 0{
                tempString += " \(each)"
            } else { tempString += "\(each)" }
            tempCounter += 1
        }
        return (tempString.componentsSeparatedByString(" ") )
    }
    
    func getSquareSize(text:String, floorNoCeling:Bool = false)->Int
    {
        let tempDouble = Double(text.characters.count)
        let tempRoot = sqrt(tempDouble)
        let tempCeil = ceil(tempRoot)
        let tempFloor = floor(tempRoot)
        if floorNoCeling{ return Int(tempFloor)} else {
            return Int(tempCeil)}
    }
    
    func normalizer(textInput:String)->String{
        return textInput.stripSymbols.stripPunctuations.stripWhiteSpace.lowercaseString
    }
    
    var ciphertext:String {
        
            var plaintextSegmentsArray = [[Character]]()
            
            for each in plaintextSegments{
                plaintextSegmentsArray.append(Array(each.characters))
            }
            
            var ciphertextReturn = ""
            
            
            for i in 0 ..< plaintextSegmentsArray[0].count {
                for e in 0 ..< plaintextSegmentsArray.count {
                    if i < plaintextSegmentsArray[e].count{
                        ciphertextReturn.append(plaintextSegmentsArray[e][i])
                    }
                }}
            
            return ciphertextReturn
        
    }
    
    var normalizeCiphertext:String {
        
        let sizeNormal:Int = (ciphertext.characters.count == self.size * self.size ) ? getSquareSize(self.ciphertext) : getSquareSize(self.ciphertext, floorNoCeling: true)
        
        return segmentSorter(ciphertext, spacing: sizeNormal).joinWithSeparator(" ")
    }
    
    
    var plaintextSegments:[String]{ get{ return segmentSorter(self.normalizePlaintext, spacing: self.size)}}
    
    
    var textValue:String = ""
    var normalizePlaintext:String = ""
    var size:Int = 0
    
    init (_ value:String){
        self.textValue = value
        self.normalizePlaintext = normalizer(value)
        self.size = getSquareSize(self.normalizePlaintext)
    }
}






