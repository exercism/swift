import XCTest
@testable import HelloWorld

class HelloWorldTests: XCTestCase {

    func testHello() {
        XCTAssertEqual(hello(), "Hello, World!")
    }

    static var allTests: [(String, (HelloWorldTests) -> () throws -> Void)] {
        return [
            ("testHello", testHello),
        ]
    }
}
