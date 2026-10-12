private let directions = [
    (row:  0, column:  1), (row:  0, column: -1),
    (row:  1, column:  0), (row: -1, column:  0),
    (row:  1, column:  1), (row: -1, column: -1),
    (row: -1, column:  1), (row:  1, column: -1),
]

func search(words: [String], in input: [String]) -> [String: WordLocation?] {
    let grid = input.map { Array($0) }

    return words.reduce(into: [:]) { locations, word in
        if let wordLocation = firstOccurrence(of: word, in: grid) {
            locations[word] = wordLocation
        }
    }
}

private func firstOccurrence(of word: String, in grid: [[Character]]) -> WordLocation? {
    let numRows = grid.count
    let numColumns = grid.first?.count ?? 0
    let wordLength = word.count

    for rowIndex in 0..<numRows {
        for columnIndex in 0..<numColumns {
            for direction in directions {
                let endRow = rowIndex + direction.row * (wordLength - 1)
                let endColumn = columnIndex + direction.column * (wordLength - 1)

                guard (0..<numRows).contains(endRow), (0..<numColumns).contains(endColumn) else {
                    continue
                }

                let candidate = (0..<wordLength).map { step in
                    grid[rowIndex + direction.row * step][columnIndex + direction.column * step]
                }

                guard String(candidate) == word else {
                    continue
                }

                return WordLocation(
                    start: location(row: rowIndex, column: columnIndex),
                    end: location(row: endRow, column: endColumn)
                )
            }
        }
    }

    return nil
}

private func location(row: Int, column: Int) -> WordLocation.Location {
    WordLocation.Location(row: row + 1, column: column + 1)
}
