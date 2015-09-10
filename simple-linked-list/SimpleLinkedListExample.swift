//Foundation not needed

class Element<T> {
    var value: T? = nil
    var next: Element? = nil
    
    init() { }
    
    init(_ value: T, _ next:Element?) {
        self.value = value
        self.next = next
    }
    
    
    func toArray () ->[T] {
        return toA(self)
    }
    
    private var countArray:Array<T> = []
    
    private func toA(input:Element, _ tempArray:Array<T> = []) ->[T]{
        if tempArray.isEmpty && input.value != nil {
            countArray.append(input.value!)
        }
        if input.next != nil && input.next!.value != nil{
            countArray.append(input.next!.value!)
            toA(input.next!, countArray)
        }
        return countArray
    }
    
    
    
    
    class func fromArray(input:[T]) ->Element {
        var tempElement = Element<T>()
        for each in input.reverse(){
            tempElement = Element(each, tempElement)
        }
        return tempElement
    }
    
    
    
    func reverseElements() -> Element  {
        return Element.fromArray(toArray().reverse())
    }
    
    
}