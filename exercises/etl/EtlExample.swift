// Foundation not needed

// Apple Swift version 2.1

struct ETL {
    static func transform(old: [Int: [String] ] ) -> [String: Int]
    {
        var result = [String: Int]()
        for (score, letters) in old {
            for letter in letters {
                result[letter.lowercaseString] = score
            }
        }
        return result
    }
}