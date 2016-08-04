struct Dominoes {

    let singles: [Bone]
    let doubles: [Bone]

    var chained: Bool {
        if singles.isEmpty && doubles.count == 1 {return true }
        let (success, result) = chainning(swapDuplicate(singles))
        if doubles.isEmpty {
            return success
        } else if success == true {
            return doubles.count == doubles.filter({each in return result.contains(where: {e in return e.value.head == each.value.head})}).count
        } else {
            return false
        }
    }

    private func swapDuplicate(_ input: [Bone]) -> [Bone] {
        var unique = [Bone]()
        for each in input {
            if unique.contains(each) {
                unique.insert(Bone(each.value.tail, each.value.head), at: 0)

            } else {
                unique.append(each)
            }
        }
        return unique
    }

    private func chainning(_ input: [Bone]) -> (Bool, [Bone]) {
        var matched = input

        guard !matched.isEmpty else {return (false, [])}

        let total = matched.count - 1

        for index in 0...total {
            for innerIndex in 0...total {
                matched[index].connect(matched[innerIndex])
            }
        }
        return (matched.filter({$0.connected >= 2}).count == matched.count) ?
            (true, matched) :  (false, [])
    }

    init(_ input: [(Int, Int)]) {
        var singles = [Bone]()
        var doubles = [Bone]()

        for each in input {
            if each.0 == each.1 {
                doubles.append(Bone(each.0, each.1))
            } else {
                singles.append(Bone(each.0, each.1))
            }
        }
        self.singles = singles
        self.doubles = doubles
    }
}
func == (lhs: Bone, rhs: Bone) -> Bool {
    return lhs.value.head == rhs.value.head && lhs.value.tail == rhs.value.tail
}
class Bone: CustomStringConvertible, Equatable {

    let value:(head: Int, tail: Int)
    var connected: Int = 0
    var available: Int?
    var connectedTo: Bone?
    var description: String {
        return "\(value)|\(connected)|\(available) "
    }
    @discardableResult
    func connect(_ input: Bone) -> Bool {

        if self === input {return false}
        if self === input.connectedTo {return false}

        var toReturn = false

        if connected == 1 && input.connected == 0 {

            guard let available = available else { return false }

            if available == input.value.head {
                self.available = nil
                input.available = input.value.tail
                toReturn = true
            }

            if available == input.value.tail {
                self.available = nil
                input.available = input.value.head
                toReturn = true
            }
        }

        if connected == 0 && input.connected == 1 {

            guard let available = input.available else { return false }

            if available == value.head {
                input.available = nil
                self.available = value.tail
                toReturn = true
            }

            if available == value.tail {
                input.available = nil
                self.available = value.head
                toReturn = true
            }

        }

        if connected == 1 && input.connected == 1 {

            if available == input.available {
                self.available = nil
                input.available = nil
                toReturn = true
            }
        }

        if connected == 0 && input.connected == 0 {

            if value.head == input.value.head {
                available = value.tail
                input.available = input.value.tail
                connectedTo = input
                toReturn = true
            }

            if value.tail == input.value.tail {
                available = value.head
                input.available = input.value.head
                connectedTo = input
                toReturn = true
            }

            if value.head == input.value.tail {
                available = value.tail
                input.available = input.value.head
                connectedTo = input
                toReturn = true
            }

            if value.tail == input.value.head {
                available = value.head
                input.available = input.value.tail
                connectedTo = input
                toReturn = true
            }
        }

        if toReturn == true {
            connected += 1
            input.connected += 1
            return true
        } else {
            return false
        }
    }

    init(_ head: Int, _ tail: Int) {
        self.value.head = head
        self.value.tail = tail
    }

}
