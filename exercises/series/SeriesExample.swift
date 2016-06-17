// Foundation not needed



struct Series {
    
    var numberString = ""
    
    init(_ numString:String){
        self.numberString = numString
    }
    
    func slices(chunkSize:Int)->[[Int]]{
        var numberStringArray = Array(numberString.characters).map{Int("\($0)") ?? 0}
        let count = numberStringArray.count
        var start = 0
        var end = chunkSize
        var tempArrayReturn = [[Int]]()
        
        let enumarated = (0..<(count)).enumerate()
        
        for (_, _) in enumarated {
            if end < count+1 {
                let tempArray = Array(numberStringArray[start ..< end])
                tempArrayReturn.append(tempArray)
                start += 1
                end += 1
            }
        }
        return tempArrayReturn
    }
    
    
}