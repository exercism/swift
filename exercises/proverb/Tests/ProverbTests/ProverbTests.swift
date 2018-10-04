import XCTest
@testable import Proverb

class ProverbTests: XCTestCase {

    func testZeroPiecesOfProverb() {

        let expectedResult = ""
        let actualResult = [String]().recite()
        XCTAssertEqual(expectedResult, actualResult)
    }

    func testOnePieceOfProverb() {

        let expectedResult = "And all for the want of a nail."
        let actualResult = ["nail"].recite()
        XCTAssertEqual(expectedResult, actualResult)
    }

    func testTwoPiecesOfProverb() {

        let expectedResult = "For want of a nail the shoe was lost.\nAnd all for the want of a nail."
        let actualResult = ["nail", "shoe"].recite()
        XCTAssertEqual(expectedResult, actualResult)
    }

    func testThreePiecesOfProverb() {

        let expectedResult = "For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nAnd all for the want of a nail."
        let actualResult = ["nail", "shoe", "horse"].recite()
        XCTAssertEqual(expectedResult, actualResult)

    }

    func testFullProverb() {

        let expectedResult = "For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nFor want of a horse the rider was lost.\nFor want of a rider the message was lost.\nFor want of a message the battle was lost.\nFor want of a battle the kingdom was lost.\nAnd all for the want of a nail."
        let actualResult = ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"].recite()
        XCTAssertEqual(expectedResult, actualResult)
    }

    func testFourPiecesOfProverbModernized() {

        let expectedResult = "For want of a pin the gun was lost.\nFor want of a gun the soldier was lost.\nFor want of a soldier the battle was lost.\nAnd all for the want of a pin."
        let actualResult = ["pin", "gun", "soldier", "battle"].recite()
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
