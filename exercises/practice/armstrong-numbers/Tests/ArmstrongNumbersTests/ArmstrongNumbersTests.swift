import Foundation
import Testing

@testable import ArmstrongNumbers

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct ArmstrongNumbersTests {

  @Test("Zero is an Armstrong number")
  func testZeroIsAnArmstrongNumber() {
    #expect(isArmstrongNumber(0))
  }

  @Test("Single-digit numbers are Armstrong numbers", .enabled(if: RUNALL))
  func testSingleDigitNumbersAreArmstrongNumbers() {
    #expect(isArmstrongNumber(5))
  }

  @Test("There are no two-digit Armstrong numbers", .enabled(if: RUNALL))
  func testThereAreNoTwoDigitArmstrongNumbers() {
    #expect(!isArmstrongNumber(10))
  }

  @Test("Three-digit number that is an Armstrong number", .enabled(if: RUNALL))
  func testThreeDigitNumberThatIsAnArmstrongNumber() {
    #expect(isArmstrongNumber(153))
  }

  @Test("Three-digit number that is not an Armstrong number", .enabled(if: RUNALL))
  func testThreeDigitNumberThatIsNotAnArmstrongNumber() {
    #expect(!isArmstrongNumber(100))
  }

  @Test("Four-digit number that is an Armstrong number", .enabled(if: RUNALL))
  func testFourDigitNumberThatIsAnArmstrongNumber() {
    #expect(isArmstrongNumber(9474))
  }

  @Test("Four-digit number that is not an Armstrong number", .enabled(if: RUNALL))
  func testFourDigitNumberThatIsNotAnArmstrongNumber() {
    #expect(!isArmstrongNumber(9475))
  }

  @Test("Seven-digit number that is an Armstrong number", .enabled(if: RUNALL))
  func testSevenDigitNumberThatIsAnArmstrongNumber() {
    #expect(isArmstrongNumber(9_926_315))
  }

  @Test("Seven-digit number that is not an Armstrong number", .enabled(if: RUNALL))
  func testSevenDigitNumberThatIsNotAnArmstrongNumber() {
    #expect(!isArmstrongNumber(9_926_314))
  }
}
