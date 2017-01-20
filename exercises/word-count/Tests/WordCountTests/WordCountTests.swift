import XCTest
@testable import WordCount

class WordCountTests: XCTestCase {
    func testCountOneWord() {
        let words = WordCount(words: "word")
        let expected = ["word": 1]
        let result = words.count()

        XCTAssertEqual(expected, result)
    }

    func testCountOneOfEeach() {
        let words = WordCount(words: "one of each")
        let expected = ["one": 1, "of": 1, "each": 1 ]
        let result = words.count()

        XCTAssertEqual(expected, result)
    }

    func testCountMultipleOccurrences() {
        let words = WordCount(words: "one fish two fish red fish blue fish")
        let expected = ["one": 1, "fish": 4, "two": 1, "red": 1, "blue": 1 ]
        let result = words.count()

        XCTAssertEqual(expected, result)
    }

    func testIgnorePunctation() {
        let words = WordCount(words: "car : carpet as java : javascript!!&$%^&")
        let expected = ["car": 1, "carpet": 1, "as": 1, "java": 1, "javascript": 1 ]
        let result = words.count()

        XCTAssertEqual(expected, result)
    }

    func testIncludeNumbers() {
        let words = WordCount(words: "testing, 1, 2 testing")
        let expected = [ "testing": 2, "1": 1, "2": 1 ]
        let result = words.count()

        XCTAssertEqual(expected, result)
    }

    func testNormalizeCase() {
        let words = WordCount(words:"go Go GO")
        let expected = [ "go": 3]
        let result = words.count()

        XCTAssertEqual(expected, result)
    }

    static var allTests: [(String, (WordCountTests) -> () throws -> Void)] {
        return [
            ("testCountOneWord", testCountOneWord),
            ("testCountOneOfEeach", testCountOneOfEeach),
            ("testCountMultipleOccurrences", testCountMultipleOccurrences),
            ("testIgnorePunctation", testIgnorePunctation),
            ("testIncludeNumbers", testIncludeNumbers),
            ("testNormalizeCase", testNormalizeCase),
        ]
    }
}
