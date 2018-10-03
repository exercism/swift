import Foundation

struct Luhn {

    var number: Int64 = 0
    var numberString: String = ""
    var addends: [Int] { return addendsFunc(numberString) }
    var checksum: Int { return addends.reduce(0, +) }
    var isValid: Bool = false

    init(_ num: String ) {
        self.numberString = num.replacingOccurrences(of: " ", with: "")
        let num = Int64(numberString)
        if self.numberString.utf16.count <= 1 {
            self.isValid = false
        } else if num == nil {
            isValid = false
        } else {
            self.number = num!
            isValid = checksum % 10 == 0
        }
    }

    func addendsFunc(_ num: String) -> [Int] {
        func oddIndexInt64Minus9( _ input: [Int]) -> [Int] {
            var input = input
            input = Array(input.reversed())
            var tempArray: [Int] = []
            for (inx, each) in input.enumerated() {
                var tempEach: Int = each
                if (inx+1) % 2 == 0 {
                    tempEach *= 2
                    if tempEach >= 10 {
                        tempEach -= 9
                    }
                    tempArray.insert(tempEach, at: 0)
                } else {
                    tempArray.insert(tempEach, at: 0)
                }
            }
            return tempArray
        }
        func char2Int(_ input: Character) -> Int {
            let tempInt = Int(String(input)) ?? -1 // -1 = error
            return tempInt
        }

        return oddIndexInt64Minus9(Array(num).map { char2Int($0) })
    }

}
