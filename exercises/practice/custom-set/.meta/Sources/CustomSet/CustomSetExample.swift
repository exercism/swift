struct CustomSet<Element: Hashable>: Equatable {
  private var elements: [Element: Bool] = [:]
  var isEmpty: Bool { elements.isEmpty }

  init(_ elements: [Element] = []) {
    self.elements = elements.reduce(into: [:]) { $0[$1] = true }
  }

  mutating func add(_ element: Element) {
    elements[element] = true
  }

  mutating func delete(_ element: Element) {
    elements[element] = nil
  }

  func contains(_ element: Element) -> Bool {
    elements[element] ?? false
  }

  func isDisjoint(with otherSet: CustomSet<Element>) -> Bool {
    for element in elements.keys {
      if otherSet.contains(element) {
        return false
      }
    }
    return true
  }

  func isSubset(of otherSet: CustomSet<Element>) -> Bool {
    for element in elements.keys {
      if !otherSet.contains(element) {
        return false
      }
    }
    return true
  }

  func isSuperset(of otherSet: CustomSet<Element>) -> Bool {
    otherSet.isSubset(of: self)
  }

  func union(_ otherSet: CustomSet<Element>) -> CustomSet<Element> {
    var unionSet = self
    for element in otherSet.elements.keys {
      unionSet.add(element)
    }
    return unionSet
  }

  func intersection(_ otherSet: CustomSet<Element>) -> CustomSet<Element> {
    var intersectionSet = CustomSet<Element>()
    for element in elements.keys {
      if otherSet.contains(element) {
        intersectionSet.add(element)
      }
    }
    return intersectionSet
  }

  func difference(_ otherSet: CustomSet<Element>) -> CustomSet<Element> {
    var differenceSet = self
    for element in otherSet.elements.keys {
      differenceSet.delete(element)
    }
    return differenceSet
  }
}
