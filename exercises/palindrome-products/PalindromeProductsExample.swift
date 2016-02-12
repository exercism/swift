// Foundation not needed

// Apple Swift version 2.1

struct PalindromeCollection: CollectionType {
    
    typealias Index = Int
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return count
    }
    
    subscript(i: Int) -> Palindrome {
        return contents[i]
    }
    
    typealias Palindrome = (value:Int, factors: [[Int]])
    
    private let contents: [Palindrome]
    
    let largest: Palindrome
    let smallest: Palindrome
    
    init(maxFactor: Int, minFactor: Int = 1) {
        let result = PalindromeCollection.generate(maxFactor: maxFactor, minFactor: minFactor)
        
        self.contents = result
        self.largest = result.last!
        self.smallest = result.first!
    }
    
    private static func generate(maxFactor maxFactor: Int, minFactor: Int) -> [Palindrome] {
        var palindromes = [Int : Palindrome]()
        
        for i in minFactor...maxFactor {
            for j in minFactor...maxFactor {
                let product = i * j
                
                if numberIsPalindrome(product) {
                    let newFactor = [i, j].sort()
                    var factors = [newFactor]
                    
                    if let currentPalindrome = palindromes[product] {
                        for factor in currentPalindrome.factors {
                            if factor == newFactor {
                                continue
                            }
                            factors.append(factor)
                        }
                    }
                    
                    palindromes[product] = Palindrome(value: product, factors: factors)
                }
            }
        }
        
        let sorted = palindromes.sort { $0.0 < $1.0 }
        
        return sorted.map { $0.1 }
    }
    
    private static func numberIsPalindrome(number: Int) -> Bool {
        let numberString = String(number)
        
        return numberString == String(numberString.characters.reverse())
    }
    
}