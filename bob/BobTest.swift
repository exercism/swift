import XCTest

class BobTests: XCTestCase {
    
    func bob() -> Bob {
        return Bob()
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func verify(input: String, againstExpected expected: String) {
        let result = bob().hey(input)
        XCTAssertEqualObjects(expected, result, "")
    }
    
    func testStatingSomething() {
        let input = "Tom-ay-to, tom-aaaah-to."
        let expected = "Whatever."
        verify(input, againstExpected: expected)
    }
    
    func testShouting() {
        let input = "WATCH OUT!"
        let expected = "Woah, chill out!"
        verify(input, againstExpected: expected)
    }
    
    func testAskingAQustion() {
        let input = "Does this cryogenic chamber make me look fat?"
        let expected = "Sure."
        verify(input, againstExpected: expected)
    }
    
    func testTalkingForcefully() {
        let input = "Let's go make out behind the gym!"
        let expected = "Whatever."
        verify(input, againstExpected: expected)
    }
    
    func testUsingAcronyms() {
        let input = "It's OK if you don't want to go to the DMV."
        let expected = "Whatever."
        verify(input, againstExpected: expected)
    }
    
    func testForcefulQuestions() {
        let input = "WHAT THE HELL WERE YOU THINKING?"
        let expected = "Woah, chill out!"
        verify(input, againstExpected: expected)
    }
    
    func testShoutingNumbers() {
        let input = "1, 2, 3 GO!"
        let expected = "Woah, chill out!"
        verify(input, againstExpected: expected)
    }
    
    func testOnlyNumbers() {
        let input = "1, 2, 3."
        let expected = "Whatever."
        verify(input, againstExpected: expected)
    }
    
    func testQuestionWithOnlyNumbers() {
        let input = "4?"
        let expected = "Sure."
        verify(input, againstExpected: expected)
    }
    
    func testShoutingWithSpecialCharacters() {
        let input = "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
        let expected = "Woah, chill out!"
        verify(input, againstExpected: expected)
    }
    
    func testShoutingWithUmlautsCharacters() {
        let input = "ÄMLÄTS!"
        let expected = "Woah, chill out!"
        verify(input, againstExpected: expected)
    }
    
    func testCalmlySpeakingAboutUmlauts() {
        let input = "ÄMLäTS!"
        let expected = "Whatever."
        verify(input, againstExpected: expected)
    }
    
    func testShoutingWithNoExclamationmark() {
        let input = "I HATE YOU"
        let expected = "Woah, chill out!"
        verify(input, againstExpected: expected)
    }
    
    func testStatementContainingQuestionsMark() {
        let input = "Ending with a ? means a question."
        let expected = "Whatever."
        verify(input, againstExpected: expected)
    }
    
    func testPrattlingOn() {
        let input = "Wait! Hang on.  Are you going to be OK?"
        let expected = "Sure."
        verify(input, againstExpected: expected)
    }
    
    func testSilence() {
        let input = ""
        let expected = "Fine, be that way."
        verify(input, againstExpected: expected)
    }
    
    func testProlongedSilence() {
        let input = "     "
        let expected = "Fine, be that way."
        verify(input, againstExpected: expected)
    }
    
    func testExample() {
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        self.measureBlock() {
            // Put the code you want to measure the time of here.
            let bobby = self.bob()
        }
    }
    
}
