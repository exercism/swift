import XCTest


class WordyTest: XCTestCase {
    
    // Swift does not have native error handling but we can emulate it by using ?? and optionals
    var errorInt:Int = 0
    
    func testAdd1() {
        XCTAssertEqual(2, WordProblem("What is 1 plus 1?").answer ?? errorInt)
    }
    
    func testAdd2() {
        XCTAssertEqual(55, WordProblem("What is 53 plus 2?").answer ?? errorInt)
    }
    
    func testAddNegativeNumbers() {
        XCTAssertEqual(-11, WordProblem("What is -1 plus -10?").answer ?? errorInt ) }
    
    func testAddMoreDigits() {
        XCTAssertEqual(45_801, WordProblem("What is 123 plus 45678?").answer ?? errorInt)
    }
    
    func testSubtract() {
        XCTAssertEqual(16, WordProblem("What is 4 minus -12?").answer ?? errorInt)
    }
    
    func testMultiply() {
        XCTAssertEqual(-75, WordProblem("What is -3 multiplied by 25?").answer ?? errorInt) }
    
    func testDivide() {
        XCTAssertEqual(-11, WordProblem("What is 33 divided by -3?").answer ?? errorInt) }
    
    func testAddTwice() {
        let question = "What is 1 plus 1 plus 1?"
        XCTAssertEqual(3, WordProblem(question).answer ?? errorInt)
    }
    
    func testAddThenSubtract() {
        let question = "What is 1 plus 5 minus -2?"
        XCTAssertEqual(8, WordProblem(question).answer ?? errorInt)
    }
    
    func testSubtractTwice() {
        let question = "What is 20 minus 4 minus 13?"
        XCTAssertEqual(3, WordProblem(question).answer ?? errorInt)
    }
    
    func testSubtractThenAdd() {
        let question = "What is 17 minus 6 plus 3?"
        XCTAssertEqual(14, WordProblem(question).answer ?? errorInt)
    }
    
    func testMultiplyTwice() {
        let question = "What is 2 multiplied by -2 multiplied by 3?"
        XCTAssertEqual(-12, WordProblem(question).answer ?? errorInt) }
    
    func testAddThenMultiply() {
        let question = "What is -3 plus 7 multiplied by -2?"
        XCTAssertEqual(-8, WordProblem(question).answer ?? errorInt) }
    
    func testDivideTwice() {
        let question = "What is -12 divided by 2 divided by -3?"
        XCTAssertEqual(2, WordProblem(question).answer ?? errorInt)
    }
    
    func testTooAdvanced() {
        XCTAssertNil(WordProblem("What is 53 cubed?").answer)
    }
    
    func testIrrelevant() {
        XCTAssertNil(WordProblem("Who is the president of the United States?").answer) }
    
}
