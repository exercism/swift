import XCTest
@testable import Proverb

class ProverbTests: XCTestCase {

    var proverb =  Proverb()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
     super.tearDown()
    }

    func testZeroPiecesOfProverb() {

        let expectedResult = String()
        let actualResult = proverb.recite([])
        XCTAssertEqual(expectedResult, actualResult)
    }

    func testOnePieceOfProverb() {

        let expectedResult = "And all for the want of a nail."
        let actualResult = proverb.recite(["nail"])
        XCTAssertEqual(expectedResult, actualResult)
    }

    func testTwoPiecesOfProverb() {

        let expectedResult = "For want of a nail the shoe was lost.\nAnd all for the want of a nail."
        let actualResult = proverb.recite(["nail", "shoe"])
        XCTAssertEqual(expectedResult, actualResult)
    }

    func testThreePiecesOfProverb() {

        let expectedResult = "For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nAnd all for the want of a nail."
        let actualResult = proverb.recite(["nail", "shoe", "horse"])
        XCTAssertEqual(expectedResult, actualResult)

    }

    func testFullProverb() {

        let expectedResult = "For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nFor want of a horse the rider was lost.\nFor want of a rider the message was lost.\nFor want of a message the battle was lost.\nFor want of a battle the kingdom was lost.\nAnd all for the want of a nail."
        let actualResult = proverb.recite(["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"])
        XCTAssertEqual(expectedResult, actualResult)
    }

    func testFourPiecesOfProverbModernized() {

        let expectedResult = "For want of a pin the gun was lost.\nFor want of a gun the soldier was lost.\nFor want of a soldier the battle was lost.\nAnd all for the want of a pin."
        let actualResult = proverb.recite(["pin", "gun", "soldier", "battle"])
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    static var allTests: [(String, (ProverbTests) -> () throws -> Void)] {
        return [
            ("testZeroPiecesOfProverb", testZeroPiecesOfProverb),
            ("testOnePieceOfProverb", testOnePieceOfProverb),
            ("testTwoPiecesOfProverb", testTwoPiecesOfProverb),
            ("testThreePiecesOfProverb", testThreePiecesOfProverb),
            ("testFullProverb", testFullProverb),
            ("testFourPiecesOfProverbModernized", testFourPiecesOfProverbModernized),
            
        ]
    }

}
