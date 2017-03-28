import XCTest
@testable import Bob

class BobTests: XCTestCase {

    func testStatingSomething() {
        let input = "Tom-ay-to, tom-aaaah-to."
        let expected = "Whatever."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testShouting() {
        let input = "WATCH OUT!"
        let expected = "Whoa, chill out!"
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testAskingAQustion() {
        let input = "Does this cryogenic chamber make me look fat?"
        let expected = "Sure."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testTalkingForcefully() {
        let input = "Let's go make out behind the gym!"
        let expected = "Whatever."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testUsingAcronyms() {
        let input = "It's OK if you don't want to go to the DMV."
        let expected = "Whatever."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testForcefulQuestions() {
        let input = "WHAT THE HELL WERE YOU THINKING?"
        let expected = "Whoa, chill out!"
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testShoutingNumbers() {
        let input = "1, 2, 3 GO!"
        let expected = "Whoa, chill out!"
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testOnlyNumbers() {
        let input = "1, 2, 3."
        let expected = "Whatever."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testQuestionWithOnlyNumbers() {
        let input = "4?"
        let expected = "Sure."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testShoutingWithSpecialCharacters() {
        let input = "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"
        let expected = "Whoa, chill out!"
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testShoutingWithUmlautsCharacters() {
        let input = "ÄMLÄTS!"
        let expected = "Whoa, chill out!"
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testCalmlySpeakingAboutUmlauts() {
        let input = "ÄMLäTS!"
        let expected = "Whatever."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testShoutingWithNoExclamationmark() {
        let input = "I HATE YOU"
        let expected = "Whoa, chill out!"
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testStatementContainingQuestionsMark() {
        let input = "Ending with a ? means a question."
        let expected = "Whatever."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testPrattlingOn() {
        let input = "Wait! Hang on.  Are you going to be OK?"
        let expected = "Sure."
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testSilence() {
        let input = ""
        let expected = "Fine. Be that way!"
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    func testProlongedSilence() {
        let input = "     "
        let expected = "Fine. Be that way!"
        let result = Bob.hey(input)
        XCTAssertEqual(expected, result)
    }

    static var allTests: [(String, (BobTests) -> () throws -> Void)] {
        return [
            ("testStatingSomething", testStatingSomething),
            ("testShouting", testShouting),
            ("testAskingAQustion", testAskingAQustion),
            ("testTalkingForcefully", testTalkingForcefully),
            ("testUsingAcronyms", testUsingAcronyms),
            ("testForcefulQuestions", testForcefulQuestions),
            ("testShoutingNumbers", testShoutingNumbers),
            ("testOnlyNumbers", testOnlyNumbers),
            ("testQuestionWithOnlyNumbers", testQuestionWithOnlyNumbers),
            ("testShoutingWithSpecialCharacters", testShoutingWithSpecialCharacters),
            ("testShoutingWithUmlautsCharacters", testShoutingWithUmlautsCharacters),
            ("testCalmlySpeakingAboutUmlauts", testCalmlySpeakingAboutUmlauts),
            ("testShoutingWithNoExclamationmark", testShoutingWithNoExclamationmark),
            ("testStatementContainingQuestionsMark", testStatementContainingQuestionsMark),
            ("testPrattlingOn", testPrattlingOn),
            ("testSilence", testSilence),
            ("testProlongedSilence", testProlongedSilence),
        ]
    }
}
