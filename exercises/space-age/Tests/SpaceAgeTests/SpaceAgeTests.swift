import XCTest
@testable import SpaceAge

class SpaceAgeTests: XCTestCase {
    func testAgeInSeconds() {
        let age = SpaceAge(1_000_000)
        XCTAssertEqual(1_000_000, age.seconds)
    }

    func testAgeInEarthYears() {
        let age = SpaceAge(1_000_000_000)
        XCTAssertEqual(31.69, age.onEarth, accuracy: 0.01)
    }

    func testAgeInMercuryYears() {
        let age = SpaceAge(2_134_835_688)
        XCTAssertEqual(67.65, age.onEarth, accuracy: 0.01)
        XCTAssertEqual(280.88, age.onMercury, accuracy: 0.01)
    }

    func testAgeInVenusYears() {
        let age = SpaceAge(189_839_836)
        XCTAssertEqual(6.02, age.onEarth, accuracy: 0.01)
        XCTAssertEqual(9.78, age.onVenus, accuracy: 0.01)
    }

    func testAgeOnMars() {
        let age = SpaceAge(2_329_871_239)
        XCTAssertEqual(73.83, age.onEarth, accuracy: 0.01)
        XCTAssertEqual(39.25, age.onMars, accuracy: 0.01)
    }

    func testAgeOnJupiter() {
        let age = SpaceAge(901_876_382)
        XCTAssertEqual(28.58, age.onEarth, accuracy: 0.01)
        XCTAssertEqual(2.41, age.onJupiter, accuracy: 0.01)
    }

    func testAgeOnSaturn() {
        let age = SpaceAge(3_000_000_000)
        XCTAssertEqual(95.06, age.onEarth, accuracy: 0.01)
        XCTAssertEqual(3.23, age.onSaturn, accuracy: 0.01)
    }

    func testAgeOnUranus() {
        let age = SpaceAge(3_210_123_456)
        XCTAssertEqual(101.72, age.onEarth, accuracy: 0.01)
        XCTAssertEqual(1.21, age.onUranus, accuracy: 0.01)
    }

    func testAgeOnNeptune() {
        let age = SpaceAge(8_210_123_456)
        XCTAssertEqual(260.16, age.onEarth, accuracy: 0.01)
        XCTAssertEqual(1.58, age.onNeptune, accuracy: 0.01)
    }

    static var allTests: [(String, (SpaceAgeTests) -> () throws -> Void)] {
        return [
            ("testAgeInSeconds", testAgeInSeconds),
            ("testAgeInEarthYears", testAgeInEarthYears),
            ("testAgeInMercuryYears", testAgeInMercuryYears),
            ("testAgeInVenusYears", testAgeInVenusYears),
            ("testAgeOnMars", testAgeOnMars),
            ("testAgeOnJupiter", testAgeOnJupiter),
            ("testAgeOnSaturn", testAgeOnSaturn),
            ("testAgeOnUranus", testAgeOnUranus),
            ("testAgeOnNeptune", testAgeOnNeptune),
        ]
    }
}
