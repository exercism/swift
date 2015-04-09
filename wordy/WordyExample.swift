import Foundation


struct WordProblem
{
    private var textIn = ""
    
    init(_ text:String){
        self.textIn = text
    }
    
    var answer:Int? { return calculate(textIn)}
    
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
    
    
    private func calculate(textIn:String)->Int?{
        let calcStack = replaceText(textIn).componentsSeparatedByString(" ")
        
        
        if calcStack.count == 3 {
            let a = calcStack[0].toInt()
            let operA = funcs[calcStack[1]]
            let b = calcStack[2].toInt()
            
            if a != nil || operA != nil || b == nil {
                return operA!(a!, b!)
            }
        }
        
        if calcStack.count == 5 {
            let a = calcStack[0].toInt()
            let operA = funcs[calcStack[1]]
            let b = calcStack[2].toInt()
            let operB = funcs[calcStack[3]]
            let c = calcStack[4].toInt()
            
            if a != nil || operA != nil || b == nil ||
                operB != nil || c != nil {
                    
                    let left = operA!(a!, b!)
                    return operB!(left, c!) }
        }
        return nil
    }
    
    private func trimWS(input:String)->String{
        return input.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() )
    }
    
    
    private func replaceText(var textIn:String)-> String{
        for key in operans.keys.array{
            let toReplace = key
            let teReplaceValue = operans[key]!
            textIn = textIn.stringByReplacingOccurrencesOfString(toReplace, withString: teReplaceValue, options: NSStringCompareOptions.LiteralSearch, range: nil)
        }
        
        func checkCharInSet(input:Character)->Bool{
            let customCharSet = NSMutableCharacterSet()
            customCharSet.addCharactersInString(" 0987654321+-*/")
            let temp = ("\(input)" as String).rangeOfCharacterFromSet(customCharSet, options: NSStringCompareOptions.LiteralSearch, range: nil)
            if temp == nil {
                return false
            } else {
                return true}
        }
        
        var newTextIn =  Array(textIn)
        newTextIn = newTextIn.filter(checkCharInSet)
        var newTextInString:[String] = newTextIn.map{String($0)}
        return trimWS("".join(newTextInString))
    }

    
}