
import Foundation

extension Array {
    func accumulate(yield: (T) -> T) -> Array<T> {
        var result: Array<T> = Array<T>()
        for item in self {
            result += yield(item)
        }
        return result
    }
}