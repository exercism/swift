// Foundation not needed

// Apple Swift version 2.1

private extension String {
    
    func trimWhiteSpace()-> String{
        let removeSpaces = trimCharacters(" ", sourceText: self)
        if removeSpaces.hasSuffix("\n"){
            return String(removeSpaces.characters.dropLast())
        }
        return  removeSpaces
    }
    
    func trimCharacters(charToTrim:Character, sourceText:String) -> String{
        var editCharacterView = sourceText.characters
        var editString = String(editCharacterView)
        
        let trimFirst  = sourceText.characters.first == charToTrim
        let trimLast   = sourceText.characters.last == charToTrim
        
        if trimFirst { editCharacterView  = editCharacterView.dropFirst() }
        if trimLast { editCharacterView  = editCharacterView.dropLast() }
        
        if trimFirst || trimLast == true {
            editString = trimCharacters(charToTrim, sourceText: String(editCharacterView))
        }
        return editString
    }
}



enum calculateError:ErrorType{
    case error
}


struct WordProblem {
    var textIn = ""
    
    init(_ text:String){
        self.textIn = text
    }
    
    private let operans =
        ["plus" : "+",
        "minus" : "-",
        "multiplied by" : "*",
        "divided by" : "/"]
    
    private let funcs =
        ["+":{(a:Int, b:Int) -> Int in return a + b},
        "-":{(a:Int, b:Int) -> Int in return a - b},
        "*":{(a:Int, b:Int) -> Int in return a * b},
        "/":{(a:Int, b:Int) -> Int in return a / b}]
    
    
    func answer() throws -> Int{
        guard let toReturn = calculate(textIn) else {
            throw calculateError.error
        }
        return toReturn
    }
    
    func calculate(textIn:String) ->Int?{
        let calcStack = replaceText(textIn).componentsSeparatedByString(" ")
        
        if calcStack.count == 3 {
            let a = Int(calcStack[0])
            let operA = funcs[calcStack[1]]
            let b = Int(calcStack[2])
            
            if a != nil || operA != nil || b == nil {
                return operA!(a!, b!)
            }
        }
        
        if calcStack.count == 5 {
            let a = Int(calcStack[0])
            let operA = funcs[calcStack[1]]
            let b = Int(calcStack[2])
            let operB = funcs[calcStack[3]]
            let c = Int(calcStack[4])
            
            if a != nil || operA != nil || b == nil ||
                operB != nil || c != nil {
                    
                    let left = operA!(a!, b!)
                    return operB!(left, c!) }
        }
        return nil
    }
    
    
    
    private func replaceText( textInp:String)-> String{
        var textInp = textInp
        for key in Array(operans.keys){
            let toBeReplaced = key
            let toReplaceValue = operans[key]!
            textInp = textInp.stringByReplacingOccurrencesOfString(toBeReplaced, withString: toReplaceValue)
        }
        
        func checkCharInSet(input:Character)->Bool{
            let temp = " 0987654321+-*/".characters.indexOf(input)
            if temp == nil {
                return false
            } else {
                return true}
        }
        
        var newTextIn =  Array(textInp.characters)
        newTextIn = newTextIn.filter(checkCharInSet)
        let newTextInString:[String] = newTextIn.map{String($0)}
        return newTextInString.joinWithSeparator("").trimWhiteSpace()
    }

    
}