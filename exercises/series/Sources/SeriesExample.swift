struct Series {

    var numberString = ""

    init(_ numString: String) {
        self.numberString = numString
    }

    func slices(_ chunkSize: Int) -> [[Int]] {
        var numberStringArray = Array(numberString).map { Int("\($0)") ?? 0 }
        let count = numberStringArray.count
        var start = 0
        var end = chunkSize
        var tempArrayReturn = [[Int]]()

        let enumarated = (0..<(count)).enumerated()

        for (_, _) in enumarated where end < (count + 1) {
            let tempArray = Array(numberStringArray[start ..< end])
            tempArrayReturn.append(tempArray)
            start += 1
            end += 1
        }
        return tempArrayReturn
    }
}
