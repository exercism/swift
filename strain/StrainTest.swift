import XCTest


class StrainTest: XCTestCase {
    
    func test_empty_keep(){
        let emptyIntArray = [Int]()
        XCTAssertEqual( emptyIntArray, [].keep{each -> Bool in each < 10} )}
    
    func test_keep_everything(){
        XCTAssertEqual([1, 2, 3], [1, 2, 3].keep{each -> Bool in each < 10}  )}
    
    func test_keep_first_and_last(){
        XCTAssertEqual([1, 3], [1, 2, 3].keep{ each -> Bool in (each % 2 != 0)} )
    }
    
    func test_keep_neither_first_nor_last(){
        XCTAssertEqual([2, 4], [1, 2, 3, 4, 5].keep{ each -> Bool in (each % 2 == 0)} )}
    
    func test_keep_strings(){
        let words = "apple zebra banana zombies cherimoya zelot".componentsSeparatedByString(" ")
        let result = words.keep{each -> Bool in (each as String).hasPrefix("z") ?? false}
        XCTAssertEqual("zebra zombies zelot".componentsSeparatedByString(" "), result )}
    
    func test_keep_arrays (){
        let  rows = [
            [1, 2, 3],
            [5, 5, 5],
            [5, 1, 2],
            [2, 1, 2],
            [1, 5, 2],
            [2, 2, 1],
            [1, 2, 5]
        ]
        let result = rows.keep{ each -> Bool in contains((each as [Int]), 5)}
        XCTAssertEqual([[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]], result )}
    
    func test_empty_discard(){
        XCTAssertEqual([], [].discard {each -> Bool in each < 10} )}
    
    func test_discard_nothing(){
        XCTAssertEqual([1, 2, 3], [1, 2, 3].discard {each -> Bool in each > 10} )}
    
    func test_discard_first_and_last(){
        XCTAssertEqual([2], [1, 2, 3].discard {each -> Bool in (each % 2 != 0)} )}
    
    func test_discard_neither_first_nor_last(){
        XCTAssertEqual([1, 3, 5], [1, 2, 3, 4, 5].discard{ each -> Bool in (each % 2 == 0)} )}
    
    func test_discard_strings(){
        let words = "apple zebra banana zombies cherimoya zelot".componentsSeparatedByString(" ")
        let result = words.discard{each -> Bool in (each as String).hasPrefix("z") ?? false}
        XCTAssertEqual("apple banana cherimoya".componentsSeparatedByString(" "), result )}
    
    func test_discard_arrays (){
        let rows = [
            [1, 2, 3],
            [5, 5, 5],
            [5, 1, 2],
            [2, 1, 2],
            [1, 5, 2],
            [2, 2, 1],
            [1, 2, 5]
        ]
        let result = rows.discard { each -> Bool in contains((each as [Int]), 5)}
        XCTAssertEqual([[1, 2, 3], [2, 1, 2], [2, 2, 1]], result )}
    
    
    
}

