import XCTest

class AnagramTest: XCTestCase {
    
    func testNoMatches() {
        let anagram = Anagram(word: "diaper")
        let results = anagram.match(["hello","world","zombies","pants"])
        let expected = []
        XCTAssertEqualObjects(results, expected)
    }
    
    
    func testDetectSimpleAnagram() {
        let anagram = Anagram(word: "ant")
        let results = anagram.match(["tan","stand","at"])
        let expected = ["tan"]
        XCTAssertEqualObjects(results, expected)
    }
    
    func testDetectMultipleAnagrams() {
        let anagram = Anagram(word: "master")
        let results = anagram.match(["stream","pigeon","maters"])
        let expected = ["stream","maters"]
        XCTAssertEqualObjects(results, expected)
    }
    
    func testDoesNotConfuseDifferentDuplicates() {
        let anagram = Anagram(word: "galea")
        let results = anagram.match(["eagle"])
        let expected = []
        XCTAssertEqualObjects(results, expected)
    }
    
    func testIdenticalWordIsNotAnagram() {
        let anagram = Anagram(word: "corn")
        let results = anagram.match(["corn", "dark", "Corn", "rank", "CORN", "cron", "park"])
        let expected = ["cron"]
        XCTAssertEqualObjects(results, expected)
    }
    
    func testEliminateAnagramsWithSameChecksum() {
        let anagram = Anagram(word: "mass")
        let results = anagram.match(["last"])
        let expected = []
        XCTAssertEqualObjects(results, expected)
    }
    
    func testEliminateAnagramSubsets() {
        let anagram = Anagram(word: "good")
        let results = anagram.match(["dog","goody"])
        let expected = []
        XCTAssertEqualObjects(results, expected)
    }
    
    func testDetectAnagram() {
        let anagram = Anagram(word: "listen")
        let results = anagram.match(["enlists","google","inlets","banana"])
        let expected = ["inlets"]
        XCTAssertEqualObjects(results, expected)
    }
    
    func testMultipleAnagrams() {
        let anagram = Anagram(word: "allergy")
        let results = anagram.match(["gallery","ballerina","regally","clergy","largely","leading"])
        let expected = ["gallery","regally","largely"]
        XCTAssertEqualObjects(results, expected)
    }
    
    func testAnagramsAreCaseInsensitive() {
        let anagram = Anagram(word: "Orchestra")
        let results = anagram.match(["cashregister","Carthorse","radishes"])
        let expected = ["Carthorse"]
        XCTAssertEqualObjects(results, expected)
    }
    
}
