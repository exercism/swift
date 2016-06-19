





func == <T> (lh: CustomSet<T>, rh: CustomSet<T>) -> Bool {
        return lh.contents.keys.sorted{$0.hashValue < $1.hashValue} == rh.contents.keys.sorted{$0.hashValue < $1.hashValue}
    
}


struct CustomSet<T:Hashable>:Equatable{
    
    typealias Element = T
    
    private var contents = [Element: Bool]()
    
    var size:Int {return contents.count}

    var toSortedArray:[Element] {return Array(contents.keys.sorted{$0.hashValue < $1.hashValue})}
    
    init<S: Sequence where S.Iterator.Element == Element>(_ sequence: S) {
        self.contents = [:]
        _ = sequence.map{ self.contents[$0] = true }
    }
    
    
    mutating func put(_ item:Element){
        contents[item] = true
        
    }
    
    mutating func delete(_ item:Element){
        contents[item] = nil
        
    }
    
    mutating func removeAll(){
        contents = [:]
        
    }
    
    func intersection(_ item:CustomSet)-> CustomSet{
        var temp = [Element: Bool]()
        for each in Array(item.contents.keys){
            if (contents[each] != nil) { temp[each] = true }
        }
        return CustomSet(temp.keys)
    }
    
    
    func difference(_ item:CustomSet)-> CustomSet{
        var temp = contents
        for each in Array(item.contents.keys){
            temp[each] = nil
        }
        return CustomSet(temp.keys)
    }
    
    func union(_ item:CustomSet)-> CustomSet{
        var temp = contents
        for each in Array(item.contents.keys){
            temp[each] = true
        }
        return CustomSet(temp.keys)
    }
    
    
    func isSupersetOf (_ item:CustomSet)-> Bool{
        
        return item.contents.count == item.contents.filter{self.contents.keys.contains($0.0)}.count
        
    }
    func isDisjoint(_ item:CustomSet)-> Bool{
        
        for each in Array(item.contents.keys){
            if contents.keys.contains(each){
                return false
            }
        }
        return true
    }
    
    func containsMember(_ item:Element)-> Bool{
        if contents[item] != nil {
            return true}
        return false
    }
    
    
    
    
}

