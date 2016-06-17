// Foundation not needed



// Note: Placing this enum inside the BinarySearch struct results in a compiler crash

    enum BinarySearchError: ErrorType {
    case Unsorted
    }


struct BinarySearch<T: Comparable> {
    
    let list: [T]
    var middle: Int {
        return list.count / 2
    }
    
    init(_ list: [T]) throws {
            guard list == list.sort(<) else {
                throw BinarySearchError.Unsorted
            }
            
        
        
        self.list = list
    }
    
    func searchFor(datum: T) -> Int? {
        let middleItem = list[middle]
        
        if middleItem == datum {
            return middle
        } else if middleItem > datum {
            let sublist = Array(list[0...middle])
            guard sublist != list else {
                return nil
            }
            
            // try! is safe here, since it's not possible to get here if the data isn't initially sorted
            return try! BinarySearch(sublist).searchFor(datum)
        } else {
            let sublist = Array(list[middle..<list.count])
            guard sublist != list else {
                return nil
            }
            
            // try! is safe here, since it's not possible to get here if the data isn't initially sorted
            if let index = try! BinarySearch(sublist).searchFor(datum) {
                return index + middle
            } else {
                return nil
            }
        }
    }
    
}