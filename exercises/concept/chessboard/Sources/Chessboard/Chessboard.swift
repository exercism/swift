// TODO: define the 'ranks' constant
// TODO: define the 'files' constant


@available(*, deprecated, renamed: "isValidSquare(rank:file:)")
func isVaildSquare(rank: Int, file: String) -> Bool {
    return isValidSquare(rank: rank, file: file)
}

func isValidSquare(rank: Int, file: String) -> Bool {
  fatalError("Please implement the isValidSquare(rank:file:) function")
}

func getRow(_ board : [String], rank: Int) -> [String] {
  fatalError("Please implement the getRow(_:rank:) function")
}
