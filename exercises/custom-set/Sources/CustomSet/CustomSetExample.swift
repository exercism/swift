extension CustomSet where T: Comparable {

    var toSortedArray: [Element] { return Array(contents.keys.sorted { $0 < $1 }) }
}

struct CustomSet<T: Hashable>: Equatable {

    typealias Element = T

    fileprivate var contents = [Element: Bool]()

    var isEmpty: Bool { return contents.count == 0 }
    var size: Int { return contents.count }

    init<S: Sequence>(_ sequence: S) where S.Iterator.Element == Element {
        self.contents = [:]
        _ = sequence.map { self.contents[$0] = true }
    }

    static func == <T>(lh: CustomSet<T>, rh: CustomSet<T>) -> Bool {
        return lh.size == rh.size &&
            lh.contents.keys.sorted { $0.hashValue < $1.hashValue } ==
            rh.contents.keys.sorted { $0.hashValue < $1.hashValue }
    }

    func contains(_ item: Element) -> Bool {
        if contents[item] != nil {
            return true
        }
        return false
    }

    mutating func put(_ item: Element) {
        contents[item] = true

    }

    mutating func delete(_ item: Element) {
        contents[item] = nil

    }

    mutating func removeAll() {
        contents = [:]

    }

    func intersection(_ item: CustomSet) -> CustomSet {
        var temp = [Element: Bool]()
        for each in Array(item.contents.keys) {
            guard contents[each] != nil else { continue }
            temp[each] = true
        }
        return CustomSet(temp.keys)
    }
    func difference(_ item: CustomSet) -> CustomSet {
        var temp = contents
        for each in Array(item.contents.keys) {
            temp[each] = nil
        }
        return CustomSet(temp.keys)
    }

    func union(_ item: CustomSet) -> CustomSet {
        var temp = contents
        for each in Array(item.contents.keys) {
            temp[each] = true
        }
        return CustomSet(temp.keys)
    }

    func isSubsetOf(_ other: CustomSet) -> Bool {
        for elem in Array(self.contents.keys) {
            if !other.contents.keys.contains(elem) {
                return false
            }
        }
        return true
    }

    func isDisjoint(_ item: CustomSet) -> Bool {
        for elem in Array(item.contents.keys) {
            if contents.keys.contains(elem) {
                return false
            }
        }
        return true
    }
}
