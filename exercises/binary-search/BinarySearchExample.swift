enum BinarySearchError: Error {
    case unsorted
}

struct BinarySearch<T: Comparable> {

    let list: [T]
    var middle: Int {
        return list.count / 2
    }

    init(_ list: [T]) throws {
        guard list == list.sorted(by: <) else {
            throw BinarySearchError.unsorted
        }
        self.list = list
    }

    func searchFor(_ datum: T) -> Int? {
        let middleItem = list[middle]

        if middleItem == datum {
            return middle
        } else if middleItem > datum {
            let sublist = Array(list[0...middle])
            guard sublist != list else {
                return nil
            }
            guard let binary = try? BinarySearch(sublist) else {
                return nil
            }
            return binary.searchFor(datum)
        } else {
            let sublist = Array(list[middle..<list.count])
            guard sublist != list else {
                return nil
            }

            guard let binary = try? BinarySearch(sublist),
                let index = binary.searchFor(datum) else {
                    return nil
            }
            return index + middle

        }
    }

}
