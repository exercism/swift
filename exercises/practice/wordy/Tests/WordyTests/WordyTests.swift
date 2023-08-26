import XCTest

@testable import Wordy

class WordyTests: XCTestCase {
  let runAll = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

  func testJustANumber() {
    XCTAssertEqual(try! wordyAnswer("What is 5?"), 5)
  }

  func testAddition() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 1 plus 1?"), 2)
  }

  func testMoreAddition() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 53 plus 2?"), 55)
  }

  func testAdditionWithNegativeNumbers() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is -1 plus -10?"), -11)
  }

  func testLargeAddition() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 123 plus 45678?"), 45801)
  }

  func testSubtraction() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 4 minus -12?"), 16)
  }

  func testMultiplication() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is -3 multiplied by 25?"), -75)
  }

  func testDivision() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 33 divided by -3?"), -11)
  }

  func testMultipleAdditions() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 1 plus 1 plus 1?"), 3)
  }

  func testAdditionAndSubtraction() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 1 plus 5 minus -2?"), 8)
  }

  func testMultipleSubtraction() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 20 minus 4 minus 13?"), 3)
  }

  func testSubtractionThenAddition() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 17 minus 6 plus 3?"), 14)
  }

  func testMultipleMultiplication() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is 2 multiplied by -2 multiplied by 3?"), -12)
  }

  func testAdditionAndMultiplication() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is -3 plus 7 multiplied by -2?"), -8)
  }

  func testMultipleDivision() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertEqual(try! wordyAnswer("What is -12 divided by 2 divided by -3?"), 2)
  }

  func testUnknownOperation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try wordyAnswer("What is 52 cubed?")) { error in
      XCTAssertEqual(error as? WordyError, .syntaxError)
    }
  }

  func testNonMathQuestion() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try wordyAnswer("Who is the President of the United States?")) { error in
      XCTAssertEqual(error as? WordyError, .syntaxError)
    }
  }

  func testRejectProblemMissingAnOperand() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try wordyAnswer("What is 1 plus?")) { error in
      XCTAssertEqual(error as? WordyError, .syntaxError)
    }
  }

  func testRejectProblemWithNoOperandsOrOperators() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try wordyAnswer("What is?")) { error in
      XCTAssertEqual(error as? WordyError, .syntaxError)
    }
  }

  func testRejectTwoOperationsInARow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try wordyAnswer("What is 1 plus plus 2?")) { error in
      XCTAssertEqual(error as? WordyError, .syntaxError)
    }
  }

  func testRejectTwoNumbersInARow() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try wordyAnswer("What is 1 plus 2 1?")) { error in
      XCTAssertEqual(error as? WordyError, .syntaxError)
    }
  }

  func testRejectPostfixNotation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try wordyAnswer("What is 1 2 plus?")) { error in
      XCTAssertEqual(error as? WordyError, .syntaxError)
    }
  }

  func testRejectPrefixNotation() throws {
    try XCTSkipIf(true && !runAll)  // change true to false to run this test
    XCTAssertThrowsError(try wordyAnswer("What is plus 1 2?")) { error in
      XCTAssertEqual(error as? WordyError, .syntaxError)
    }
  }
}
