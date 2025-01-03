import Testing

@testable import HelloWorld

@Test("Hello, World!")
func testHello() {
  #expect(hello() == "Hello, World!")
}
