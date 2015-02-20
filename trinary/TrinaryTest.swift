import XCTest


class TrinaryTest: XCTestCase {
    
    func test_trinary_1_is_decimal_1(){
        XCTAssertEqual(1, Trinary("1").toDecimal )}
    
    func test_trinary_2_is_decimal_2(){
        XCTAssertEqual(2, Trinary("2").toDecimal )}
    
    func test_trinary_10_is_decimal_3(){
        XCTAssertEqual(3, Trinary("10").toDecimal )}
    
    func test_trinary_11_is_decimal_4(){
        XCTAssertEqual(4, Trinary("11").toDecimal )}
    
    func test_trinary_100_is_decimal_9(){
        XCTAssertEqual(9, Trinary("100").toDecimal )}
    
    func test_trinary_112_is_decimal_14(){
        XCTAssertEqual(14, Trinary("112").toDecimal )}
    
    func test_trinary_222_is_26(){
        XCTAssertEqual(26, Trinary("222").toDecimal )}
    
    func test_trinary_1122000120_is_32091(){
        XCTAssertEqual(32_091, Trinary("1122000120").toDecimal )}
    
    func test_invalid_trinary_is_decimal_0(){
        XCTAssertEqual(0, Trinary("carrot").toDecimal )}

    
 }

