import XCTest

// Apple Swift version 2.1

class EtlTest: XCTestCase {

    func testTransformOneValue() {
        let old = [ 1 : [ "A" ] ]
        let expected =  ["a" : 1 ]
        let results = ETL.transform(old)
        
        XCTAssertEqual(results, expected)
    }
    
    func testTransformMoreValues() {
        let old = [ 1 : [ "A", "E", "I", "O", "U" ] ]
        let expected =  ["a" : 1, "e": 1, "i": 1, "o": 1, "u": 1 ]
        let results = ETL.transform(old)
        
        XCTAssertEqual(results, expected)
    }
    
    func testMoreKeys() {
        let old = [ 1 : [ "A", "E" ], 2: ["D", "G"] ]
        let expected =  ["a" : 1, "e": 1, "d": 2, "g": 2 ]
        let results = ETL.transform(old)
        
        XCTAssertEqual(results, expected)
    }
    
    func testFullDataSet() {
        let old = [ 1 : [ "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ],
            2 : [ "D", "G" ],
            3 : [ "B", "C", "M", "P" ],
            4 : [ "F", "H", "V", "W", "Y" ],
            5 : [ "K"],
            8 : [ "J", "X" ],
            10 : [ "Q", "Z" ]
        ]
        let expected = [  "a" : 1, "b" : 3, "c" : 3, "d" : 2, "e" : 1,
            "f" : 4, "g" : 2, "h" : 4, "i" : 1, "j" : 8,
            "k" : 5, "l" : 1, "m" : 3, "n" : 1, "o" : 1,
            "p" : 3, "q" : 10, "r" : 1, "s" : 1, "t" : 1,
            "u" : 1, "v" : 4, "w" : 4, "x" : 8, "y" : 4,
            "z" : 10 ]
        
        let results = ETL.transform(old)
        
        XCTAssertEqual(results, expected)
    }
}