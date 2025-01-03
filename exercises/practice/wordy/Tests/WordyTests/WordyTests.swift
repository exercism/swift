import Foundation
import Testing

@testable import Wordy

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct WordyTests {

  @Test("just a number")
  func testJustANumber() {
    #expect(try! wordyAnswer("What is 5?") == 5)
  }

  @Test("addition", .enabled(if: RUNALL))
  func testAddition() {
    #expect(try! wordyAnswer("What is 1 plus 1?") == 2)
  }

  @Test("more addition", .enabled(if: RUNALL))
  func testMoreAddition() {
    #expect(try! wordyAnswer("What is 53 plus 2?") == 55)
  }

  @Test("addition with negative numbers", .enabled(if: RUNALL))
  func testAdditionWithNegativeNumbers() {
    #expect(try! wordyAnswer("What is -1 plus -10?") == -11)
  }

  @Test("large addition", .enabled(if: RUNALL))
  func testLargeAddition() {
    #expect(try! wordyAnswer("What is 123 plus 45678?") == 45801)
  }

  @Test("subtraction", .enabled(if: RUNALL))
  func testSubtraction() {
    #expect(try! wordyAnswer("What is 4 minus -12?") == 16)
  }

  @Test("multiplication", .enabled(if: RUNALL))
  func testMultiplication() {
    #expect(try! wordyAnswer("What is -3 multiplied by 25?") == -75)
  }

  @Test("division", .enabled(if: RUNALL))
  func testDivision() {
    #expect(try! wordyAnswer("What is 33 divided by -3?") == -11)
  }

  @Test("multiple additions", .enabled(if: RUNALL))
  func testMultipleAdditions() {
    #expect(try! wordyAnswer("What is 1 plus 1 plus 1?") == 3)
  }

  @Test("addition and subtraction", .enabled(if: RUNALL))
  func testAdditionAndSubtraction() {
    #expect(try! wordyAnswer("What is 1 plus 5 minus -2?") == 8)
  }

  @Test("multiple subtraction", .enabled(if: RUNALL))
  func testMultipleSubtraction() {
    #expect(try! wordyAnswer("What is 20 minus 4 minus 13?") == 3)
  }

  @Test("subtraction then addition", .enabled(if: RUNALL))
  func testSubtractionThenAddition() {
    #expect(try! wordyAnswer("What is 17 minus 6 plus 3?") == 14)
  }

  @Test("multiple multiplication", .enabled(if: RUNALL))
  func testMultipleMultiplication() {
    #expect(try! wordyAnswer("What is 2 multiplied by -2 multiplied by 3?") == -12)
  }

  @Test("addition and multiplication", .enabled(if: RUNALL))
  func testAdditionAndMultiplication() {
    #expect(try! wordyAnswer("What is -3 plus 7 multiplied by -2?") == -8)
  }

  @Test("multiple division", .enabled(if: RUNALL))
  func testMultipleDivision() {
    #expect(try! wordyAnswer("What is -12 divided by 2 divided by -3?") == 2)
  }

  @Test("unknown operation", .enabled(if: RUNALL))
  func testUnknownOperation() {
    #expect(throws: WordyError.syntaxError) {
      try wordyAnswer("What is 52 cubed?")
    }
  }

  @Test("Non math question", .enabled(if: RUNALL))
  func testNonMathQuestion() {
    #expect(throws: WordyError.syntaxError) {
      try wordyAnswer("Who is the President of the United States?")
    }
  }

  @Test("reject problem missing an operand", .enabled(if: RUNALL))
  func testRejectProblemMissingAnOperand() {
    #expect(throws: WordyError.syntaxError) {
      try wordyAnswer("What is 1 plus?")
    }
  }

  @Test("reject problem with no operands or operators", .enabled(if: RUNALL))
  func testRejectProblemWithNoOperandsOrOperators() {
    #expect(throws: WordyError.syntaxError) {
      try wordyAnswer("What is?")
    }
  }

  @Test("reject two operations in a row", .enabled(if: RUNALL))
  func testRejectTwoOperationsInARow() {
    #expect(throws: WordyError.syntaxError) {
      try wordyAnswer("What is 1 plus plus 2?")
    }
  }

  @Test("reject two numbers in a row", .enabled(if: RUNALL))
  func testRejectTwoNumbersInARow() {
    #expect(throws: WordyError.syntaxError) {
      try wordyAnswer("What is 1 plus 2 1?")
    }
  }

  @Test("reject postfix notation", .enabled(if: RUNALL))
  func testRejectPostfixNotation() {
    #expect(throws: WordyError.syntaxError) {
      try wordyAnswer("What is 1 2 plus?")
    }
  }

  @Test("reject prefix notation", .enabled(if: RUNALL))
  func testRejectPrefixNotation() {
    #expect(throws: WordyError.syntaxError) {
      try wordyAnswer("What is plus 1 2?")
    }
  }
}
