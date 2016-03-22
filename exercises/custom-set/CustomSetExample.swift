
// Foundation not needed




func == <T> (lh: CustomSet<T>, rh: CustomSet<T>) -> Bool {
    #if swift(>=3.0)
        return lh.contents.keys.sorted{$0.hashValue < $1.hashValue} == rh.contents.keys.sorted{$0.hashValue < $1.hashValue}
    #else
        return lh.contents.keys.sort{$0.hashValue < $1.hashValue} == rh.contents.keys.sort{$0.hashValue < $1.hashValue}
    #endif
}


struct CustomSet<T:Hashable>:Equatable{
    
    typealias Element = T
    
    private var contents = [Element: Bool]()
    
    var size:Int {return contents.count}
    
    
    #if swift(>=3.0)
    var toSortedArray:[Element] {return Array(contents.keys.sorted{$0.hashValue < $1.hashValue})}

    init<S: Sequence where S.Iterator.Element == Element>(_ sequence: S) {
        self.contents = [:]
        _ = sequence.map{ self.contents[$0] = true }
    }
    
    #else
    var toSortedArray:[Element] {return Array(contents.keys.sort{$0.hashValue < $1.hashValue})}
    
    init<S: SequenceType where S.Generator.Element == Element>(_ sequence: S) {
        self.contents = [:]
        _ = sequence.map{ self.contents[$0] = true }
    }
    #endif
    
    mutating func put(item:Element){
        contents[item] = true
        
    }
    
    mutating func delete(item:Element){
        contents[item] = nil
        
    }
    
    mutating func removeAll(){
        contents = [:]
        
    }
    
    func intersection(item:CustomSet)-> CustomSet{
        var temp = [Element: Bool]()
        for each in Array(item.contents.keys){
            if (contents[each] != nil) { temp[each] = true }
        }
        return CustomSet(temp.keys)
    }
    
    
    func difference(item:CustomSet)-> CustomSet{
        var temp = contents
        for each in Array(item.contents.keys){
            temp[each] = nil
        }
        return CustomSet(temp.keys)
    }
    
    func union(item:CustomSet)-> CustomSet{
        var temp = contents
        for each in Array(item.contents.keys){
            temp[each] = true
        }
        return CustomSet(temp.keys)
    }
    
    
    func isSupersetOf (item:CustomSet)-> Bool{
        
        return item.contents.count == item.contents.filter{self.contents.keys.contains($0.0)}.count
        
    }
    func isDisjoint(item:CustomSet)-> Bool{
        
        for each in Array(item.contents.keys){
            if contents.keys.contains(each){
                return false
            }
        }
        return true
    }
    
    func containsMember(item:Element)-> Bool{
        if contents[item] != nil {
            return true}
        return false
    }
    
    
    
    
}

