
// Foundation not needed

// Apple Swift version 2.0

extension Array {
    func accumulate<S>(yield: (Element) -> S) -> [S] {
        var result: [S] = [S]()
        for item in self {
            result.append(yield(item))
        }
        return result
    }
}
