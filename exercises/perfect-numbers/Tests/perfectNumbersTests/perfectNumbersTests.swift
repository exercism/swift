import XCTest
@testable import perfectNumbers

class perfectNumbersTests: XCTestCase {
    func testPerfect() {
        let numberClassifier = NumberClassifier(number: 6)
        XCTAssertEqual([.perfect], [numberClassifier.classification])
    }

    func testPerfectAgain() {
        let numberClassifier = NumberClassifier(number: 28)
        XCTAssertEqual([.perfect], [numberClassifier.classification])
    }

    func testDeficient() {
        let numberClassifier = NumberClassifier(number: 13)
        XCTAssertEqual([.deficient], [numberClassifier.classification])

    }

    func testAbundant() {
        let numberClassifier = NumberClassifier(number: 12)
        XCTAssertEqual([.abundant], [numberClassifier.classification])
    }

    static var allTests: [(String, (perfectNumbersTests) -> () throws -> Void)] {
        return [
            ("testPerfect", testPerfect),
            ("testPerfectAgain", testPerfectAgain),
            ("testDeficient", testDeficient),
            ("testAbundant", testAbundant),
        ]
    }
}
