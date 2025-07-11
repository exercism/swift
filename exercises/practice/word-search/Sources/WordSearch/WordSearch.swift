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
    // Write your code for the 'WordSearch' exercise in this file.
}
