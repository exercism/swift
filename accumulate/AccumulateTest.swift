
import Foundation
import XCTest

extension String {
    
    var length: Int {return countElements(self)}
    
    subscript (index: Int) -> String {
        return String(Array(self)[index])
    }
    
    func reverse() -> String {
        var result:String = ""
        for index in stride(from: self.length, to: 0, by: -1) {
            result += self[index - 1]
        }
        return result
    }

}


class AccumulateTest: XCTestCase {

     func test_empty_accumulation() {

       let input = Array<Int>([])
       let expected = []
       func square(input:Int) -> Int {
            return input * input
       }
      
       let result = input.accumulate(square)
        
        XCTAssert(expected == result)
    }

    func test_accumulate_squares() {
        
        let input = [1,2,3,4]
        let expected = [1,4,9,16]
        func square(input:Int) -> Int {
            return input * input
        }
        
        let result = input.accumulate(square)
        
        XCTAssert(expected == result)
    }

    
    func test_accumulate_upcases() {
        
        let input = ["hello","world"]
        let expected = ["HELLO","WORLD"]
        func toUpper(input:String) -> String {
            return input.uppercaseString
        }
        
        let result = input.accumulate(toUpper)
        
        XCTAssert(expected == result)

     }
    
    
    func test_accumulate_reversed_strings() {
        
        let input =    ["the","quick","brown","fox","etc"]
        let expected = ["eht","kciuq","nworb","xof","cte"]
        println("the".reverse())
        func reverse(input:String) -> String {
            return input.reverse()
        }
        
        let result = input.accumulate(reverse)
        
        XCTAssert(expected == result)
    }
    
    func test_accumulate_recursively() {
        
        let input =    [1,2,3]
        let expected = [3,6,9]
        func recurse(input:Int) -> Int {
            func triple(input:Int) -> Int {
                return input * 3
            }
            return [input].accumulate(triple)[0]
        }
        
        let result = input.accumulate(recurse)
        
        XCTAssert(expected == result)
    }
}
