import Foundation
import XCTest

class AllergiesTest: XCTestCase {
    
    func test_bob() {
        
        let allergies = Allergies(34)
        
        XCTAssertTrue(allergies.hasAllergy(Allergies.peanuts), "Bob is allergic to peanuts")
        XCTAssertTrue(allergies.hasAllergy(Allergies.chocolate), "Bob is allergic to chocolate")
        XCTAssertFalse(allergies.hasAllergy(Allergies.cats),  "Bob is not allergic to cats")
    }
    
      func test_eggsNcats () {
    
        let allergies = Allergies(129)
    
        XCTAssertTrue(allergies.hasAllergy(Allergies.eggs))
        XCTAssertTrue(allergies.hasAllergy(Allergies.cats))
        XCTAssertFalse(allergies.hasAllergy(Allergies.chocolate))
    
      }
    
      func test_none() {
        let allergies = Allergies(0)
    
        XCTAssertFalse(allergies.hasAllergy(Allergies.pollen))
      }
    
      func testAll() {
    
        let allInt =  UInt(Array(0...7).reduce(0){ return ($0 | (1 << $1)) })
        let allergies = Allergies(allInt)
    
        XCTAssertTrue(allergies.hasAllergy(Allergies.eggs))
        XCTAssertTrue(allergies.hasAllergy(Allergies.peanuts))
        XCTAssertTrue(allergies.hasAllergy(Allergies.shellfish))
        XCTAssertTrue(allergies.hasAllergy(Allergies.strawberries))
        XCTAssertTrue(allergies.hasAllergy(Allergies.tomatoes))
        XCTAssertTrue(allergies.hasAllergy(Allergies.chocolate))
        XCTAssertTrue(allergies.hasAllergy(Allergies.pollen))
        XCTAssertTrue(allergies.hasAllergy(Allergies.cats))
    
      }
}
