#if swift(>=3.0)
    import XCTest
#endif

class SecretHandshakeTest: XCTestCase {

    func testHandshake1ToWink() {
        let handshake = SecretHandshake(1)
        XCTAssertEqual(["wink"], handshake.commands)
    }

    func testHandshake10ToDoubleBlink() {
        let handshake = SecretHandshake(2)
        XCTAssertEqual(["double blink"], handshake.commands)
    }

    func testHandshake100ToCloseYourEyes() {
        let handshake = SecretHandshake(4)
        XCTAssertEqual(["close your eyes"], handshake.commands)
    }

    func testHandshake1000ToJump() {
        let handshake = SecretHandshake(8)
        XCTAssertEqual(["jump"], handshake.commands)
    }

    func testHandshake11ToWinkAndDoubleBlink() {
        let handshake = SecretHandshake(3)
        XCTAssertEqual(["wink", "double blink"], handshake.commands)
    }

    func testHandshake10011ToDoubleBlinkAndWink() {
        let handshake = SecretHandshake(19)
        XCTAssertEqual(["double blink", "wink"], handshake.commands)
    }

    func testHandshake11111ToDoubleBlinkAndWink() {
        let handshake = SecretHandshake(31)
        let expected = ["jump", "close your eyes", "double blink", "wink"]
        XCTAssertEqual(expected, handshake.commands)
    }

    func testNonValidHandshake() {
        let handshake = SecretHandshake(0)
        XCTAssertEqual([], handshake.commands)
    }

}
