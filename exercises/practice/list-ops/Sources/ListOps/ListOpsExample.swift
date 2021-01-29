struct ListOps {

    static func append<T: Equatable>(_ array1: [T], _ array2: [T]) -> [T] {
        var result = array1
        for value in array2 {
            result.append(value)
        }

        return result
    }

    static func concat<T: Equatable>(_ arrays: [T]...) -> [T] {
        var result = [T]()

        for array in arrays {
            result = append(result, array)
        }

        return result
    }

    static func filter<T: Equatable>(_ array: [T], predicate: (T) -> Bool) -> [T] {
        var filtered = [T]()
        for value in array {
            if predicate(value) {
                filtered.append(value)
            }
        }

        return filtered
    }

    static func length<T>(_ array: [T]) -> Int {
        var length = 0

        for _ in array {
            length += 1
        }

        return length
    }

    static func map<T: Equatable>(_ array: [T], transform: (T) -> T) -> [T] {
        var result = [T]()

        for value in array {
            result.append(transform(value))
        }

        return result
    }

    static func foldLeft<T: Equatable>(_ array: [T], accumulated: T, combine: (T, T) -> T) -> T {
        if length(array) == 0 {
            return accumulated
        } else {
            return foldLeft(Array(array.dropFirst()), accumulated: combine(accumulated, array[0]), combine: combine)
        }
    }

    static func foldRight<T: Equatable>(_ array: [T], accumulated: T, combine: (T, T) -> T) -> T {
        if length(array) == 0 {
            return accumulated
        } else {
            return combine(array[0], foldRight(Array(array.dropFirst()), accumulated: accumulated, combine: combine))
        }
    }

    static func reverse<T: Equatable>(_ array: [T]) -> [T] {
        var result = [T]()
        var index = length(array) - 1

        while index >= 0 {
            result.append(array[index])
            index -= 1
        }

        return result
    }

}
