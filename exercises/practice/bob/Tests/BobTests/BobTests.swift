import XCTest

@testable import Bob

class BobTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testStatingSomething() {
    XCTAssertEqual("Whatever.", Bob.response("Tom-ay-to, tom-aaaah-to."))
  }

  func testShouting() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whoa, chill out!", Bob.response("WATCH OUT!"))
  }

  func testShoutingGibberish() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whoa, chill out!", Bob.response("FCECDFCAAB"))
  }

  func testAskingAQuestion() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Sure.", Bob.response("Does this cryogenic chamber make me look fat?"))
  }

  func testAskingANumericQuestion() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Sure.", Bob.response("You are, what, like 15?"))
  }

  func testAskingGibberish() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Sure.", Bob.response("fffbbcbeab?"))
  }

  func testTalkingForcefully() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whatever.", Bob.response("Hi there!"))
  }

  func testUsingAcronymsInRegularSpeech() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whatever.", Bob.response("It's OK if you don't want to go work for NASA."))
  }

  func testForcefulQuestion() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Calm down, I know what I'm doing!", Bob.response("WHAT'S GOING ON?"))
  }

  func testShoutingNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whoa, chill out!", Bob.response("1, 2, 3 GO!"))
  }

  func testNoLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whatever.", Bob.response("1, 2, 3"))
  }

  func testQuestionWithNoLetters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Sure.", Bob.response("4?"))
  }

  func testShoutingWithSpecialCharacters() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      "Whoa, chill out!", Bob.response("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))
  }

  func testShoutingWithNoExclamationMark() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whoa, chill out!", Bob.response("I HATE THE DENTIST"))
  }

  func testStatementContainingQuestionMark() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whatever.", Bob.response("Ending with ? means a question."))
  }

  func testNonLettersWithQuestion() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Sure.", Bob.response(":) ?"))
  }

  func testPrattlingOn() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Sure.", Bob.response("Wait! Hang on. Are you going to be OK?"))
  }

  func testSilence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Fine. Be that way!", Bob.response(""))
  }

  func testProlongedSilence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Fine. Be that way!", Bob.response("          "))
  }

  func testAlternateSilence() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Fine. Be that way!", Bob.response("\t\t\t\t\t\t\t\t\t\t"))
  }

  func testMultipleLineQuestion() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(
      "Whatever.", Bob.response("\nDoes this cryogenic chamber make me look fat?\nNo."))
  }

  func testStartingWithWhitespace() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whatever.", Bob.response("         hmmmmmmm..."))
  }

  func testEndingWithWhitespace() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Sure.", Bob.response("Okay if like my  spacebar  quite a bit?   "))
  }

  func testOtherWhitespace() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Fine. Be that way!", Bob.response("\n\r \t"))
  }

  func testNonQuestionEndingWithWhitespace() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual("Whatever.", Bob.response("This is a statement ending with whitespace      "))
  }

}
