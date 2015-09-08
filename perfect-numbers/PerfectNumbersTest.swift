import Foundation
import XCTest

class PerfectNumbersTest: XCTestCase {


    func testPerfect() {
        let numberClassifier = NumberClassifier(number: 6)
        let expectedValue = NumberClassification.Perfect
        let result = numberClassifier.classification
        XCTAssertEqual(result,expectedValue)

    }

    func testPerfectAgain() {
        let numberClassifier = NumberClassifier(number: 28)
        let expectedValue = NumberClassification.Perfect
        let result = numberClassifier.classification
        XCTAssertEqual(result,expectedValue)

    }

    func testDeficient() {
        let numberClassifier = NumberClassifier(number: 13)
        let expectedValue = NumberClassification.Deficient
        let result = numberClassifier.classification
        XCTAssertEqual(result,expectedValue)

    }

    func testAbundant() {
        let numberClassifier = NumberClassifier(number: 12)
        let expectedValue = NumberClassification.Abundant
        let result = numberClassifier.classification
        XCTAssertEqual(result,expectedValue)

    }

}
