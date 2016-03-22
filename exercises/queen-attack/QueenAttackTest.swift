import XCTest



class QueenAttackTest: XCTestCase {
    
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
        var throwsIncorrectNumberOfCoordinates = false
        
        defer {
            XCTAssertTrue(throwsIncorrectNumberOfCoordinates)
        }
        
        do {
            let _ = try Queens(white: [1, 2, 3], black: [4, 5])
        } catch Queens.InitError.IncorrectNumberOfCoordinates {
            throwsIncorrectNumberOfCoordinates = true
        } catch {
            return
        }
    }
    
    func testInvalidCoordinates() {
        var throwsInvalidCoordinates = false
        
        defer {
            XCTAssertTrue(throwsInvalidCoordinates)
        }
        
        do {
            let _ = try Queens(white: [-3, 0], black: [2, 481])
        } catch Queens.InitError.InvalidCoordinates {
            throwsInvalidCoordinates = true
        } catch {
            return
        }
    }
    
    func testCannotOccupySameSpace() {
        var throwsSameSpaceError = false
        
        defer {
            XCTAssertTrue(throwsSameSpaceError)
        }
        
        do {
            let _ = try Queens(white: [2, 4], black: [2, 4])
        } catch Queens.InitError.SameSpace {
            throwsSameSpaceError = true
        } catch {
            return
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
}