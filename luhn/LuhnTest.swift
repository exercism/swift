import XCTest

class LuhnTest: XCTestCase {
    
func test_addends(){
    let luhn = Luhn(12_121)
    XCTAssertEqual([1, 4, 1, 4, 1], luhn.addends )}

func test_too_large_addend(){
    let luhn = Luhn(8631)
    XCTAssertEqual([7, 6, 6, 1], luhn.addends )}

func test_checksum(){
    let luhn = Luhn(4913)
    XCTAssertEqual(22, luhn.checksum )}

func test_checksum_again(){
    let luhn = Luhn(201_773)
    XCTAssertEqual(21, luhn.checksum )}

func test_invalid_number(){
    var luhn = Luhn(738)
    XCTAssertEqual (false ,luhn.isValid)}

func test_valid_number(){
    let luhn = Luhn(8_739_567)
    XCTAssertEqual (true, luhn.isValid)}

func test_create_valid_number(){
    let number = Luhn.create(123)
    XCTAssertEqual(1230, number )}

func test_create_other_valid_number(){
    let number = Luhn.create(873_956)
    XCTAssertEqual(8_739_567, number )}

func test_create_yet_another_valid_number(){
    let number = Luhn.create(837_263_756)
    XCTAssertEqual(8_372_637_564, number )}

    }
