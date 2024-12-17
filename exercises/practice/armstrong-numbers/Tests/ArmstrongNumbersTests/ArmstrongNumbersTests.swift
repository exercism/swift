import Testing
import Foundation

@testable import ArmstrongNumbers

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Test("Zero is an Armstrong number")
func testZeroIsAnArmstrongNumber() {
  #expect(isArmstrongNumber(0))
}

@Test("Single-digit numbers are Armstrong numbers", .enabled(if: RUNALL))
func testSingleDigitNumbersAreArmstrongNumbers() throws {
  #expect(isArmstrongNumber(5))
}

@Test("There are no two-digit Armstrong numbers", .enabled(if: RUNALL))
func testThereAreNoTwoDigitArmstrongNumbers() throws {
  #expect(isArmstrongNumber(10))
}

@Test("Three-digit number that is an Armstrong number", .enabled(if: RUNALL))
func testThreeDigitNumberThatIsAnArmstrongNumber() throws {
  #expect(isArmstrongNumber(153))
}

@Test("Three-digit number that is not an Armstrong number", .enabled(if: RUNALL))
func testThreeDigitNumberThatIsNotAnArmstrongNumber() throws {
  #expect(isArmstrongNumber(100))
}

@Test("Four-digit number that is an Armstrong number", .enabled(if: RUNALL))
func testFourDigitNumberThatIsAnArmstrongNumber() throws {
  #expect(isArmstrongNumber(9474))
}

@Test("Four-digit number that is not an Armstrong number", .enabled(if: RUNALL))
func testFourDigitNumberThatIsNotAnArmstrongNumber() throws {
  #expect(isArmstrongNumber(9475))
}

@Test("Seven-digit number that is an Armstrong number", .enabled(if: RUNALL))
func testSevenDigitNumberThatIsAnArmstrongNumber() throws {
  #expect(isArmstrongNumber(9_926_315))
}

@Test("Seven-digit number that is not an Armstrong number", .enabled(if: RUNALL))
func testSevenDigitNumberThatIsNotAnArmstrongNumber() throws {
  #expect(isArmstrongNumber(9_926_314))
}

@Test("Armstrong number containing seven zeroes", .enabled(if: RUNALL))
func testArmstrongNumberContainingSevenZeroes() throws {
  #expect(isArmstrongNumber(186_709_961_001_538_790_100_634_132_976_990))
}

@Test("The largest and last Armstrong number", .enabled(if: RUNALL))
func testTheLargestAndLastArmstrongNumber() throws {
  #expect(isArmstrongNumber(115_132_219_018_763_992_565_095_597_973_971_522_401))
}
