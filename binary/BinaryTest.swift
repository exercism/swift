import XCTest

class BinaryTests: XCTestCase {
    
    func test_binary_1_is_decimal_1(){
        XCTAssertTrue( 1 == Binary("1").toDecimal)}
    
    func test_binary_10_is_decimal_2(){
        XCTAssertTrue( 2 == Binary("10").toDecimal)}
    
    func test_binary_11_is_decimal_3(){
        XCTAssertTrue( 3 == Binary("11").toDecimal)}
    
    func test_binary_100_is_decimal_4(){
        XCTAssertTrue( 4 == Binary("100").toDecimal)}
    
    func test_binary_1001_is_decimal_9(){
        XCTAssertTrue( 9 == Binary("1001").toDecimal)}
    
    func test_binary_11010_is_decimal_26(){
        XCTAssertTrue( 26 == Binary("11010").toDecimal)}
    
    func test_binary_10001101000_is_decimal_1128(){
        XCTAssertTrue( 1128 == Binary("10001101000").toDecimal)}
    
    func test_invalid_binary_is_decimal_0(){
        XCTAssertTrue( 0 == Binary("carrot123").toDecimal)}
    
    
}
