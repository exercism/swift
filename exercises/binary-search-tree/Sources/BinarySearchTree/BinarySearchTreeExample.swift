indirect enum BinarySearchTree<Element: Comparable> {

    var data: Element? {
        guard case let .node(_, value, _) = self else { return nil }
        return value
    }

    var left: BinarySearchTree<Element>? {
        guard case let .node(left, _, _) = self else { return nil }
        return left
    }

    var right: BinarySearchTree<Element>? {
        guard case let .node(_, _, right) = self else { return nil }
        return right
    }

    case empty
    case node(BinarySearchTree<Element>, Element, BinarySearchTree<Element>)

    init(left: BinarySearchTree<Element> = .empty,
         _ value: Element,
         right: BinarySearchTree<Element> = .empty ) {
        self = .node(left, value, right)
    }
    init() {
        self = .empty
    }
    private func insert ( _ into: BinarySearchTree<Element>, _ newValue: Element ) -> BinarySearchTree<Element> {
        let bailOut = BinarySearchTree<Element>(left: .empty, newValue, right: .empty)

        guard case let .node(left, value, right) = into else { return bailOut }

        if newValue <= value { return
            BinarySearchTree(left: insert(left, newValue), value, right: right)
        }

        if value <= newValue { return
            BinarySearchTree(left: left, value, right: insert(right, newValue))
        }

        return .node(left, value, right)
    }
    mutating func insert( _ newValue: Element ) {

        guard case let .node(left, value, right) = insert(self, newValue) else { return }

        self = .node(left, value, right)
    }

    private func getAllData() -> [Element] {

        guard case let .node( left, value, right) = self else { return [] }
        var result = [value]

        result += left.getAllData()
        result += right.getAllData()

        return result

    }

    func allData() -> [Element] {
        return  getAllData().sorted(by: <)
    }
}
