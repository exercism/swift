import Foundation
import XCTest

class SecretHandshakeTests: XCTestCase {
    
func test_handshake_1_to_wink(){
    var handshake = SecretHandshake(1)
    XCTAssertEqual(["wink"], handshake.commands )}

func test_handshake_10_to_double_blink(){
    var handshake = SecretHandshake(2)
    XCTAssertEqual(["double blink"], handshake.commands )}

func test_handshake_100_to_close_your_eyes(){
    var handshake = SecretHandshake(4)
    XCTAssertEqual(["close your eyes"], handshake.commands )}

func test_handshake_1000_to_jump(){
    var handshake = SecretHandshake(8)
    XCTAssertEqual(["jump"], handshake.commands )}

func test_handshake_11_to_wink_and_double_blink(){
    var handshake = SecretHandshake(3)
    XCTAssertEqual(["wink", "double blink"], handshake.commands )}

func test_handshake_10011_to_double_blink_and_wink(){
    var handshake = SecretHandshake(19)
    XCTAssertEqual(["double blink", "wink"], handshake.commands )}

func test_handshake_11111_to_double_blink_and_wink(){
    var handshake = SecretHandshake(31)
    var expected = ["jump", "close your eyes", "double blink", "wink"]
    XCTAssertEqual(expected, handshake.commands )}

func test_non_valid_handshake(){
    var handshake = SecretHandshake(0)
    XCTAssertEqual([], handshake.commands )}
    
}