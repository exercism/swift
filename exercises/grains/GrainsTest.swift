
import XCTest




class GrainsTest: XCTestCase {
    
    func testInvalidInput1() {
        var throwsInputTooHighError = false
        
        defer {
            XCTAssertTrue(throwsInputTooHighError)
        }
        
        do {
            let _ = try Grains.square(65)
        } catch Grains.Error.inputTooHigh(let message) {
            throwsInputTooHighError = true
            XCTAssertTrue(message == "Input[65] invalid. Input should be between 1 and 64 (inclusive)")
        } catch {
            return
        }
        
    }
    
    func testInvalidInput2() {
        var throwsInputTooLowError = false
        
        defer {
            XCTAssertTrue(throwsInputTooLowError)
        }
        
        do {
            let _ = try Grains.square(0)
        } catch Grains.Error.inputTooLow(let message) {
            throwsInputTooLowError = true
            XCTAssertTrue(message == "Input[0] invalid. Input should be between 1 and 64 (inclusive)")
        } catch {
            return
        }
    }
    
    func testInvalidInput3() {
        var throwsInputTooLowError = false
        
        defer {
            XCTAssertTrue(throwsInputTooLowError)
        }
        
        do {
            let _ = try Grains.square(-1)
        } catch Grains.Error.inputTooLow(let message) {
            throwsInputTooLowError = true
            XCTAssertTrue(message == "Input[-1] invalid. Input should be between 1 and 64 (inclusive)")
        } catch {
            return
        }
    }
    
    func testSquare1() {
        XCTAssertEqual(try! Grains.square(1), 1)
    }
    
    func testSquare2() {
        XCTAssertEqual(try! Grains.square(2), 2)
    }

    func testSquare3() {
        XCTAssertEqual(try! Grains.square(3), 4)
    }

    func testSquare4() {
        XCTAssertEqual(try! Grains.square(4), 8)
    }

    func testSquare16() {
        XCTAssertEqual(try! Grains.square(16), 32_768)
    }

    func testSquare32() {
        XCTAssertEqual(try! Grains.square(32), 2_147_483_648)
    }

    func testSquare64() {
        XCTAssertEqual(try! Grains.square(64), 9_223_372_036_854_775_808)
    }
    
    func testTotalGrains() {
        XCTAssertEqual(Grains.total, 18_446_744_073_709_551_615)
    }
}
