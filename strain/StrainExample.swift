//Foundation not needed

extension Array{
    
    func keep(compare:Bool = true, inputFunc:(T) -> Bool )->Array {
        var array2Return:Array = []
        for each in self{
            if inputFunc(each) == compare{
                array2Return.append(each)}
                        }
        return array2Return
    }
    
    func discard(inputFunc:(T) -> Bool)->Array{
        return keep(compare: false, inputFunc: inputFunc)
    }
}