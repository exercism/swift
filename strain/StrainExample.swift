// Foundation not needed

// Apple Swift version 2.0

extension Array{
    
    func keep(compare compare:Bool = true, inputFunc:(Element) -> Bool )->Array {
        var array2Return:Array = []
        for each in self{
            if inputFunc(each) == compare{
                array2Return.append(each)}
                        }
        return array2Return
    }
    
    func discard(inputFunc:(Element) -> Bool)->Array{
        return keep(compare: false, inputFunc: inputFunc)
    }
}