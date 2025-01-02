struct Position: Equatable {
  let row: Int
  let column: Int

  static func == (lhs: Position, rhs: Position) -> Bool {
    return lhs.row == rhs.row && lhs.column == rhs.column
  }
}
