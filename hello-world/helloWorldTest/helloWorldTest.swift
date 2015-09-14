import XCTest

// Apple Swift version 2.0

class  HelloWorldTest: XCTestCase {
    
    func testNoName(){
        let expected = "Hello, World!"
        XCTAssertEqual(HelloWorld.hello(), expected, "When given no name, we should greet the world!")
    }
    
    func testSampleName(){
        let expected = "Hello, Alice!"
        XCTAssertEqual(HelloWorld.hello("Alice"), expected, "When given 'Alice' we should greet Alice!")
    }
    
    func testOtherSampleName(){
        let expected = "Hello, Bob!"
        XCTAssertEqual(HelloWorld.hello("Bob"), expected, "When given 'Bob' we should greet Bob!")
    }
    
    func testNoStrangeName(){
        let expected = "Hello, !"
        XCTAssertEqual(HelloWorld.hello(""), expected, "When given an empty string, it is strange, but should have a space and punctuation")
    }
    
}