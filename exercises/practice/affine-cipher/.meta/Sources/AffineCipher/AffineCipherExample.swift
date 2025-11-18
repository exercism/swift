
enum AffineCipherError: Error {
    case keysNotCoprime
}

struct AffineCipher {
    let alphabet: String
    let alphabetCount: Int
    private let indexMap: [Character: Int]

    init() {
        self.alphabet = "abcdefghijklmnopqrstuvwxyz"
        self.alphabetCount = alphabet.count

        // Build O(1) lookup table once
        var map: [Character: Int] = [:]
        map.reserveCapacity(alphabet.count)
        for (i, c) in alphabet.enumerated() {
            map[c] = i
        }
        self.indexMap = map
    }

    func encode(_ phrase: String, keyA: Int, keyB: Int) throws -> String {
        guard gcd(keyA, alphabetCount) == 1 else { 
            throw AffineCipherError.keysNotCoprime
        }

        return try transform(phrase: phrase, insertSpacing: true) { oldOffset in
            (keyA * oldOffset + keyB) % alphabetCount
        }
    }

    func decode(_ phrase: String, keyA: Int, keyB: Int) throws -> String {
        guard gcd(keyA, alphabetCount) == 1 else { 
            throw AffineCipherError.keysNotCoprime
        }

        let (_, xCoeff, _) = gcdex(keyA, alphabetCount)
        let aInv = (xCoeff % alphabetCount + alphabetCount) % alphabetCount

        return try transform(phrase: phrase, insertSpacing: false) { oldOffset in
            (aInv * (oldOffset - keyB) % alphabetCount + alphabetCount) % alphabetCount
        }
    }

    private func transform(
        phrase: String,
        insertSpacing: Bool,
        mapChar: (Int) -> Int
    ) throws -> String {
        var result = ""
        result.reserveCapacity(phrase.count)

        var counter = 0
        for char in phrase {
            if char.isPunctuation || char.isWhitespace { continue }

            if char.isNumber {
                result.append(char)

                guard insertSpacing else { continue }
                counter += 1
                
            } 
            else if let lower = char.lowercased().first,
                      let oldOffset = indexMap[lower] {
                let newOffset = mapChar(oldOffset)
                let newIndex = alphabet.index(alphabet.startIndex, offsetBy: newOffset)
                result.append(alphabet[newIndex])
                
                guard insertSpacing else { continue }
                counter += 1
            }

            if insertSpacing && counter == 5 {
                result.append(" ")
                counter = 0
            }
        }

        if insertSpacing && result.last == " " {
            result.removeLast()
        }
        return result
    }
}

// Returns the greatest common divisor of a and b
fileprivate func gcd(_ a: Int, _ b: Int) -> Int {
    var x = abs(a)
    var y = abs(b)
    while y != 0 {
        let t = y
        y = x % y
        x = t
    }
    return x
}

// Returns (d, x, y) such that a * x + b * y = d = gcd(a, b)
fileprivate func gcdex(_ a: Int, _ b: Int) -> (d: Int, x: Int, y: Int) {
    if b == 0 {
        return (d: abs(a), x: a >= 0 ? 1 : -1, y: 0)
    }
    let (d, x1, y1) = gcdex(b, a % b)
    let x = y1
    let y = x1 - (a / b) * y1
    return (d: d, x: x, y: y)
}
