import XCTest

@testable import HelloWorld

class HelloWorldTests: XCTestCase {
  func testHello() {
    XCTAssertEqual(hello(), "Hello, World!")
  }
}
