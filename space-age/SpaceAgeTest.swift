import XCTest


class SpaceAgeTest: XCTestCase {
    
    func test_age_in_seconds(){
    let age = SpaceAge(1_000_000)
    XCTAssertTrue(1_000_000 == age.seconds)
    }
    
    func test_age_in_earth_years(){
    let age = SpaceAge(1_000_000_000)
    XCTAssertTrue(31.69 == age.on_earth)
    }
    
    func test_age_in_mercury_years(){
    let age = SpaceAge(2_134_835_688)
    XCTAssertTrue(67.65 == age.on_earth)
    XCTAssertTrue(280.88 == age.on_mercury)
    }
    
    func test_age_in_venus_years(){
    let age = SpaceAge(189_839_836)
    XCTAssertTrue(6.02 == age.on_earth)
    XCTAssertTrue(9.78 == age.on_venus)
    }
    
    func test_age_on_mars(){
    let age = SpaceAge(2_329_871_239)
    XCTAssertTrue(73.83 == age.on_earth)
    XCTAssertTrue(39.25 == age.on_mars)
    }
    
    func test_age_on_jupiter(){
    let age = SpaceAge(901_876_382)
    XCTAssertTrue(28.58 == age.on_earth)
    XCTAssertTrue(2.41 == age.on_jupiter)
    }
    
    func test_age_on_saturn(){
    let age = SpaceAge(3_000_000_000)
    XCTAssertTrue(95.06 == age.on_earth)
    XCTAssertTrue(3.23 == age.on_saturn)
    }
    
    func test_age_on_uranus(){
    let age = SpaceAge(3_210_123_456)
    XCTAssertTrue(101.72 == age.on_earth)
    XCTAssertTrue(1.21 == age.on_uranus)
    }
    
    func test_age_on_neptune(){
    let age = SpaceAge(8_210_123_456)
    XCTAssertTrue(260.16 == age.on_earth)
    XCTAssertTrue(1.58 == age.on_neptune)
    }
    
}