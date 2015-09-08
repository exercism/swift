import Foundation
import XCTest

extension String {
    
    var length: Int {return count(self)}
    
    func reverse() -> String {
        var result:String = ""
        for char in self {
            result = "\(char)\(result)"
        }
        return result
    }
    
}

class AccumulateTest: XCTestCase {

     func testEmptyAccumulation() {

       let input = [Int]([])
       let expected = []
       func square(input:Int) -> Int {
            return input * input
       }
      
       let result = input.accumulate(square)
        
        XCTAssert(expected == result)
    }

    func testAccumulateSquares() {
        
        let input = [1,2,3,4]
        let expected = [1,4,9,16]
        func square(input:Int) -> Int {
            return input * input
        }
        
        let result = input.accumulate(square)
        
        XCTAssert(expected == result)
    }

    
    func testAccumulateUpcases() {
        
        let input = ["hello","world"]
        let expected = ["HELLO","WORLD"]
        func toUpper(input:String) -> String {
            return input.uppercaseString
        }
        
        let result = input.accumulate(toUpper)
        
        XCTAssert(expected == result)

     }
    
    
    func testAccumulateReversedStrings() {
        
        let input =    ["the","quick","brown","fox","etc"]
        let expected = ["eht","kciuq","nworb","xof","cte"]
        func reverse(input:String) -> String {
            return input.reverse()
        }
        
        let result = input.accumulate(reverse)
        
        XCTAssert(expected == result)
    }
    
    func testAccumulateRecursively() {
        
        let input =   ["a","b","c"]

        let expected = [
            ["a1","a2","a3"],
            ["b1","b2","b3"],
            ["c1","c2","c3"]
        ]
        
        func recurse(input:String) -> [String] {
            func appendTo(innerInput:String) -> String {
                return input+innerInput
            }
            let result = ["1","2","3"].accumulate(appendTo)
            return result
        }

        
        let result = input.accumulate(recurse)
        
        XCTAssert(expected == result)
    }
}
