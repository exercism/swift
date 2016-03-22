import XCTest



class StrainTest: XCTestCase {
    
    func testEmptyKeep() {
        
        XCTAssertTrue ([].keep{each -> Bool in each < 10}.isEmpty)
    }
    
    func testKeepEverything() {
        XCTAssertEqual([1, 2, 3], [1, 2, 3].keep{each -> Bool in each < 10})
    }
    
    func testKeepFirstAndLast() {
        XCTAssertEqual([1, 3], [1, 2, 3].keep{ each -> Bool in (each % 2 != 0)})
    }
    
    func testKeepNeitherFirstNorLast() {
        XCTAssertEqual([2, 4], [1, 2, 3, 4, 5].keep{ each -> Bool in (each % 2 == 0) })
    }
    
    func testKeepStrings() {
        let words = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
        let result = words.keep{each -> Bool in (each as String).hasPrefix("z") ?? false}
        XCTAssertEqual(["zebra", "zombies", "zealot"], result)
    }
    
    func testKeepArrays () {
        let  rows = [
            [1, 2, 3],
            [5, 5, 5],
            [5, 1, 2],
            [2, 1, 2],
            [1, 5, 2],
            [2, 2, 1],
            [1, 2, 5]
        ]
        let result = rows.keep{ each -> Bool in (each as [Int]).contains(5)}
        XCTAssertEqual([[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]], result)
    }
    
    func testEmptyDiscard() {
        XCTAssertEqual([], [].discard {each -> Bool in each < 10})
    }
    
    func testDiscardNothing() {
        XCTAssertEqual([1, 2, 3], [1, 2, 3].discard {each -> Bool in each > 10})
    }
    
    func testDiscardFirstAndLast() {
        XCTAssertEqual([2], [1, 2, 3].discard {each -> Bool in (each % 2 != 0)})
    }
    
    func testDiscardNeitherFirstNorLast() {
        XCTAssertEqual([1, 3, 5], [1, 2, 3, 4, 5].discard{ each -> Bool in (each % 2 == 0)})
    }
    
    func testDiscardStrings() {
        let words = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
        let result = words.discard{each -> Bool in (each as String).hasPrefix("z") ?? false}
        XCTAssertEqual(["apple", "banana", "cherimoya"], result)
    }
    
    func testDiscardArrays () {
        let rows = [
            [1, 2, 3],
            [5, 5, 5],
            [5, 1, 2],
            [2, 1, 2],
            [1, 5, 2],
            [2, 2, 1],
            [1, 2, 5]
        ]
        let result = rows.discard { each -> Bool in (each as [Int]).contains(5)}
        XCTAssertEqual([[1, 2, 3], [2, 1, 2], [2, 2, 1]], result)
    }
    
}

