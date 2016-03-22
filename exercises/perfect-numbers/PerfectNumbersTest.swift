
import XCTest



class PerfectNumbersTest: XCTestCase {
    
    
    func testPerfect() {
        let numberClassifier = NumberClassifier(number: 6)
        XCTAssertEqual([.Perfect],[numberClassifier.classification])
    }
    
    func testPerfectAgain() {
        let numberClassifier = NumberClassifier(number: 28)
        XCTAssertEqual([.Perfect],[numberClassifier.classification])

        
    }
    
    func testDeficient() {
        let numberClassifier = NumberClassifier(number: 13)
        XCTAssertEqual([.Deficient],[numberClassifier.classification])
        
    }
    
    func testAbundant() {
        let numberClassifier = NumberClassifier(number: 12)
        XCTAssertEqual([.Abundant],[numberClassifier.classification])

        
    }
    
}
