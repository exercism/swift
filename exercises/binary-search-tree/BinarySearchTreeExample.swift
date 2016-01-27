// Foundation not needed

class BinarySearchTree<T: Comparable> {
    
    var data: T
    var left: BinarySearchTree<T>?
    var right: BinarySearchTree<T>?
    
    init(_ data: T) {
        self.data = data
    }
    
    func insert(newData: T) {
        if newData <= data {
            if let left = left {
                left.insert(newData)
            } else {
                left = BinarySearchTree(newData)
            }
        } else {
            if let right = right {
                right.insert(newData)
            } else {
                right = BinarySearchTree(newData)
            }
        }
    }
    
    func allData() -> [T] {
        return getAllData().sort(<)
    }
    
    private func getAllData() -> [T] {
        var result = [data]
        
        if let left = left {
            result += left.getAllData()
        }
        
        if let right = right {
            result += right.getAllData()
        }
        
        return result
    }
    
}