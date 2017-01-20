import XCTest
@testable import QueenAttack

class QueenAttackTests: XCTestCase {
    func testDefaultPositions() {
        let queens = try! Queens()
        XCTAssertEqual([0, 3], queens.white)
        XCTAssertEqual([7, 3], queens.black)
    }

    func testSpecificPlacement() {
        let queens = try! Queens(white: [3, 7], black: [6, 1])
        XCTAssertEqual([3, 7], queens.white)
        XCTAssertEqual([6, 1], queens.black)
    }

    func testMultipleBoardsSimultaneously() {
        let queens1 = try! Queens(white: [3, 7], black: [6, 1])
        let queens2 = try! Queens(white: [5, 4], black: [7, 7])

        XCTAssertEqual([3, 7], queens1.white)
        XCTAssertEqual([6, 1], queens1.black)
        XCTAssertEqual([5, 4], queens2.white)
        XCTAssertEqual([7, 7], queens2.black)
    }

    func testIncorrectNumberOfCoordinates() {
        XCTAssertThrowsError(_ = try Queens(white: [1, 2, 3], black: [4, 5])) { error in
            XCTAssertEqual(error as? Queens.InitError, .incorrectNumberOfCoordinates)
        }
    }

    func testInvalidCoordinates() {
        XCTAssertThrowsError(_ = try Queens(white: [-3, 0], black: [2, 481])) { error in
            XCTAssertEqual(error as? Queens.InitError, .invalidCoordinates)
        }
    }

    func testCannotOccupySameSpace() {
        XCTAssertThrowsError(_ = try Queens(white: [2, 4], black: [2, 4])) { error in
            XCTAssertEqual(error as? Queens.InitError, .sameSpace)
        }
    }

    func testStringRepresentation() {
        let queens = try! Queens(white: [2, 4], black: [6, 6])
        let board = "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ W _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ B _\n" +
        "_ _ _ _ _ _ _ _"
        XCTAssertEqual(board, queens.description)
    }

    func testAnotherStringRepresentation() {
        let queens = try! Queens(white: [7, 1], black: [0, 0])
        let board = "B _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
        "_ W _ _ _ _ _ _"
        XCTAssertEqual(board, queens.description)
    }

    func testYetAnotherStringRepresentation() {
        let queens = try! Queens(white: [4, 3], black: [3, 4])
        let board = "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ B _ _ _\n" +
            "_ _ _ W _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
            "_ _ _ _ _ _ _ _\n" +
        "_ _ _ _ _ _ _ _"
        XCTAssertEqual(board, queens.description)
    }

    func testCannotAttack() {
        let queens = try! Queens(white: [2, 3], black: [4, 7])
        XCTAssertFalse(queens.canAttack)
    }

    func testCanAttackOnSameRow() {
        let queens = try! Queens(white: [2, 4], black: [2, 7])
        XCTAssertTrue(queens.canAttack)
    }

    func testCanAttackOnSameColumn() {
        let queens = try! Queens(white: [5, 4], black: [2, 4])
        XCTAssertTrue(queens.canAttack)
    }

    func testCanAttackOnDiagonal() {
        let queens = try! Queens(white: [1, 1], black: [6, 6])
        XCTAssertTrue(queens.canAttack)
    }

    func testCanAttackOnOtherDiagonal() {
        let queens = try! Queens(white: [0, 6], black: [1, 7])
        XCTAssertTrue(queens.canAttack)
    }

    func testCanAttackOnYetAnotherDiagonal() {
        let queens = try! Queens(white: [4, 1], black: [6, 3])
        XCTAssertTrue(queens.canAttack)
    }

    func testCanAttackOnADiagonalSlantedTheOtherWay() {
        let queens = try! Queens(white: [6, 1], black: [1, 6])
        XCTAssertTrue(queens.canAttack)
    }

    static var allTests: [(String, (QueenAttackTests) -> () throws -> Void)] {
        return [
            ("testDefaultPositions", testDefaultPositions),
            ("testSpecificPlacement", testSpecificPlacement),
            ("testMultipleBoardsSimultaneously", testMultipleBoardsSimultaneously),
            ("testIncorrectNumberOfCoordinates", testIncorrectNumberOfCoordinates),
            ("testInvalidCoordinates", testInvalidCoordinates),
            ("testCannotOccupySameSpace", testCannotOccupySameSpace),
            ("testStringRepresentation", testStringRepresentation),
            ("testAnotherStringRepresentation", testAnotherStringRepresentation),
            ("testYetAnotherStringRepresentation", testYetAnotherStringRepresentation),
            ("testCannotAttack", testCannotAttack),
            ("testCanAttackOnSameRow", testCanAttackOnSameRow),
            ("testCanAttackOnSameColumn", testCanAttackOnSameColumn),
            ("testCanAttackOnDiagonal", testCanAttackOnDiagonal),
            ("testCanAttackOnOtherDiagonal", testCanAttackOnOtherDiagonal),
            ("testCanAttackOnYetAnotherDiagonal", testCanAttackOnYetAnotherDiagonal),
            ("testCanAttackOnADiagonalSlantedTheOtherWay", testCanAttackOnADiagonalSlantedTheOtherWay),
        ]
    }
}
