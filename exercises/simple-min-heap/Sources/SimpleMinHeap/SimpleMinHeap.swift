#if swift(>=4.0)
// Compatability for Swift < 4
#else
private extension Array {
    mutating func swapAt(_ i: Index, _ j: Index) {
        guard i != j else { return }
        let tmp = self[i]
        self[i] = self[j]
        self[j] = tmp
      }
}
#endif

extension SimpleMinHeap: CustomStringConvertible {
    public var description: String {
        return arrayView().description
    }
}

public struct SimpleMinHeap<T> where T: Comparable {

    private var array = [T]()

    // View into the array represenation of the heap
    func arrayView() -> [T] { return array }

    // This adds a element to the end and moves it to the correct spot
    mutating func push(_ item: T) {
        array.append(item)
        // Moves the element to the correct location
        siftUp()
    }

    // Removes the root and return it
    mutating func pop() -> T? {

        // If the array is empty then return nil
        guard let root = array.first else { return nil }

        // Making sure there are a least two items, otherwise return the single root
        guard array.count > 1 else { return root }

        // Swaping values so root can be removed once at the end of array
        array.swapAt(0, array.count - 1)

        // Removing last items which should be the same as root
        guard array.popLast() == root else { fatalError("Expected root value to be the same when moved to end of array") }

        // Move the new root to the correct location
        siftDown()

        // Returning the old root capture before the sifting down.
        return root
    }

    // Takes the root element and sifts it down into the correct location
    // Assuming that the root has a least one child (at least 2 elements present).
    private mutating func siftDown() {
        var index = 0
        while(index < array.count) {
            let leftChildIndex = (2 * index) + 1
            guard leftChildIndex < array.count, index != array.count - 1
                else { break } // No more children or current item is the last in the array
            let rightChildIndex = leftChildIndex + 1

            // There is a right child with the name parent node
            if(rightChildIndex < array.count &&  ((rightChildIndex - 1)/2) == index ) {
                let left = array[leftChildIndex]
                let right = array[rightChildIndex]
                let minChildIndex = left < right ? leftChildIndex : rightChildIndex
                if (array[minChildIndex] < array[index]) {
                    array.swapAt(minChildIndex, index)
                    index = minChildIndex
                } else { break }
            } else if (array[leftChildIndex] < array[index] ) {
                array.swapAt(leftChildIndex, index)
                index = leftChildIndex
            } else { break }
        }

    }

    // Takes the last element inserted and sift it up to the correct location
    // We assume that array is not empty here
    private mutating func siftUp() {
        guard !array.isEmpty
            else { fatalError("Array is empty") }

        guard array.count > 0 else { return }

        var elementIndex = array.count - 1
        var parentIndex = (elementIndex - 1 ) / 2

        while (array[parentIndex] > array[elementIndex]) {
            array.swapAt(elementIndex, parentIndex)
            elementIndex = parentIndex
            parentIndex = (elementIndex - 1 ) / 2
            if (elementIndex == 0) {
                break // We reached the root node
            }
        }
    }
    // Convinience function that takes in a array converts it into a heap
    mutating func heapify(_ input: [T]) {
        for each in input {
            push(each)
        }
    }
}
