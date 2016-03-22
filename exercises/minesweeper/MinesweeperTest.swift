import XCTest



class MinesweeperTest: XCTestCase {
    
    func testTransform1() {
        let input = ["+------+", "| *  * |", "|  *   |", "|    * |", "|   * *|",
        "| *  * |", "|      |", "+------+"]
        let output = ["+------+", "|1*22*1|", "|12*322|", "| 123*2|", "|112*4*|",
        "|1*22*2|", "|111111|", "+------+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func testTransform2() {
        let input = ["+-----+", "| * * |", "|     |", "|   * |", "|  * *|",
        "| * * |", "+-----+"]
        let output = ["+-----+", "|1*2*1|", "|11322|", "| 12*2|", "|12*4*|",
        "|1*3*2|", "+-----+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func testTransform3() {
        let input = ["+-----+", "| * * |", "+-----+"]
        let output = ["+-----+", "|1*2*1|", "+-----+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func test_transform4() {
        let input = ["+-+", "|*|", "| |", "|*|", "| |", "| |", "+-+"]
        let output = ["+-+", "|*|", "|2|", "|*|", "|1|", "| |", "+-+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func testTransform5() {
        let input = ["+-+", "|*|", "+-+"]
        let output = ["+-+", "|*|", "+-+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func testTransform6() {
        let input = ["+--+", "|**|", "|**|", "+--+"]
        let output = ["+--+", "|**|", "|**|", "+--+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func testTransform7() {
        let input = ["+--+", "|**|", "|**|", "+--+"]
        let output = ["+--+", "|**|", "|**|", "+--+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func testTransform8() {
        let input = ["+---+", "|***|", "|* *|", "|***|", "+---+"]
        let output = ["+---+", "|***|", "|*8*|", "|***|", "+---+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func testTransform9() {
        let input = ["+-----+", "|     |", "|   * |", "|     |", "|     |",
        "| *   |", "+-----+"]
        let output = ["+-----+", "|  111|", "|  1*1|", "|  111|", "|111  |",
        "|1*1  |", "+-----+"]
        XCTAssertEqual(output, try! Board(input).transform())
    }
    
    func testDifferentLength() {
        var throwsDifferentLengthError = false
        
        defer {
            XCTAssertTrue(throwsDifferentLengthError)
        }
        
        let input = ["+-+", "| |", "|*  |", "|  |", "+-+"]
        do {
            let _ = try Board(input)
        } catch Board.Error.DifferentLength {
            throwsDifferentLengthError = true
        } catch {
            return
        }
    }
    
    func testFaultyBorder() {
        var throwsFaultyBorderError = false
        
        defer {
            XCTAssertTrue(throwsFaultyBorderError)
        }
        
        let input = ["+-----+", "*   * |", "+-- --+"]
        do {
            let _ = try Board(input)
        } catch Board.Error.FaultyBorder {
            throwsFaultyBorderError = true
        } catch {
            return
        }
    }
    
    func testInvalidCharacter() {
        var throwsInvalidCharacterError = false
        
        defer {
            XCTAssertTrue(throwsInvalidCharacterError)
        }
        
        let input = ["+-----+", "|X  * |", "+-----+"]
        do {
            let _ = try Board(input)
        } catch Board.Error.InvalidCharacter {
            throwsInvalidCharacterError = true
        } catch {
            return
        }
    }
    
}
