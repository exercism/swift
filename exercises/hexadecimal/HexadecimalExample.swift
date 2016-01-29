// Foundation not needed

// Apple Swift version 2.1

extension Int {
    
    init?(hex: String) {
        let hexDigits = [
            "0" : 0,
            "1" : 1,
            "2" : 2,
            "3" : 3,
            "4" : 4,
            "5" : 5,
            "6" : 6,
            "7" : 7,
            "8" : 8,
            "9" : 9,
            "a" : 10,
            "b" : 11,
            "c" : 12,
            "d" : 13,
            "e" : 14,
            "f" : 15
        ]

        var result = 0
        var multiplier = 1
        
        let digits = hex.characters.map { String($0).lowercaseString }.reverse()
        
        for digit in digits {
            guard let intValue = hexDigits[digit] else {
                // Invalid hex string
                return nil
            }
            
            result += intValue * multiplier
            multiplier *= 16
        }
        
        self = result
    }
    
}