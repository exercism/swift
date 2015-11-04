
import XCTest

// Apple Swift version 2.0

class AllergiesTest: XCTestCase {
    
    func testBob() {
        
        let patient = Patient(34)
        
        XCTAssertTrue(patient.hasAllergy(Allergies.Peanuts), "Bob is allergic to peanuts")
        XCTAssertTrue(patient.hasAllergy(Allergies.Chocolate), "Bob is allergic to chocolate")
        XCTAssertFalse(patient.hasAllergy(Allergies.Cats),  "Bob is not allergic to cats")
    }
    
    func testEggsNcats() {
        
        let patient = Patient(129)
        
        XCTAssertTrue(patient.hasAllergy(Allergies.Eggs))
        XCTAssertTrue(patient.hasAllergy(Allergies.Cats))
        XCTAssertFalse(patient.hasAllergy(Allergies.Chocolate))
        
    }
    
    func testNone() {
        let patient = Patient(0)
        
        XCTAssertFalse(patient.hasAllergy(Allergies.Pollen))
    }
    
    func testAll() {
        
        let allInt =  UInt(Array(0...7).reduce(0){ return ($0 | (1 << $1)) })
        let patient = Patient(allInt)
        
        XCTAssertTrue(patient.hasAllergy(Allergies.Eggs))
        XCTAssertTrue(patient.hasAllergy(Allergies.Peanuts))
        XCTAssertTrue(patient.hasAllergy(Allergies.Shellfish))
        XCTAssertTrue(patient.hasAllergy(Allergies.Strawberries))
        XCTAssertTrue(patient.hasAllergy(Allergies.Tomatoes))
        XCTAssertTrue(patient.hasAllergy(Allergies.Chocolate))
        XCTAssertTrue(patient.hasAllergy(Allergies.Pollen))
        XCTAssertTrue(patient.hasAllergy(Allergies.Cats))
        
    }
}

