import Foundation

private extension String {

    func trimWhiteSpace() -> String {
        let removeSpaces = trimCharacters(" ", sourceText: self)
        if removeSpaces.hasSuffix("\n") {
            return String(removeSpaces.dropLast())
        }
        return  removeSpaces
    }

    func trimCharacters(_ charToTrim: Character, sourceText: String) -> String {
        var editCharacterView = Array(sourceText)
        var editString = String(editCharacterView)

        let trimFirst  = sourceText.first == charToTrim
        let trimLast   = sourceText.last == charToTrim

        if trimFirst { editCharacterView  = Array(editCharacterView.dropFirst()) }
        if trimLast { editCharacterView  = Array(editCharacterView.dropLast()) }

        if trimFirst || trimLast == true {
            editString = trimCharacters(charToTrim, sourceText: String(editCharacterView))
        }
        return editString
    }

    func replacingOccurrencesCustom(_ of: String, with: String) -> String {
        return replacingOccurrences(of: of, with: with)

    }

    func componentsSeparatedByStringCustom(_ input: String) -> [String] {
        return components(separatedBy: input)
    }

}
enum CalculateError: Error {
    case error
}
struct WordProblem {
    var textIn = ""

    init(_ text: String) {
        self.textIn = text
    }

    private let operans =
        ["plus": "+",
         "minus": "-",
         "multiplied by": "*",
         "divided by": "/"]

    private let funcs =
        ["+": { (a: Int, b: Int) -> Int in return a + b },
         "-": { (a: Int, b: Int) -> Int in return a - b },
         "*": { (a: Int, b: Int) -> Int in return a * b },
         "/": { (a: Int, b: Int) -> Int in return a / b }]
    func answer() throws -> Int {
        guard let toReturn = calculate(textIn) else {
            throw CalculateError.error
        }
        return toReturn
    }

    func calculate(_ textIn: String) -> Int? {
        let calcStack = replaceText(textIn).componentsSeparatedByStringCustom(" ")

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
    private func replaceText( _ textInp: String) -> String {
        var textInp = textInp
        for key in Array(operans.keys) {
            let toBeReplaced = key
            let toReplaceValue = operans[key]!
            textInp = textInp.replacingOccurrencesCustom(toBeReplaced, with: toReplaceValue)
        }

        func checkCharInSet(_ input: Character) -> Bool {
            let temp = " 0987654321+-*/".index(of: input)

            if temp == nil {
                return false
            } else {
                return true}
        }

        var newTextIn =  Array(textInp)
        newTextIn = newTextIn.filter(checkCharInSet)
        let newTextInString: [String] = newTextIn.map { String($0) }
        return newTextInString.joined(separator: "").trimWhiteSpace()

    }
}
