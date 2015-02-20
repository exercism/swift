import XCTest

class OctalTest: XCTestCase
{
    
func test_octal_1_is_decimal_1(){
    XCTAssertEqual(1, Octal("1").toDecimal )}

func test_octal_10_is_decimal_8(){
    XCTAssertEqual(8, Octal("10").toDecimal )}

func test_octal_17_is_decimal_15(){
    XCTAssertEqual(15, Octal("17").toDecimal )}

func test_octal_11_is_decimal_9(){
    XCTAssertEqual(9, Octal("11").toDecimal )}

func test_octal_130_is_decimal_88(){
    XCTAssertEqual(88, Octal("130").toDecimal )}

func test_octal_2047_is_decimal_1063(){
    XCTAssertEqual(1063, Octal("2047").toDecimal )}

func test_octal_7777_is_decimal_4095(){
    XCTAssertEqual(4095, Octal("7777").toDecimal )}

func test_octal_1234567_is_decimal_342391(){
    XCTAssertEqual(342_391, Octal("1234567").toDecimal )}

func test_invalid_octal_is_decimal_0(){
    XCTAssertEqual(0, Octal("carrot").toDecimal )}

func test_8_is_seen_as_invalid_and_returns_0(){
    XCTAssertEqual(0, Octal("8").toDecimal )}

func test_9_is_seen_as_invalid_and_returns_0(){
    XCTAssertEqual(0, Octal("9").toDecimal )}

func test_6789_is_seen_as_invalid_and_returns_0(){
    XCTAssertEqual(0, Octal("6789").toDecimal )}

func test_abc1z_is_seen_as_invalid_and_returns_0(){
    XCTAssertEqual(0, Octal("abc1z").toDecimal )}

func test_valid_octal_formatted_string_011_is_decimal_9(){
    XCTAssertEqual(9, Octal("011").toDecimal )}


   }