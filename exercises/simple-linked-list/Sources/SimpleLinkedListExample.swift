private extension Array {

    func reversedCustom() -> Array {
        return reversed()

    }
}

class Element<T> {
    var value: T?
    var next: Element?

    init() { }

    init(_ value: T, _ next: Element?) {
        self.value = value
        self.next = next
    }
    func toArray () -> [T] {
        return toA(self)
    }

    private var countArray: [T] = []

    @discardableResult
    private func toA(_ input: Element, _ tempArray: [T] = []) -> [T] {
        if tempArray.isEmpty && input.value != nil {
            countArray.append(input.value!)
        }
        if input.next != nil && input.next!.value != nil {
            countArray.append(input.next!.value!)
            toA(input.next!, countArray)
        }
        return countArray
    }

    class func fromArray(_ input: [T]) -> Element {
        var tempElement = Element<T>()
        for each in Array(input.reversedCustom()) {
            tempElement = Element(each, tempElement)
        }
        return tempElement
    }

    func reverseElements() -> Element {
        return Element.fromArray(Array(toArray().reversedCustom()))
    }
}
