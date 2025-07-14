
struct WordLocation: Equatable {

    struct Location: Equatable {
        let row: Int
        let column: Int
    }

    let start: Location
    let end: Location 

}