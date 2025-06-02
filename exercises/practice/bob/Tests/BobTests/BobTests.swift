import Foundation
import Testing

@testable import Bob

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct BobTests {

  @Test("stating something")
  func testStatingSomething() {
    #expect("Whatever." == Bob.response("Tom-ay-to, tom-aaaah-to."))
  }

  @Test("shouting", .enabled(if: RUNALL))
  func testShouting() {
    #expect("Whoa, chill out!" == Bob.response("WATCH OUT!"))
  }

  @Test("shouting gibberish", .enabled(if: RUNALL))
  func testShoutingGibberish() {
    #expect("Whoa, chill out!" == Bob.response("FCECDFCAAB"))
  }

  @Test("asking a question", .enabled(if: RUNALL))
  func testAskingAQuestion() {
    #expect("Sure." == Bob.response("Does this cryogenic chamber make me look fat?"))
  }

  @Test("asking a numeric question", .enabled(if: RUNALL))
  func testAskingANumericQuestion() {
    #expect("Sure." == Bob.response("You are, what, like 15?"))
  }

  @Test("asking gibberish", .enabled(if: RUNALL))
  func testAskingGibberish() {
    #expect("Sure." == Bob.response("fffbbcbeab?"))
  }

  @Test("talking forcefully", .enabled(if: RUNALL))
  func testTalkingForcefully() {
    #expect("Whatever." == Bob.response("Hi there!"))
  }

  @Test("using acronyms in regular speech", .enabled(if: RUNALL))
  func testUsingAcronymsInRegularSpeech() {
    #expect("Whatever." == Bob.response("It's OK if you don't want to go work for NASA."))
  }

  @Test("forceful question", .enabled(if: RUNALL))
  func testForcefulQuestion() {
    #expect("Calm down, I know what I'm doing!" == Bob.response("WHAT'S GOING ON?"))
  }

  @Test("shouting numbers", .enabled(if: RUNALL))
  func testShoutingNumbers() {
    #expect("Whoa, chill out!" == Bob.response("1, 2, 3 GO!"))
  }

  @Test("no letters", .enabled(if: RUNALL))
  func testNoLetters() {
    #expect("Whatever." == Bob.response("1, 2, 3"))
  }

  @Test("question with no letters", .enabled(if: RUNALL))
  func testQuestionWithNoLetters() {
    #expect("Sure." == Bob.response("4?"))
  }

  @Test("shouting with special characters", .enabled(if: RUNALL))
  func testShoutingWithSpecialCharacters() {
    #expect("Whoa, chill out!" == Bob.response("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))
  }

  @Test("shouting with no exclamation mark", .enabled(if: RUNALL))
  func testShoutingWithNoExclamationMark() {
    #expect("Whoa, chill out!" == Bob.response("I HATE THE DENTIST"))
  }

  @Test("statement containing question mark", .enabled(if: RUNALL))
  func testStatementContainingQuestionMark() {
    #expect("Whatever." == Bob.response("Ending with ? means a question."))
  }

  @Test("non-letters with question", .enabled(if: RUNALL))
  func testNonLettersWithQuestion() {
    #expect("Sure." == Bob.response(":) ?"))
  }

  @Test("prattling on", .enabled(if: RUNALL))
  func testPrattlingOn() {
    #expect("Sure." == Bob.response("Wait! Hang on. Are you going to be OK?"))
  }

  @Test("silence", .enabled(if: RUNALL))
  func testSilence() {
    #expect("Fine. Be that way!" == Bob.response(""))
  }

  @Test("prolonged silence", .enabled(if: RUNALL))
  func testProlongedSilence() {
    #expect("Fine. Be that way!" == Bob.response("          "))
  }

  @Test("alternate silence", .enabled(if: RUNALL))
  func testAlternateSilence() {
    #expect("Fine. Be that way!" == Bob.response("\t\t\t\t\t\t\t\t\t\t"))
  }

  @Test("starting with whitespace", .enabled(if: RUNALL))
  func testStartingWithWhitespace() {
    #expect("Whatever." == Bob.response("         hmmmmmmm..."))
  }

  @Test("ending with whitespace", .enabled(if: RUNALL))
  func testEndingWithWhitespace() {
    #expect("Sure." == Bob.response("Okay if like my  spacebar  quite a bit?   "))
  }

  @Test("other whitespace", .enabled(if: RUNALL))
  func testOtherWhitespace() {
    #expect("Fine. Be that way!" == Bob.response("\n\r \t"))
  }

  @Test("non-question ending with whitespace", .enabled(if: RUNALL))
  func testNonQuestionEndingWithWhitespace() {
    #expect("Whatever." == Bob.response("This is a statement ending with whitespace      "))
  }

  @Test("multiple line question", .enabled(if: RUNALL))
  func testMultipleLineQuestion() {
    #expect("Sure." == Bob.response("\nDoes this cryogenic chamber make\n me look fat?"))
  }

}
