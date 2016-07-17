extension Array {
    func accumulate<S>(_ yield: (Element) -> S) -> [S] {
        var result: [S] = [S]()
        for item in self {
            result.append(yield(item))
        }
        return result
    }
}
