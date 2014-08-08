import Foundation
import XCTest

class AllergiesTest: XCTestCase {

  func test_bob() {

    let allergies = Allergies(34)

    XCTAssertTrue(allergies & Allergies.peanuts, "Bob is allergic to peanuts")
    XCTAssertTrue(allergies & Allergies.chocolate, "Bob is allergic to chocolate")
    XCTAssertFalse(allergies & Allergies.cats,  "Bob is not allergic to cats")
  }

  func test_eggsNcats () {

    let allergies = Allergies(129)

    XCTAssertTrue(allergies & Allergies.eggs)
    XCTAssertTrue(allergies & Allergies.cats)
    XCTAssertFalse(allergies & Allergies.chocolate)

  }

  func test_none() {
    let allergies = Allergies(0)

    XCTAssertFalse(allergies & Allergies.pollen)
  }

  func testAll() {

    let allInt =  UInt(Array(0...7).reduce(0){ return ($0 | (1 << $1)) })
    let allergies = Allergies(allInt)

    XCTAssertTrue(allergies & Allergies.eggs)
    XCTAssertTrue(allergies & Allergies.peanuts)
    XCTAssertTrue(allergies & Allergies.shellfish)
    XCTAssertTrue(allergies & Allergies.strawberries)
    XCTAssertTrue(allergies & Allergies.tomatoes)
    XCTAssertTrue(allergies & Allergies.chocolate)
    XCTAssertTrue(allergies & Allergies.pollen)
    XCTAssertTrue(allergies & Allergies.cats)

  }
}
