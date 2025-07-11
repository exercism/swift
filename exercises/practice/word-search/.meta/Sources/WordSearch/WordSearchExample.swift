import Foundation

struct WordLocation: Equatable {

    struct Location: Equatable {
        let row: Int
        let column: Int
    }

    let start: Location
    let end: Location 

}

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

fileprivate class TrieNode {
    var children: [Character: TrieNode] = [:]
    var word: String? = nil
}

fileprivate extension TrieNode {

    static func buildTrie(_ words: [String]) -> TrieNode {
        let root = TrieNode()
        for word in words {
            var node = root
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }
        return root
    }

    static func dfs(
        board: [[Character]],
        initialRow: Int,
        initialColumn: Int,
        row: Int,
        column: Int,
        direction: (Int, Int),
        node: TrieNode,
        result: inout [String: WordLocation?]
    ) {
        guard row >= 0, row < board.count, column >= 0, column < board[0].count else { return }

        let char = board[row][column]
        guard let nextNode = node.children[char] else { return }

        if let word = nextNode.word {
            let start = WordLocation.Location(row: initialRow + 1, column: initialColumn + 1)
            let end = WordLocation.Location(row: row + 1, column: column + 1)
            result[word] = WordLocation(start: start, end: end)
        }

        dfs(
            board: board,
            initialRow: initialRow,
            initialColumn: initialColumn,
            row: row + direction.0,
            column: column + direction.1,
            direction: direction,
            node: nextNode,
            result: &result
        )
    }

}
