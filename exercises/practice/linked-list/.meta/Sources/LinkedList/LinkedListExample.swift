class Node<T : Equatable > : Equatable  {
    var value: T?
    var next: Node?
    var prev: Node?

    init() {
    }

    init(value: T) {
        self.value = value
    }

    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

class Deque<T : Equatable > {
    var count: Int = 0
    var head: Node<T>
    var tail: Node<T>

    init() {
        self.head = Node<T>()
        self.tail = head

    }

    func isEmpty() -> Bool {
        return self.count == 0
    }

    func delete(_ value: T) {
        var current: Node<T>? = self.head
        while current != nil {
            if current?.value == value {
                if current == self.head {
                    self.head = self.head.next ?? Node<T>()
                    self.head.prev = nil
                } else if current == self.tail {
                    self.tail = self.tail.prev ?? Node<T>()
                    self.tail.next = nil
                } else {
                    current?.prev?.next = current?.next
                    current?.next?.prev = current?.prev
                }
                self.count -= 1
                break
            }
            current = current?.next
        }
    }

    func push(_ value: T) {
        let node = Node<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.next = self.head
            self.head.prev = node
            self.head = node
        }
        self.count += 1
    }

    func unshift(_ value: T) {
        let node = Node<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.prev = self.tail
            self.tail.next = node
            self.tail = node
        }
        self.count += 1
    }

    func pop() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            let temp: Node<T> = self.head
            self.count -= 1
            return temp.value
        } else {
            let temp: Node<T> = self.head
            self.head = self.head.next!
            self.count -= 1
            return temp.value
        }
    }
    func shift() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            let temp: Node<T> = self.tail
            self.count -= 1
            return temp.value
        } else {
            let temp: Node<T> = self.tail
            self.tail = self.tail.prev!
            self.count -= 1
            return temp.value
        }
    }
}
