import Foundation
import RealModule
import Testing

@testable import SpaceAge

let RUNALL = Bool(ProcessInfo.processInfo.environment["RUNALL", default: "false"]) ?? false

@Suite struct SpaceAgeTests {

  @Test("age on Earth")
  func testAgeOnEarth() {
    let age = SpaceAge(1_000_000_000)
    #expect(age.onEarth.isApproximatelyEqual(to: 31.69, relativeTolerance: 0.03))
  }

  @Test("age on Mercury", .enabled(if: RUNALL))
  func testAgeOnMercury() {
    let age = SpaceAge(2_134_835_688)
    #expect(age.onMercury.isApproximatelyEqual(to: 280.88, relativeTolerance: 0.03))
  }

  @Test("age on Venus", .enabled(if: RUNALL))
  func testAgeOnVenus() {
    let age = SpaceAge(189_839_836)
    #expect(age.onVenus.isApproximatelyEqual(to: 9.78, relativeTolerance: 0.03))
  }

  @Test("age on Mars", .enabled(if: RUNALL))
  func testAgeOnMars() {
    let age = SpaceAge(2_129_871_239)
    #expect(age.onMars.isApproximatelyEqual(to: 35.88, relativeTolerance: 0.03))
  }

  @Test("age on Jupiter", .enabled(if: RUNALL))
  func testAgeOnJupiter() {
    let age = SpaceAge(901_876_382)
    #expect(age.onJupiter.isApproximatelyEqual(to: 2.41, relativeTolerance: 0.03))
  }

  @Test("age on Saturn", .enabled(if: RUNALL))
  func testAgeOnSaturn() {
    let age = SpaceAge(2_000_000_000)
    #expect(age.onSaturn.isApproximatelyEqual(to: 2.15, relativeTolerance: 0.03))
  }

  @Test("age on Uranus", .enabled(if: RUNALL))
  func testAgeOnUranus() {
    let age = SpaceAge(1_210_123_456)
    #expect(age.onUranus.isApproximatelyEqual(to: 0.46, relativeTolerance: 0.03))
  }

  @Test("age on Neptune", .enabled(if: RUNALL))
  func testAgeOnNeptune() {
    let age = SpaceAge(1_821_023_456)
    #expect(age.onNeptune.isApproximatelyEqual(to: 0.35, relativeTolerance: 0.03))
  }
}
