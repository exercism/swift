import Foundation
import Testing

@testable import Say

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SayTests {

  @Test("zero")
  func testZero() {
    #expect(try! say(number: 0) == "zero")
  }

  @Test("one", .enabled(if: RUNALL))
  func testOne() {
    #expect(try! say(number: 1) == "one")
  }

  @Test("fourteen", .enabled(if: RUNALL))
  func testFourteen() {
    #expect(try! say(number: 14) == "fourteen")
  }

  @Test("twenty", .enabled(if: RUNALL))
  func testTwenty() {
    #expect(try! say(number: 20) == "twenty")
  }

  @Test("twenty-two", .enabled(if: RUNALL))
  func testTwentyTwo() {
    #expect(try! say(number: 22) == "twenty-two")
  }

  @Test("thirty", .enabled(if: RUNALL))
  func testThirty() {
    #expect(try! say(number: 30) == "thirty")
  }

  @Test("ninety-nine", .enabled(if: RUNALL))
  func testNinetyNine() {
    #expect(try! say(number: 99) == "ninety-nine")
  }

  @Test("one hundred", .enabled(if: RUNALL))
  func testOneHundred() {
    #expect(try! say(number: 100) == "one hundred")
  }

  @Test("one hundred twenty-three", .enabled(if: RUNALL))
  func testOneHundredTwentyThree() {
    #expect(try! say(number: 123) == "one hundred twenty-three")
  }

  @Test("two hundred", .enabled(if: RUNALL))
  func testTwoHundred() {
    #expect(try! say(number: 200) == "two hundred")
  }

  @Test("nine hundred ninety-nine", .enabled(if: RUNALL))
  func testNineHundredNinetyNine() {
    #expect(try! say(number: 999) == "nine hundred ninety-nine")
  }

  @Test("one thousand", .enabled(if: RUNALL))
  func testOneThousand() {
    #expect(try! say(number: 1000) == "one thousand")
  }

  @Test("one thousand two hundred thirty-four", .enabled(if: RUNALL))
  func testOneThousandTwoHundredThirtyFour() {
    #expect(try! say(number: 1234) == "one thousand two hundred thirty-four")
  }

  @Test("one million", .enabled(if: RUNALL))
  func testOneMillion() {
    #expect(try! say(number: 1_000_000) == "one million")
  }

  @Test("one million two thousand three hundred forty-five", .enabled(if: RUNALL))
  func testOneMillionTwoThousandThreeHundredFortyFive() {
    #expect(try! say(number: 1_002_345) == "one million two thousand three hundred forty-five")
  }

  @Test("one billion", .enabled(if: RUNALL))
  func testOneBillion() {
    #expect(try! say(number: 1_000_000_000) == "one billion")
  }

  @Test("a big number", .enabled(if: RUNALL))
  func testABigNumber() {
    #expect(
      try! say(number: 987_654_321_123)
        == "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three"
    )
  }

  @Test("numbers below zero are out of range", .enabled(if: RUNALL))
  func testNumbersBelowZeroAreOutOfRange() {
    #expect(throws: SayError.outOfRange) {
      try say(number: -1)
    }
  }

  @Test("numbers above 999,999,999,999 are out of range", .enabled(if: RUNALL))
  func testNumbersAbove999999999999AreOutOfRange() {
    #expect(throws: SayError.outOfRange) {
      try say(number: 1_000_000_000_000)
    }
  }
}
