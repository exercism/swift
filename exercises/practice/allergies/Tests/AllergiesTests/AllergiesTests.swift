import XCTest
@testable import Allergies

class AllergiesTests: XCTestCase {

    func testBob() {

        let allergies = Allergies(34)

        XCTAssertTrue(allergies.hasAllergy(.peanuts), "Bob is allergic to peanuts")
        XCTAssertTrue(allergies.hasAllergy(.chocolate), "Bob is allergic to chocolate")
        XCTAssertFalse(allergies.hasAllergy(.cats), "Bob is not allergic to cats")
    }

    func testEggsNcats() {

        let allergies = Allergies(129)

        XCTAssertTrue(allergies.hasAllergy(.eggs))
        XCTAssertTrue(allergies.hasAllergy(.cats))
        XCTAssertFalse(allergies.hasAllergy(.chocolate))
    }

    func testNone() {
        let allergies = Allergies(0)

        XCTAssertFalse(allergies.hasAllergy(.pollen))
    }

    func testOtherAllergies() {
        let allergies = Allergies(257)

        XCTAssertTrue(allergies.hasAllergy(.eggs))
    }

    func testAll() {

        let allInt =  UInt(Array(0...7).reduce(0) { return ($0 | (1 << $1)) })
        let allergies = Allergies(allInt)

        XCTAssertTrue(allergies.hasAllergy(.eggs))
        XCTAssertTrue(allergies.hasAllergy(.peanuts))
        XCTAssertTrue(allergies.hasAllergy(.shellfish))
        XCTAssertTrue(allergies.hasAllergy(.strawberries))
        XCTAssertTrue(allergies.hasAllergy(.tomatoes))
        XCTAssertTrue(allergies.hasAllergy(.chocolate))
        XCTAssertTrue(allergies.hasAllergy(.pollen))
        XCTAssertTrue(allergies.hasAllergy(.cats))

    }

    static var allTests: [(String, (AllergiesTests) -> () throws -> Void)] {
        return [
            ("testBob", testBob),
            ("testEggsNcats", testEggsNcats),
            ("testNone", testNone),
            ("testOtherAllergies", testOtherAllergies),
            ("testAll", testAll),
        ]
    }
}
