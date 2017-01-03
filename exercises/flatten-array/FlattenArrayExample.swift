import Foundation

func constructList(elements: Any?...) -> [Any?] {

    return elements
}

func flattenArray<T>(_ list: [Any?]) -> [T] {

    var flattenedArray = [T]()

    func extractArrayElements(array: [Any?]) {

        for element in array {

            if let j = element {

                let anyObjectArray = j as? [Any?]

                if let unwrappedArray = anyObjectArray {

                    extractArrayElements(array: unwrappedArray)

                }

                let value = j as? T

                if let i = value {

                    flattenedArray.append(i)
                }

            }
        }

    }

    extractArrayElements(array: list)

    return flattenedArray

}
