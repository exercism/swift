
import XCTest

class SecretHandshakeTests: XCTestCase {
    
    func testHandshake1ToWink() {
        var handshake = SecretHandshake(1)
        XCTAssertEqual(["wink"], handshake.commands)
    }
    
    func testHandshake10ToDoubleBlink() {
        var handshake = SecretHandshake(2)
        XCTAssertEqual(["double blink"], handshake.commands)
    }
    
    func testHandshake100ToCloseYourEyes() {
        var handshake = SecretHandshake(4)
        XCTAssertEqual(["close your eyes"], handshake.commands)
    }
    
    func testHandshake1000ToJump() {
        var handshake = SecretHandshake(8)
        XCTAssertEqual(["jump"], handshake.commands)
    }
    
    func testHandshake11ToWinkAndDoubleBlink() {
        var handshake = SecretHandshake(3)
        XCTAssertEqual(["wink", "double blink"], handshake.commands)
    }
    
    func testHandshake10011ToDoubleBlinkAndWink() {
        var handshake = SecretHandshake(19)
        XCTAssertEqual(["double blink", "wink"], handshake.commands)
    }
    
    func testHandshake11111ToDoubleBlinkAndWink() {
        var handshake = SecretHandshake(31)
        var expected = ["jump", "close your eyes", "double blink", "wink"]
        XCTAssertEqual(expected, handshake.commands)
    }
    
    func testNonValidHandshake() {
        var handshake = SecretHandshake(0)
        XCTAssertEqual([], handshake.commands)
    }
    
}