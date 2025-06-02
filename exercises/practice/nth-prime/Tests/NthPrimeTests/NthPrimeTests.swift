import Foundation
import Testing

@testable import NthPrime

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct NthPrimeTests {

  @Test("first prime")
  func testFirstPrime() {
    #expect(try! nthPrime(1) == 2)
  }

  @Test("second prime", .enabled(if: RUNALL))
  func testSecondPrime() {
    #expect(try! nthPrime(2) == 3)
  }

  @Test("sixth prime", .enabled(if: RUNALL))
  func testSixthPrime() {
    #expect(try! nthPrime(6) == 13)
  }

  @Test("big prime", .enabled(if: RUNALL))
  func testBigPrime() {
    #expect(try! nthPrime(10001) == 104743)
  }

  @Test("there is no zeroth prime", .enabled(if: RUNALL))
  func testThereIsNoZerothPrime() {
    #expect(throws: PrimeError.noZerothPrime) { try nthPrime(0) }
  }
}
