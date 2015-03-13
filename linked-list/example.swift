import Foundation


class Element<T> {
    var value: T? = nil
    var next: Element? = nil
    var prev: Element? = nil
    
    init() {
    }
    
    init(value: T) {
        self.value = value
    }
    
}

class Deque<T> {
    var count: Int = 0
    var head: Element<T>
    var tail: Element<T>
    
    init() {
        self.head = Element<T>()
        self.tail = head
        
    }
    
    func isEmpty() -> Bool {
        return self.count == 0
    }
    
    func push(value: T) {
        var node = Element<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.next = self.head
            self.head.prev = node
            self.head = node
        }
        self.count++
    }
    
    func unshift(value: T) {
        var node = Element<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.prev = self.tail
            self.tail.next = node
            self.tail = node
        }
        self.count++
    }
    
    
    
    
    func pop() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            var temp: Element<T> = self.head
            self.count--
            return temp.value
        } else {
            var temp: Element<T> = self.head
            self.head = self.head.next!
            self.count--
            return temp.value
        }
    }
    
    
    func shift() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            var temp: Element<T> = self.tail
            self.count--
            return temp.value
        } else {
            var temp: Element<T> = self.tail
            self.tail = self.tail.prev!
            self.count--
            return temp.value
        }
    }
}

