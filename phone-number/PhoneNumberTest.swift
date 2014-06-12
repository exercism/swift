import XCTest

class PhoneNumberTest : XCTestCase {
    
    func testValidWithTenDigits() {
        let startingNumber = "1234567890"
        let expected = "1234567890"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.number()
        XCTAssertEqualObjects(result, expected)
    }

    func testCleansNumber() {
        let startingNumber = "(123) 456-7890"
        let expected = "1234567890"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.number()
        XCTAssertEqualObjects(result, expected)
    }
    
    func testCleansNumberWithDots() {
        let startingNumber = "123.456.7890"
        let expected = "1234567890"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.number()
        XCTAssertEqualObjects(result, expected)
    }
    
    func testValidWithElevenDigitsAndFirstIsOne() {
        let startingNumber = "11234567890"
        let expected = "1234567890"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.number()
        XCTAssertEqualObjects(result, expected)
    }
    
    func testInvalidWhenElevenDigits() {
        let startingNumber = "21234567890"
        let expected = "0000000000"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.number()
        XCTAssertEqualObjects(result, expected)
    }
    
    func testInvalidWhenNineDigits() {
        let startingNumber = "123456789"
        let expected = "0000000000"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.number()
        XCTAssertEqualObjects(result, expected)
    }
    
    func testAreaCode() {
        let startingNumber = "1234567890"
        let expected = "123"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.areaCode()
        XCTAssertEqualObjects(result, expected)
    }
    
    func testPrettyPrint() {
        let startingNumber = "1234567890"
        let expected = "(123) 456-7890"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.description()
        XCTAssertEqualObjects(result, expected)
    }
    
    func testPrettyPrintWithFullUSPhoneNumber() {
        let startingNumber = "11234567890"
        let expected = "(123) 456-7890"
        let number = PhoneNumber(startingNumber: startingNumber)
        let result = number.description()
        XCTAssertEqualObjects(result, expected)
    }
    
}