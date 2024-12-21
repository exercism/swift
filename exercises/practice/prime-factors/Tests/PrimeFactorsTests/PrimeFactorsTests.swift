import Foundation
import Testing

@testable import PrimeFactors

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct PrimeFactorsTests {

  @Test("no factors")
  func testNoFactors() {
    #expect(primeFactors(1) == [])
  }

  @Test("prime number", .enabled(if: RUNALL))
  func testPrimeNumber() {
    #expect(primeFactors(2) == [2])
  }

  @Test("another prime number", .enabled(if: RUNALL))
  func testAnotherPrimeNumber() {
    #expect(primeFactors(3) == [3])
  }

  @Test("square of a prime", .enabled(if: RUNALL))
  func testSquareOfAPrime() {
    #expect(primeFactors(9) == [3, 3])
  }

  @Test("product of first prime", .enabled(if: RUNALL))
  func testProductOfFirstPrime() {
    #expect(primeFactors(4) == [2, 2])
  }

  @Test("cube of a prime", .enabled(if: RUNALL))
  func testCubeOfAPrime() {
    #expect(primeFactors(8) == [2, 2, 2])
  }

  @Test("product of second prime", .enabled(if: RUNALL))
  func testProductOfSecondPrime() {
    #expect(primeFactors(27) == [3, 3, 3])
  }

  @Test("product of third prime", .enabled(if: RUNALL))
  func testProductOfThirdPrime() {
    #expect(primeFactors(625) == [5, 5, 5, 5])
  }

  @Test("product of first and second prime", .enabled(if: RUNALL))
  func testProductOfFirstAndSecondPrime() {
    #expect(primeFactors(6) == [2, 3])
  }

  @Test("product of primes and non-primes", .enabled(if: RUNALL))
  func testProductOfPrimesAndNonPrimes() {
    #expect(primeFactors(12) == [2, 2, 3])
  }

  @Test("product of primes", .enabled(if: RUNALL))
  func testProductOfPrimes() {
    #expect(primeFactors(901255) == [5, 17, 23, 461])
  }

  @Test("factors include a large prime", .enabled(if: RUNALL))
  func testFactorsIncludeALargePrime() {
    #expect(primeFactors(93_819_012_551) == [11, 9539, 894119])
  }
}
