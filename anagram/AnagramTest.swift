
import XCTest

// Apple Swift version 2.1

class AnagramTest: XCTestCase {
    
    func testNoMatches() {
        let anagram = Anagram(word: "diaper")
        let results = anagram.match(["hello","world","zombies","pants"])
        let expected = []
        XCTAssertEqual(results, expected)
    }
    
    
    func testDetectSimpleAnagram() {
        let anagram = Anagram(word: "ant")
        let results = anagram.match(["tan","stand","at"])
        let expected = ["tan"]
        XCTAssertEqual(results, expected)
    }
    
    func testDetectMultipleAnagrams() {
        let anagram = Anagram(word: "master")
        let results = anagram.match(["stream","pigeon","maters"])
        let expected = ["stream","maters"]
        XCTAssertEqual(results, expected)
    }
    
    func testDoesNotConfuseDifferentDuplicates() {
        let anagram = Anagram(word: "galea")
        let results = anagram.match(["eagle"])
        let expected = []
        XCTAssertEqual(results, expected)
    }
    
    func testIdenticalWordIsNotAnagram() {
        let anagram = Anagram(word: "corn")
        let results = anagram.match(["corn", "dark", "Corn", "rank", "CORN", "cron", "park"])
        let expected = ["cron"]
        XCTAssertEqual(results, expected)
    }
    
    func testEliminateAnagramsWithSameChecksum() {
        let anagram = Anagram(word: "mass")
        let results = anagram.match(["last"])
        let expected = []
        XCTAssertEqual(results, expected)
    }
    
    func testEliminateAnagramSubsets() {
        let anagram = Anagram(word: "good")
        let results = anagram.match(["dog","goody"])
        let expected = []
        XCTAssertEqual(results, expected)
    }
    
    func testDetectAnagram() {
        let anagram = Anagram(word: "listen")
        let results = anagram.match(["enlists","google","inlets","banana"])
        let expected = ["inlets"]
        XCTAssertEqual(results, expected)
    }
    
    func testMultipleAnagrams() {
        let anagram = Anagram(word: "allergy")
        let results = anagram.match(["gallery","ballerina","regally","clergy","largely","leading"])
        let expected = ["gallery","regally","largely"]
        XCTAssertEqual(results, expected)
    }
    
    func testAnagramsAreCaseInsensitive() {
        let anagram = Anagram(word: "Orchestra")
        let results = anagram.match(["cashregister","Carthorse","radishes"])
        let expected = ["Carthorse"]
        XCTAssertEqual(results, expected)
    }
    
}
