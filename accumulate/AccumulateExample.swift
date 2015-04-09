
import Foundation

extension Array {
    func accumulate<S>(yield: (T) -> S) -> [S] {
        var result: [S] = [S]()
        for item in self {
            result.append(yield(item))
        }
        return result
    }
}
