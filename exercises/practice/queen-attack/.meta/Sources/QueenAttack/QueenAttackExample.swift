enum QueenError: Error {
  case inValidColumn
  case inValidRow
}

class Queen {
  let row: Int
  let column: Int

  init(row: Int, column: Int) throws {
    guard row >= 0 && row < 8 else {
      throw QueenError.inValidRow
    }
    guard column >= 0 && column < 8 else {
      throw QueenError.inValidColumn
    }
    self.row = row
    self.column = column
  }

  func canAttack(other: Queen) -> Bool {
    return row == other.row || column == other.column
      || abs(row - other.row) == abs(column - other.column)
  }
}
