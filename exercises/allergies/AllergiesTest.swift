
import XCTest



class AllergiesTest: XCTestCase {
    
    func testBob() {
        
        let allergies = Allergies(34)
        
        XCTAssertTrue(allergies.hasAllergy(.Peanuts), "Bob is allergic to peanuts")
        XCTAssertTrue(allergies.hasAllergy(.Chocolate), "Bob is allergic to chocolate")
        XCTAssertFalse(allergies.hasAllergy(.Cats),  "Bob is not allergic to cats")
    }
    
    func testEggsNcats() {
        
        let allergies = Allergies(129)
        
        XCTAssertTrue(allergies.hasAllergy(.Eggs))
        XCTAssertTrue(allergies.hasAllergy(.Cats))
        XCTAssertFalse(allergies.hasAllergy(.Chocolate))
        
    }
    
    func testNone() {
        let allergies = Allergies(0)
        
        XCTAssertFalse(allergies.hasAllergy(.Pollen))
    }
    
    func testAll() {
        
        let allInt =  UInt(Array(0...7).reduce(0){ return ($0 | (1 << $1)) })
        let allergies = Allergies(allInt)
        
        XCTAssertTrue(allergies.hasAllergy(.Eggs))
        XCTAssertTrue(allergies.hasAllergy(.Peanuts))
        XCTAssertTrue(allergies.hasAllergy(.Shellfish))
        XCTAssertTrue(allergies.hasAllergy(.Strawberries))
        XCTAssertTrue(allergies.hasAllergy(.Tomatoes))
        XCTAssertTrue(allergies.hasAllergy(.Chocolate))
        XCTAssertTrue(allergies.hasAllergy(.Pollen))
        XCTAssertTrue(allergies.hasAllergy(.Cats))
        
    }
}
