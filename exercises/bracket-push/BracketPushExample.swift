struct BracketPush {
    
    private static let brackets: [Character : Character] = [
        ")" : "(",
        "]" : "[",
        "}" : "{"
    ]
    
    static func paired(text: String) -> Bool {
        var stack = [Character]()
        
        for character in text.characters {
            if brackets.values.contains(character) {
                stack.append(character)
            } else if brackets.keys.contains(character) {
                guard let last = stack.popLast()
                    where last == brackets[character] else {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}
