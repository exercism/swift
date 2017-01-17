import XCTest
@testable import PhoneNumber

class PhoneNumberTests: XCTestCase {
    func testValidWithTenDigits() {
        let startingNumber = "1234567890"
        let expected = "1234567890"
        let result = PhoneNumber(startingNumber)
        XCTAssertEqual(result.number, expected)
    }

    func testCleansNumber() {
        let startingNumber = "(123) 456-7890"
        let expected = "1234567890"
        let result = PhoneNumber(startingNumber)
        XCTAssertEqual(result.number, expected)
    }

    func testCleansNumberWithDots() {
        let startingNumber = "123.456.7890"
        let expected = "1234567890"
        let result = PhoneNumber(startingNumber)
        XCTAssertEqual(result.number, expected)
    }

    func testValidWithElevenDigitsAndFirstIsOne() {
        let startingNumber = "11234567890"
        let expected = "1234567890"
        let result = PhoneNumber(startingNumber)
        XCTAssertEqual(result.number, expected)
    }

    func testInvalidWhenElevenDigits() {
        let startingNumber = "21234567890"
        let expected = "0000000000"
        let result = PhoneNumber(startingNumber)
        XCTAssertEqual(result.number, expected)
    }

    func testInvalidWhenNineDigits() {
        let startingNumber = "123456789"
        let expected = "0000000000"
        let result = PhoneNumber(startingNumber)
        XCTAssertEqual(result.number, expected)
    }

    func testAreaCode() {
        let startingNumber = "1234567890"
        let expected = "123"
        let number = PhoneNumber(startingNumber)
        let result = number.areaCode
        XCTAssertEqual(result, expected)
    }

    func testPrettyPrint() {
        let startingNumber = "1234567890"
        let expected = "(123) 456-7890"
        let number = PhoneNumber(startingNumber)
        XCTAssertEqual(String(describing: number), expected)
    }

    func testPrettyPrintWithFullUSPhoneNumber() {
        let startingNumber = "11234567890"
        let expected = "(123) 456-7890"
        let number = PhoneNumber(startingNumber)
        XCTAssertEqual(String(describing: number), expected)
    }

    static var allTests: [(String, (PhoneNumberTests) -> () throws -> Void)] {
        return [
            ("testValidWithTenDigits", testValidWithTenDigits),
            ("testCleansNumber", testCleansNumber),
            ("testCleansNumberWithDots", testCleansNumberWithDots),
            ("testValidWithElevenDigitsAndFirstIsOne", testValidWithElevenDigitsAndFirstIsOne),
            ("testInvalidWhenElevenDigits", testInvalidWhenElevenDigits),
            ("testInvalidWhenNineDigits", testInvalidWhenNineDigits),
            ("testAreaCode", testAreaCode),
            ("testPrettyPrint", testPrettyPrint),
            ("testPrettyPrintWithFullUSPhoneNumber", testPrettyPrintWithFullUSPhoneNumber),
        ]
    }
}
