
import XCTest



class SpaceAgeTest: XCTestCase {
    
    func testAgeInSeconds() {
        let age = SpaceAge(1_000_000)
        XCTAssertTrue(1_000_000 == age.seconds)
    }
    
    func testAgeInEarthYears() {
        let age = SpaceAge(1_000_000_000)
        XCTAssertTrue(31.69 == age.onEarth)
    }
    
    func testAgeInMercuryYears() {
        let age = SpaceAge(2_134_835_688)
        XCTAssertTrue(67.65 == age.onEarth)
        XCTAssertTrue(280.88 == age.onMercury)
    }
    
    func testAgeInVenusYears() {
        let age = SpaceAge(189_839_836)
        XCTAssertTrue(6.02 == age.onEarth)
        XCTAssertTrue(9.78 == age.onVenus)
    }
    
    func testAgeOnMars() {
        let age = SpaceAge(2_329_871_239)
        XCTAssertTrue(73.83 == age.onEarth)
        XCTAssertTrue(39.25 == age.onMars)
    }
    
    func testAgeOnJupiter() {
        let age = SpaceAge(901_876_382)
        XCTAssertTrue(28.58 == age.onEarth)
        XCTAssertTrue(2.41 == age.onJupiter)
    }
    
    func testAgeOnSaturn() {
        let age = SpaceAge(3_000_000_000)
        XCTAssertTrue(95.06 == age.onEarth)
        XCTAssertTrue(3.23 == age.onSaturn)
    }
    
    func testAgeOnUranus() {
        let age = SpaceAge(3_210_123_456)
        XCTAssertTrue(101.72 == age.onEarth)
        XCTAssertTrue(1.21 == age.onUranus)
    }
    
    func testAgeOnNeptune() {
        let age = SpaceAge(8_210_123_456)
        XCTAssertTrue(260.16 == age.onEarth)
        XCTAssertTrue(1.58 == age.onNeptune)
    }
    
}