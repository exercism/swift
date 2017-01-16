import XCTest
@testable import Luhn

class LuhnTests: XCTestCase {

    func testAddends() {
        let luhn = Luhn(12_121)
        XCTAssertEqual([1, 4, 1, 4, 1], luhn.addends)
    }

    func testTooLargeAddend() {
        let luhn = Luhn(8631)
        XCTAssertEqual([7, 6, 6, 1], luhn.addends)
    }

    func testChecksum() {
        let luhn = Luhn(4913)
        XCTAssertEqual(22, luhn.checksum)
    }

    func testChecksumAgain() {
        let luhn = Luhn(201_773)
        XCTAssertEqual(21, luhn.checksum)
    }

    func testInvalidNumber() {
        let luhn = Luhn(738)
        XCTAssertEqual (false, luhn.isValid)
    }

    func testValidNumber() {
        let luhn = Luhn(8_739_567)
        XCTAssertEqual (true, luhn.isValid)
    }

    func testCreateValidNumber() {
        let number = Luhn.create(123)
        XCTAssertEqual(1230, number)
    }

    func testCreateOtherValidNumber() {
        let number = Luhn.create(873_956)
        XCTAssertEqual(8_739_567, number)
    }

    func testCreateYetAnotherValidNumber() {
        let number = Luhn.create(837_263_756)
        XCTAssertEqual(8_372_637_564, number)
    }

    static var allTests: [(String, (LuhnTests) -> () throws -> Void)] {
        return [
            ("testAddends", testAddends),
            ("testTooLargeAddend", testTooLargeAddend),
            ("testChecksum", testChecksum),
            ("testChecksumAgain", testChecksumAgain),
            ("testInvalidNumber", testInvalidNumber),
            ("testValidNumber", testValidNumber),
            ("testCreateValidNumber", testCreateValidNumber),
            ("testCreateOtherValidNumber", testCreateOtherValidNumber),
            ("testCreateYetAnotherValidNumber", testCreateYetAnotherValidNumber),
        ]
    }
}
