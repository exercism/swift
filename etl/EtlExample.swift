// Foundation not needed

// Apple Swift version 2.0

class ETL {
    class func transform(old: [Int: [String] ] ) -> [String: Int]
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