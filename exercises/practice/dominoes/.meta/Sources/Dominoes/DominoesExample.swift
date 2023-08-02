struct Dominoes {
  private var dominos: [(Int, Int)]

  init(_ dominos: [(Int, Int)]) {
    self.dominos = dominos
  }

  var chained: Bool {
    guard !dominos.isEmpty else {
      return true
    }
    // A set to keep track of used dominos during backtracking
    var usedDominos = Set<Int>()

    // Start the chain with any domino as the first one
    for (index, domino) in dominos.enumerated() {
      usedDominos.insert(index)
      if backtrackChain(from: domino, usedDominos: &usedDominos) {
        return true
      }
      usedDominos.remove(index)
    }

    return false
  }

  private func backtrackChain(from domino: (Int, Int), usedDominos: inout Set<Int>) -> Bool {
    let lastValue = domino.1

    // Check if we have reached the end of the chain
    if usedDominos.count == dominos.count {
      // Check if the lastValue matches the firstValue of the initial domino
      return lastValue == dominos.first!.0
    }

    for (index, nextDomino) in dominos.enumerated() {
      if !usedDominos.contains(index) {
        // Check if the lastValue matches the firstValue of the next domino
        if lastValue == nextDomino.0 {
          usedDominos.insert(index)
          if backtrackChain(from: nextDomino, usedDominos: &usedDominos) {
            return true
          }
          usedDominos.remove(index)
        }
        // Check if the lastValue matches the secondValue of the next domino
        if lastValue == nextDomino.1 {
          usedDominos.insert(index)
          if backtrackChain(from: (nextDomino.1, nextDomino.0), usedDominos: &usedDominos) {
            return true
          }
          usedDominos.remove(index)
        }
      }
    }

    return false
  }
}
