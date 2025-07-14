import Foundation

func search(words: [String], in grid: [String]) -> [String: WordLocation?] {
    let board: [[Character]] = grid.map { Array($0) }
    let trie = TrieNode.buildTrie(words)
    var result = [String: WordLocation?]()

    let directions = [
        (-1,0), (1,0), (0,-1), (0,1),
        (-1,-1), (1,1), (1,-1), (-1,1)
    ]
    for row in 0..<board.count {
        for column in 0..<board[0].count {
            for direction in directions {
                TrieNode.dfs(
                    board: board,
                    initialRow: row,
                    initialColumn: column,
                    row: row,
                    column: column,
                    direction: direction,
                    node: trie,
                    result: &result
                )
            }
        }
    }

    return result
}
