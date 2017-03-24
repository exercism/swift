import Foundation

func flattenArray<T>(_ list: [Any?]) -> [T] {

    var flattenedArray = [T]()

    func extractArrayElements(array: [Any?]) {

        for element in array.flatMap({ $0 }) {

            let anyObjectArray = element as? [Any?]

            if let unwrappedArray = anyObjectArray {

                extractArrayElements(array: unwrappedArray)

            }

            let value = element as? T

            if let i = value {

                flattenedArray.append(i)
            }

        }

    }

    extractArrayElements(array: list)

    return flattenedArray

}
