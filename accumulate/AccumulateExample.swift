
//Foundation not needed

extension Array {
    func accumulate<S>(yield: (Element) -> S) -> [S] {
        var result: [S] = [S]()
        for item in self {
            result.append(yield(item))
        }
        return result
    }
}
