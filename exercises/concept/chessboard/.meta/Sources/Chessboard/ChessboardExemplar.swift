let ranks = 1...8
let files = "A"..."H"

func isVaildSquare(rank: Int, file: String) -> Bool {
  return ranks.contains(rank) && files.contains(file)
}

func getRow(_ board : [String], rank: Int) -> [String] {
  let startIndex = (rank - 1) * 8
  let endIndex = startIndex + 8
  return Array(board[startIndex..<endIndex])
}
