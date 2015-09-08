import Foundation


struct Series {
    
    var numberString = ""
    
    init(_ numString:String){
        self.numberString = numString
    }
    
    func slices(chunkSize:Int)->[[Int]]{
        var numberStringArray = Array(numberString).map{"\($0)".toInt() ?? 0}
        var count = numberStringArray.count
        var start = 0
        var end = chunkSize
        var tempArrayReturn = [[Int]]()
        for (indx, each) in enumerate(0..<(count)){
            if end < count+1 {
                let tempArray = Array(numberStringArray[start ..< end])
                tempArrayReturn.append(tempArray)
                start++
                end++
            }
        }
        return tempArrayReturn
    }
    
    
}