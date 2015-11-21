
// Foundation not needed

// Apple Swift version 2.0


func == <T> (lh: CustomSet<T>, rh: CustomSet<T>) -> Bool {
    return lh.contents.keys.sort{$0.hashValue < $1.hashValue} == rh.contents.keys.sort{$0.hashValue < $1.hashValue}
}


struct CustomSet<T:Hashable>:Hashable{
    
    typealias Element = T
    
    private var contents = [Element: Bool]()
    
    var size:Int {return contents.count}
    
    var hashValue: Int = 0
    
    
    var toSortedArray:[Element] {return Array(contents.keys.sort{$0.hashValue < $1.hashValue})}
    
    init(){
        self.contents = [:]
    }
    
    init<S: SequenceType where S.Generator.Element == Element>(_ sequence: S) {
        self.contents = [:]
        _ = sequence.map{ self.contents[$0] = true }
        self.hashValue = hashArrayGenerator(Array(contents.keys))
    }
    
    
    mutating func put(item:Element){
        contents[item] = true
        
    }
    
    mutating func delete(item:Element){
        contents[item] = nil
        
    }
    
    mutating func removeAll(){
        contents = [:]
        hashValue = 0
        
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
    
    
    private func hashArrayGenerator<T:Hashable>(input:Array<T>) ->Int{
        var temp = 0
        for (index, each) in input.enumerate(){
            let toAdd = each.hashValue/(index + 1)
            temp = (temp + toAdd)/(index + 1)
            
        }
        return temp
    }
    
    
    
    
    
}

